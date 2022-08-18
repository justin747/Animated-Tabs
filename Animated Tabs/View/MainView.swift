//
//  MainView.swift
//  Animated Tabs
//
//  Created by Justin on 8/16/22.
//

import SwiftUI
import Lottie

struct MainView: View {
    init(){
        UITabBar.appearance().isHidden = true
    }
    //MARK: View Properties
    
    @State var currentTab:   Tab = .home
    @State var animatedIcon: [AnimatedIcon] = {
        var tabs: [AnimatedIcon] = []
        
        for tab in Tab.allCases {
            tabs.append(.init(tabIcon: tab, lottieView: AnimationView(name: tab.rawValue, bundle: .main)))
        }
        return tabs
    }()
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Text("Home")
                    .setBG()
                    .tag(Tab.home)
                
                Text("Messages")
                    .setBG()
                    .tag(Tab.chat)
                
                Text("Notifications")
                    .setBG()
                    .tag(Tab.notifications)
                
                Text("Saved")
                    .setBG()
                    .tag(Tab.saved)
                
                Text("Profile")
                    .setBG()
                    .tag(Tab.account)
            }
            if #available(iOS 16, *) {
                TabBar()
                    .toolbar(.hidden, in: .tabBar)
            } else {
                TabBar()
            }
        }
    }
    
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(animatedIcon) { icon in
                ResizableLottieView(lottieView: icon.lottieView)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        currentTab = icon.tabIcon
                        icon.lottieView.play { _ in
                            
                            
                        }
                    }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background {
            (scheme == .dark ? Color.black : Color.white)
                .ignoresSafeArea()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View {
    @ViewBuilder
    func setBG() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.primary
                    .opacity(0.05)
                    .ignoresSafeArea()
            }
    }
}
