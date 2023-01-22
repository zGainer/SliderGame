//
//  SliderView.swift
//  SliderGame
//
//  Created by Eugene on 21.01.23.
//

import SwiftUI

struct SliderView: View {
    @Binding var currentValue: Float
    
    var body: some View {
        Text("\(currentValue)")
//        UIKitSliderView(currentValue: $currentValue)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(1))
    }
}
