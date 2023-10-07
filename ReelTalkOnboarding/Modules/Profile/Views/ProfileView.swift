//
//  ProfileView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI

// A view representing the user's profile.
struct ProfileView: View {
    
    // States for the display name, date of birth, and presentation booleans.
    @State private var displayName: String = ""
    @State private var birthDate: Date = Date()
    @State private var isDatePickerPresented: Bool = false
    @State private var hasSelectedDate: Bool = false
    @State private var showPushNotifView: Bool = false
    @State private var showWelcomeView: Bool = false

    var body: some View {
        ZStack {
            // Background with a specific hex color
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)

            // Conditional rendering of WelcomeView or main content.
            if showWelcomeView {
                WelcomeView()
            } else {
                VStack {
                    Spacer()

                    // Profile title text
                    Text("Your profile")
                        .font(.custom(.demiBold, size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: 0xFFFFFFEB))
                        .frame(width: 350, alignment: .top)

                    // Placeholder image for a profile picture.
                    Image("Profile")
                        .padding(.bottom, 40)
                        .padding(.top, 10)

                    // Display name entry field and its descriptors
                    VStack(alignment: .leading) {
                        HStack {
                            Image("RTpencil")
                                .padding(.leading, 12)
                            TextField("Display name", text: $displayName)
                                .font(.custom(.regular, size: 17))
                                .foregroundColor(Color(hex: 0xFFFFFFEB))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(hex: 0xFFFFFF))
                            .padding(.horizontal)

                        Text("Your display name will be visible to other users.")
                            .font(.custom(.regular, size: 11))
                            .kerning(0.22)
                            .padding(.leading, 12)
                            .foregroundColor(Color(hex: 0xFFFFFFEB))
                            .frame(width: 292, alignment: .topLeading)

                        // Button to invoke the date picker
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
                                .font(.custom(.regular, size: 17))
                                .foregroundColor(Color(hex: 0xFFFFFFEB))
                                .padding(.top, 15)
                            }
                        }
                        // Modal date picker presentation
                        .sheet(isPresented: $isDatePickerPresented, content: {
                            DatePickerView(hasSelectedDate: $hasSelectedDate, isDatePickerPresented: $isDatePickerPresented, birthDate: $birthDate)
                        })
                        .cornerRadius(8)
                        .foregroundColor(Color(hex: 0xFFFFFF))
                        .shadow(radius: 5)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(hex: 0xFFFFFF))
                            .padding(.horizontal)

                        // Text descriptor about the purpose of entering a birth date.
                        Text("Your birthday will be used to tailor our content for you. It won’t be shared with any third parties. ")
                            .font(.custom(.regular, size: 11))
                            .kerning(0.22)
                            .padding(.leading, 12)
                            .foregroundColor(Color(hex: 0xFFFFFFEB))
                            .frame(width: 292, alignment: .topLeading)
                        
                        Spacer(minLength: 20)
                    }

                    // Button to navigate forward in the user flow
                    SquareButton(title: "Continue") {
                        showWelcomeView = true
                    }
                    Spacer()
                }
                
                ZStack(alignment: .bottom) {
                    if isDatePickerPresented {
                        // This is an empty condition currently, but presumably would contain UI related to the DatePicker or its backdrop.
                    }
                }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    // Function to format the birth date for display
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
// A view representing the date picker modal
struct DatePickerView: View {
    
      // Bindings to communicate with the parent view
    @Binding var hasSelectedDate: Bool
    @Binding var isDatePickerPresented: Bool
    @Binding var birthDate: Date
    
    var body: some View {
        VStack {
            
            HStack(spacing: 0) {
                Spacer()
                Button(action: {
                    hasSelectedDate = true
                    isDatePickerPresented = false
                }) {
                    Text("Done")
                        .font(Font.custom("Avenir Next", size: 15).weight(.medium))
                        .kerning(0.3)
                        .foregroundColor(Color(hex: 0xFFA724))
                }
                .padding(.top, 20)
                .padding(.vertical, 12)
                .padding(.trailing, 20)
            }
            .background(Color(hex: 0x222222))
            
            DatePicker("Select your birthday", selection: $birthDate, displayedComponents: .date)
                .colorScheme(.dark)
                .datePickerStyle(.wheel)
                .labelsHidden()
        }
        .padding(.vertical, 23.81818)
        .background(Color(hex: 0x252525))
        .shadow(color: .black.opacity(0.1), radius: 39.69697, x: 0, y: 13.23232)
        .presentationDetents([.height(250)])

    }
}
