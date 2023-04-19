//
//  Message.swift
//  mai
//
//  Created by MaiNT6 on 4/19/23.
//

import Foundation

struct Message: Hashable, Codable {
    var id: Int
    var name: String
    var text: String
    var time: TimeInterval
}
