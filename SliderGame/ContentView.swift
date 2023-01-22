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
    
    private var thumbAlpha: Float {
        Float(computeScore()) / 100
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                Color(.darkGray)
            }
            
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                
                UIKitSliderView(value: $currentValue,
                                thumbAlpha: thumbAlpha)
                
                Text("100")
            }
            
            Button("Проверь меня", action: {})
            
            Button("Начать заново", action: {})
            
            Text("\(currentValue)")
            Text("\(computeScore() / 100)")
        }
        .padding()
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
