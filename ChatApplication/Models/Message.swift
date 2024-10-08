//
//  Message.swift
//  ChatApplication
//
//  Created by Raman Tank on 04/10/24.
//

import Foundation

struct Message: Identifiable, Codable{
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}


