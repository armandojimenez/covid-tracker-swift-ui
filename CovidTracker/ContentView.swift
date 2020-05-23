//
//  ContentView.swift
//  CovidTracker
//
//  Created by Armando Jimenez on 5/3/20.
//  Copyright © 2020 Armando Jimenez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            RecentView()
                .tabItem{
                    Tab(imageName: "chart.bar", text: "Recent")
            }
            .tag(0)
            
            MapContainerView()
                .tabItem{
                    Tab(imageName: "map", text: "Map")
            }
            .tag(1)
            
            //map
        }
    }
}

private struct Tab: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack{
            Image(systemName: imageName)
            Text(text)
        }
    }
}
