//
//  ContentView.swift
//  test
//
//  Created by 최형우 on 2022/01/13.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            MainView()
                .tabItem {
                    Image(systemName: selection == 0 ? "house" : "house.fill")
                }
                .tag(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
