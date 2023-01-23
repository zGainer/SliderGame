//
//  ContentView.swift
//  SliderGame
//
//  Created by Eugene on 21.01.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Float.random(in: 0...100)
    
    @State private var scorePresented = false
    
    private var thumbAlpha: Double {
        Double(computeScore()) / 100
    }
    
    var body: some View {
        
        VStack (spacing: 30) {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                
                UIKitSliderView(value: $currentValue,
                                thumbAlpha: thumbAlpha)
                
                Text("100")
            }
            
            Button("Проверь меня") {
                scorePresented.toggle()
            }
            .alert("Your score:", isPresented: $scorePresented, actions: {}) {
                Text("\(computeScore())")
            }
            
            Button("Начать заново", action: startNewGame)
        }
        .padding()
    }
}

extension ContentView {
    
    private func startNewGame() {
        targetValue = Int.random(in: 0...100)
        currentValue = Float.random(in: 0...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lroundf(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
