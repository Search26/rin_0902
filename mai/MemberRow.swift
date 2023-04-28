//
//  ImageView.swift
//  mai
//
//  Created by MaiNT6 on 4/25/23.
//

import SwiftUI

struct MemberRow: View {
    
    var message: Message
    @State var isOnline: Bool = true
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("Avatar")
                    .resizable()
                    .frame(width: 48, height: 48)
                if isOnline {
                    Image("AvatarBadge")
                }
            }
            Text(message.name)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        MemberRow(message: Message(id: 2, name: "hixhix", text: "hehe", time: 1234))
    }
}
