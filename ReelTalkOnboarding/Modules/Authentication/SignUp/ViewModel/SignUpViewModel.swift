//
//  SignUpViewModel.swift
//  ReelTalk
//
//  Created by Aafaq Ahmed Saqi on 21/10/2023.
//

import Foundation
import SwiftUI
import GoogleSignIn
import Firebase
import AuthenticationServices
import CryptoKit
import FacebookLogin


class SignUpViewModel: NSObject, ObservableObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
 

    
    private var currentNonce: String?
    @Published var errorMessage = ""
    @Published var displayName = ""
   
    func signInWithFacebook(completion: @escaping (Bool, Error?) -> Void) {
           let loginManager = LoginManager()
           loginManager.logIn(permissions: ["public_profile", "email"], from: nil) { (result, error) in
               if let error = error {
                   completion(false, error)
               } else if let result = result, !result.isCancelled {
                   if let tokenString = result.token?.tokenString {
                       let credential = FacebookAuthProvider.credential(withAccessToken: tokenString)
                       Auth.auth().signIn(with: credential) { (authResult, error) in
                           if let error = error {
                               completion(false, error)
                           } else {
                               completion(true, nil)
                           }
                       }
                   } else {
                       completion(false, nil)
                   }
               }
           }
       }
    func isFacebookTokenValid() -> Bool {
        if let token = AccessToken.current, !token.isExpired {
            return true
        }
        return false
    }

   
    func startSignInWithAppleFlow() {
          let request = ASAuthorizationAppleIDProvider().createRequest()
          handleSignInWithAppleRequest(request) // set nonce and requested scopes

          let authorizationController = ASAuthorizationController(authorizationRequests: [request])
          authorizationController.delegate = self
          authorizationController.presentationContextProvider = self
          authorizationController.performRequests()
      }
   
    func signInWithGoogle() async -> Bool {
        guard let clientId = FirebaseApp.app()?.options.clientID else {
            fatalError("Client id not found")
        }
        
        let config = GIDConfiguration(clientID: clientId)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = await windowScene.windows.first,
              let rootViewController = await window.rootViewController else {
            print("AADEBUG: No root view controller found")
            return false
        }
        
        do {
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            
            let user = userAuthentication.user
            guard let idToken = user.idToken else {
                throw "Id token is missing"
            }
            
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            let result = try await Auth.auth().signIn(with: credential)
            let firebaseUser = result.user
            
            print("AADEBUG: user id is \(firebaseUser.uid) and email is: \(firebaseUser.email)")
            return true
            
        } catch {
            print("Failed to sign in with google with error: \(error.localizedDescription)")
            return false
            
        }
        
    }
    
}
extension SignUpViewModel {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        handleSignInWithAppleCompletion(.success(authorization))
        print("didCompleteWithAuthorization called")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        handleSignInWithAppleCompletion(.failure(error))
        print("didCompleteWithError called: \(error.localizedDescription)")
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            fatalError("No window found")
        }
        return window
    }
}
extension String: Error { }

extension SignUpViewModel {
    func handleSignInWithAppleRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
        let nonce = randomNonceString()
        currentNonce = nonce
        request.nonce = sha256(nonce)
    }

    func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>) {
        if case .failure(let failure) = result {
            errorMessage = failure.localizedDescription
        } else if case .success(let success) = result {
            if let appleIDCredential = success.credential as? ASAuthorizationAppleIDCredential {
                guard let nonce = currentNonce else {
                    fatalError("Invalid state: a login callback was received, but no login request was sent.")
                }
                guard let appleIDToken = appleIDCredential.identityToken else {
                    print("Unable to fetch identity token.")
                    return
                }
                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                    print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                    return
                }

                let credential = OAuthProvider.appleCredential(withIDToken: idTokenString, rawNonce: nonce, fullName: appleIDCredential.fullName)
                Task {
                    do {
                        let result = try await Auth.auth().signIn(with: credential)
                        dumpUser(result.user)
                        await updateDisplayName(for: result.user, with: appleIDCredential)
                    } catch {
                        print("Error authenticating: \(error.localizedDescription)")
                    }
                }
            }
        }
    }

    func updateDisplayName(for user: User, with appleIDCredential: ASAuthorizationAppleIDCredential, force: Bool = false) async {
        if let currentDisplayName = Auth.auth().currentUser?.displayName, !currentDisplayName.isEmpty {
            // current user is non-empty, don't overwrite it
        } else {
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = appleIDCredential.displayName()
            do {
                try await changeRequest.commitChanges()
                self.displayName = Auth.auth().currentUser?.displayName ?? ""
            } catch {
                print("Unable to update the user's displayname: \(error.localizedDescription)")
                errorMessage = error.localizedDescription
            }
        }
    }

    


    func signOut() {
        do {
            try Auth.auth().signOut()
            // Handle successful sign out if needed
        } catch let signOutError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
    }

    func verifySignInWithAppleAuthenticationState() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let providerData = Auth.auth().currentUser?.providerData
        if let appleProviderData = providerData?.first(where: { $0.providerID == "apple.com" }) {
            Task {
                do {
                    let credentialState = try await appleIDProvider.credentialState(forUserID: appleProviderData.uid)
                    switch credentialState {
                    case .authorized:
                        break // The Apple ID credential is valid.
                    case .revoked, .notFound:
                        // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
                        self.signOut()
                    default:
                        break
                    }
                } catch {}
            }
        }
    }
}


extension ASAuthorizationAppleIDCredential {
    func displayName() -> String {
        return [self.fullName?.givenName, self.fullName?.familyName]
            .compactMap({ $0 })
            .joined(separator: " ")
    }
}
// Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
private func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  let charset: [Character] =
  Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
  var result = ""
  var remainingLength = length

  while remainingLength > 0 {
    let randoms: [UInt8] = (0 ..< 16).map { _ in
      var random: UInt8 = 0
      let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
      if errorCode != errSecSuccess {
        fatalError(
          "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
        )
      }
      return random
    }

    randoms.forEach { random in
      if remainingLength == 0 {
        return
      }

      if random < charset.count {
        result.append(charset[Int(random)])
        remainingLength -= 1
      }
    }
  }

  return result
}

private func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    String(format: "%02x", $0)
  }.joined()

  return hashString
}


private func dumpUser(_ user: User) {
  print(user.email)
  print(user.isEmailVerified)
  print(user.providerID)
}


