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
    let termLink = try! AttributedString(markdown: "[Terms and Conditions](https://duckduckgo.com)")
    
    let policyLink =  try! AttributedString(markdown: "[Privacy Policy](https://duckduckgo.com)")
    
    var body: some View {
        ZStack {
            if isUnlocked {
                
            } else {
                VStack {
                    HStack {
                        Image("iconLogoApp")
                            .resizable()
                            .frame(width: 55, height: 66)
                        Image("iconNameApp")
                    }
                    
                    Text("Chat and connect with verified UAE singles seeking serious relationships")
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Button {
                        authenticate()
                    } label: {
                        HStack {
                            Image("iconFingerPrint")
                            Text("Sign in with UAE PASS")
                                .foregroundColor(.black)
                        }
                    }
                    
                    Text("A single trusted digital identity for all citizens and residents")
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    
                }
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

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
