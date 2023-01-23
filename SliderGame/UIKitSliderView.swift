//
//  UIKitSliderView.swift
//  SliderGame
//
//  Created by Eugene on 21.01.23.
//

import SwiftUI

struct UIKitSliderView: UIViewRepresentable {
    
    @Binding var value: Float

    var thumbAlpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        
        slider.maximumValue = 100

        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(value, animated: true)
        
        uiView.thumbTintColor = .red.withAlphaComponent(thumbAlpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension UIKitSliderView {
    
    class Coordinator: NSObject {
        
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = sender.value
        }
    }
}
