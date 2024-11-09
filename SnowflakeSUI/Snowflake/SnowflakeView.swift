//
//  SnowflakeView.swift
//  SnowflakeSUI
//
//  Created by Natalia Sinitsyna on 09.11.2024.
//

import SwiftUI

struct SnowflakeView: View {
    @ObservedObject var snowflake: Snowflake
    
    var body: some View {
        Image(systemName: "snowflake")
            .resizable()
            .scaledToFit()
            .foregroundColor(.white.opacity(0.8))
            .frame(width: snowflake.size, height: snowflake.size)
            .position(x: snowflake.x, y: snowflake.y)
    }
}
