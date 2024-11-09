//
//  SnowfallView.swift
//  SnowflakeSUI
//
//  Created by Natalia Sinitsyna on 09.11.2024.
//

import SwiftUI

struct SnowfallView: View {
    
    @State private var snowflakes = [Snowflake]()
    @State private var isSnowing = false
    
    var body: some View {
        ZStack {
            // Background
            Color(.darkGray).ignoresSafeArea(edges: .all)
            Image("tree")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 500) // Размер можно настроить по вашему вкусу
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            
            // Falling Snowflakes
            ForEach(snowflakes) { snowflake in
                SnowflakeView(snowflake: snowflake)
                    .onAppear {
                        withAnimation(.linear(duration: snowflake.speed)) {
                            snowflake.y = UIScreen.main.bounds.height + snowflake.size
                        }
                    }
            }
            
            // Button to start snowfall
            VStack {
                Spacer()
                Button(action: {
                    isSnowing.toggle()
                    if isSnowing {
                        startSnowfall()
                    } else {
                        snowflakes.removeAll()
                    }
                }) {
                    Text(isSnowing ? "Остановить снег" : "Начать снег")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
    
    func startSnowfall() {
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            if !isSnowing {
                timer.invalidate()
                return
            }
            
            let newSnowflake = Snowflake(
                id: UUID(),
                x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                y: -10,  // Start just above the screen
                size: CGFloat.random(in: 15...30),  // Larger for snowflake symbol
                speed: Double.random(in: 3...6)
            )
            
            withAnimation {
                snowflakes.append(newSnowflake)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + newSnowflake.speed) {
                if let index = snowflakes.firstIndex(where: { $0.id == newSnowflake.id }) {
                    snowflakes.remove(at: index)
                }
            }
        }
    }
}

#Preview {
    SnowfallView()
}
