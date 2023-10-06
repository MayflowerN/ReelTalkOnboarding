//
//  ProfileView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var displayName: String = ""
    @State private var birthDate: Date = Date()
    @State private var isDatePickerPresented: Bool = false
    @State private var hasSelectedDate: Bool = false
    @State private var showPushNotifView: Bool = false
    @State private var showWelcomeView: Bool = false

    var body: some View {
        ZStack {
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)

            if showWelcomeView {
                WelcomeView()
            } else {
                VStack {
                    Spacer()

                    Text("Your profile")
                        .font(Font.custom("Avenir Next", size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))
                        .frame(width: 350, alignment: .top)

                    Image("Profile")
                        .padding(.bottom, 40)
                        .padding(.top, 10)

                    VStack(alignment: .leading) {
                        HStack {
                            Image("RTpencil")
                                .padding(.leading, 12)
                            TextField("Display name", text: $displayName)
                                .font(Font.custom("Avenir Next", size: 17))
                                .foregroundColor(.white.opacity(0.92))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        Text("Your display name will be visible to other users.")
                            .font(Font.custom("Avenir Next", size: 11))
                            .kerning(0.22)
                            .padding(.leading, 12)
                            .foregroundColor(.white.opacity(0.92))
                            .frame(width: 292, alignment: .topLeading)

                        VStack {
                            Button(action: {
                                isDatePickerPresented.toggle()
                            }) {
                                HStack {
                                    Image("bday")
                                        .padding(.leading, 12)
                                        .padding(.top, 15)
                                    Text(hasSelectedDate ? getFormattedDate() : "Your birthday")
                                        .padding(.top, 15)
                                    Spacer()
                                }
                                .font(Font.custom("Avenir Next", size: 17))
                                .foregroundColor(.white.opacity(0.92))
                                .padding(.top, 15)
                            }
                        }
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        Text("Your birthday will be used to tailor our content for you. It won’t be shared with any third parties. ")
                            .font(Font.custom("Avenir Next", size: 11))
                            .kerning(0.22)
                            .padding(.leading, 12)
                            .foregroundColor(.white.opacity(0.92))
                            .frame(width: 292, alignment: .topLeading)
                        
                        Spacer(minLength: 20)
                    }

                    Button(action: {
                        showWelcomeView = true
                    }) {
                        Text("Continue")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(10)
                            .frame(width: 300, height: 48, alignment: .center)
                            .background(Color(red: 1, green: 0.66, blue: 0.14))
                            .cornerRadius(8)
                    }
                    Spacer()
                }
                ZStack(alignment: .bottom) {
                    if isDatePickerPresented {
                        
                        VStack {
                            
                            Button(action: {
                                hasSelectedDate = true
                                isDatePickerPresented = false
                            }) {
                                Text("Done")
                                    .font(Font.custom("Avenir Next", size: 15).weight(.medium))
                                    .kerning(0.3)
                                    .frame(width: 380, alignment: .topTrailing)
                                    .foregroundColor(Color(red: 1, green: 0.66, blue: 0.14))
                            }
                            
                            DatePicker("Select your birthday", selection: $birthDate, displayedComponents: .date)
                                .datePickerStyle(WheelDatePickerStyle())
                                .labelsHidden()
                        }
                        .padding(.horizontal, 26.46465)
                        .padding(.vertical, 23.81818)
                        .background(Color(red: 0.49, green: 0.49, blue: 0.49))
                        .background(Color(red: 0.15, green: 0.15, blue: 0.15).opacity(0.9))
                        .cornerRadius(17.20202)
                        .shadow(color: .black.opacity(0.1), radius: 39.69697, x: 0, y: 13.23232)
                            
                    }
                }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: birthDate)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
