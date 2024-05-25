//
//  CardDesign.swift
//  VirtualCards
//
//  Created by Denis Coder on 5/24/24.
//

import Foundation

enum PatternType: String , Decodable {
    case nations
    case animals
    case sports
}

struct PatternModel: Decodable, Identifiable {
    let id: UUID
    let name: String
    let type: PatternType
    let backgroundThumbImage: String
    let backgroundImage: String
}

