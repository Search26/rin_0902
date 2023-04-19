//
//  HomeView.swift
//  mai
//
//  Created by MaiNT6 on 4/19/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            Color(hex: "#50924E")
                .ignoresSafeArea()
            VStack {
                ZStack {
                    HStack {
                        Button {
                            actionMenu()
                        } label: {
                            Image("iconMenu")
                                .padding(EdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 0))
                        }
                        Spacer()
                    }
                    Image("iconLogoApp")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: 26, height: 32)
                }
                HStack(spacing: 20) {
                    Spacer()
                    Button {
                        actionSearch()
                    } label: {
                        ZStack {
                            Color.white
                            HStack() {
                                Image("iconSearch")
                                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 5))
                                Text("Search")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(height: 48)
                    }.cornerRadius(20)
                    Spacer()
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 15, trailing: 0))
                Spacer()
            }
        }
    }
    
    private func actionMenu() {
        
    }
    
    private func actionSearch() {
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
