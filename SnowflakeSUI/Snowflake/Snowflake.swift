//
//  Snowflake.swift
//  SnowflakeSUI
//
//  Created by Natalia Sinitsyna on 09.11.2024.
//

import Foundation
import SwiftUI

class Snowflake: Identifiable, ObservableObject {
    let id: UUID
    var x: CGFloat
    @Published var y: CGFloat
    var size: CGFloat
    var speed: Double
    
    init(id: UUID, x: CGFloat, y: CGFloat, size: CGFloat, speed: Double) {
        self.id = id
        self.x = x
        self.y = y
        self.size = size
        self.speed = speed
    }
}
