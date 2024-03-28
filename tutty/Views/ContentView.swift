//
//  ContentView.swift
//  tutty
//
//  Created by Yusuf Erkoç on 28.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/,
                content:  {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }.tag(Tab.featured)
            LandmarkList()
                .tabItem {
                    Label("List",systemImage: "list.bullet")
                }.tag(Tab.list)
        })
     
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
