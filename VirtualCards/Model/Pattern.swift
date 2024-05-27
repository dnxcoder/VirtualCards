//
//  CardDesign.swift
//  VirtualCards
//
//  Created by Denis Coder on 5/24/24.
//

import SwiftUI

enum FontColors: String {
    case red
    case green
    case blue
    case yellow
    case white
    
    var color: Color {
        switch self {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .blue:
            return Color.blue
        case .yellow:
            return Color.yellow
        case .white:
            return Color.white
        }
    }
}

enum PatternType: String {
    case nations
    case animals
    case sports
}

struct PatternModel: Identifiable {
    let id: UUID
    let name: String
    let type: PatternType
    let backgroundThumbImage: String
    let backgroundImage: String
    let fontColor: FontColors
}

