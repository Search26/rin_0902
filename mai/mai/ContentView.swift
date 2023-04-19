//
//  ContentView.swift
//  mai
//
//  Created by MaiNT6 on 4/18/23.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    @State private var isUnlocked = false
    var termLink: AttributedString {
        var termLink = try! AttributedString(markdown: "[Terms and Conditions](https://duckduckgo.com)")
        termLink.underlineColor = .black
        termLink.underlineStyle = .single
        termLink.foregroundColor = .black
        
        var policyLink =  try! AttributedString(markdown: "[Privacy Policy.](https://duckduckgo.com)")
        policyLink.underlineColor = .black
        policyLink.underlineStyle = .single
        policyLink.foregroundColor = .black
        
        let myAttrString = AttributedString("By Signing in, you agree to our ")
        let myAttrString2 = AttributedString(", Learn how we use your data in our ")
        
        return myAttrString + termLink + myAttrString2 + policyLink
    }
    
    var body: some View {
        ZStack {
            if isUnlocked {
                HomeView()
            } else {
                VStack {
                    Spacer()

                    HStack {
                        Image("iconLogoApp")
                            .resizable()
                            .frame(width: 55, height: 66)
                        Image("iconNameApp")
                    }
                    
                    Text("Chat and connect with verified UAE singles seeking serious relationships")
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 132, trailing: 20))
                                        
                    Button {
                        authenticate()
                    } label: {
                        HStack {
                            Image("iconFingerPrint")
                            Text("Sign in with UAE PASS")
                                .foregroundColor(.black)
                        }.padding(EdgeInsets(top: 12, leading: 40, bottom: 12, trailing: 40))
                            .overlay {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black , lineWidth: 1)
                            }
                    }
                    
                    Text("A single trusted digital identity for all citizens and residents")
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 11, leading: 20, bottom: 23, trailing: 20))
                    
                    Text(termLink)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: "#1E1E1E"))
                        .accessibilityRespondsToUserInteraction(true)
                        .font(.system(size: 12))
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                }
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        isUnlocked = true
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
