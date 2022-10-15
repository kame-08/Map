//
//  ContentView.swift
//  Map
//
//  Created by Ryo on 2022/10/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 1
    
    var body: some View {
        TabView(selection: $selection) {
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }.tag(1)
            UserLocationMapView()
                .tabItem {
                    Label("UserLocation", systemImage: "location.fill")
                }.tag(2)
            MarkerMapView()
                .tabItem {
                    Label("Marker", systemImage: "mappin")
                }.tag(3)
            SampleMapView()
                .tabItem {
                    Label("Sample", systemImage: "tortoise.fill")
                }.tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
