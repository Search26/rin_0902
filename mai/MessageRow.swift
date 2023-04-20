//
//  MessageRow.swift
//  mai
//
//  Created by MaiNT6 on 4/19/23.
//

import SwiftUI

struct MessageRow: View {
    
    var message: Message
    @State var isOnline: Bool = false
    
    var body: some View {
        HStack() {

            ZStack(alignment: .bottomTrailing) {
                Image("Avatar")
                    .resizable()
                    .frame(width: 48, height: 48)
                if isOnline {
                    Image("AvatarBadge")
                }
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            
            VStack(alignment: .leading) {
                Text(message.name)
                
                Text(message.text).lineLimit(.zero)
            }
            
            Spacer(minLength: 20)
            
            VStack {
                Text(message.name).frame(maxWidth: 32)
                
                Text(message.text)
                    .lineLimit(1)
                    .frame(maxWidth: 32)
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
        }
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(message: Message(id: 1, name: "2", text: "3fgdfgdfklgjdfkghdfjkghdfjkdfjkghdfjkghdfjkghdfjkghdfjkghdfjghdfjkhgdfjkghjkdfhgdfjkghdfkjghdfjkghdfkjghdfjkghdfjkghfdkjghdfjkghfdjkghdfjkghjkdfhgjk", time: 4))
    }
}
