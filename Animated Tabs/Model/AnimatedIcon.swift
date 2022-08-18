//
//  AnimatedIcon.swift
//  Animated Tabs
//
//  Created by Justin on 8/16/22.
//

import Foundation
import SwiftUI
import Lottie

struct AnimatedIcon: Identifiable {
    var id: String = UUID().uuidString
    var tabIcon: Tab
    var lottieView: AnimationView
}

