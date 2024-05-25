//
//  Card.swift
//  VirtualCards
//
//  Created by Denis Coder on 5/24/24.
//

import Foundation

struct CardModel: Decodable {
    let name:String
    let backgroundImage:String
    let cardNumber: String
    let cvv: String
    let exp:String
    let balance:Double
}
