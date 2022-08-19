//
//  ResizableLottieView.swift
//  Animated Tabs
//
//  Created by Justin on 8/16/22.
//

import SwiftUI
import Lottie

struct ResizableLottieView: UIViewRepresentable {
    
    var lottieView: AnimationView
    var color: SwiftUI.Color = .black
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        addLottieView(to: view)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        if let animationView = uiView.subviews.first(where: { view in
            view is AnimationView
        }) as? AnimationView {
//            lottieView.logHierarchyKeypaths()
            
            let lottieColor = ColorValueProvider(UIColor(color).lottieColorValue)
            let fillKeyPath = AnimationKeypath(keys: ["**", "Fill 1", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: fillKeyPath)
            
            let strokeKeyPath = AnimationKeypath(keys: ["**", "Stroke 1", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: strokeKeyPath)
        }
    }
    
    func addLottieView(to: UIView) {
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        
        lottieView.backgroundColor = .clear
        lottieView.contentMode = .scaleAspectFit
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor)
        ]
        
        to.addSubview(lottieView)
        to.addConstraints(constraints)
    }
}
