//
//  SplashView.swift
//  mai
//
//  Created by MaiNT6 on 4/18/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack{
            if self.isActive {
                ContentView()
            } else {
                Color.init(hex: "#50924E").ignoresSafeArea()
                VStack {
                    Image("iconLogoApp")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .imageScale(.large)
                }
            }
        } . onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
