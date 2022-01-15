//
//  ContentView.swift
//  test
//
//  Created by 최형우 on 2022/01/13.
//

import SwiftUI

struct ContentView: View {
    @State var isLogin = !TokenController.getInstance().getToken().isEmpty
    @State var selection = 0
    
    var body: some View {
        ZStack {
            if !isLogin {
                OnboardingView(isLogin: $isLogin)
                    .onAppear {
                        selection = 0
                    }
                    .zIndex(0)
            }
            else {
                TabView(selection: $selection) {
                    MainView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("홈")
                        }
                        .tag(0)
                    
                    MonthlyChosenPostView()
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("월별 조회")
                        }
                        .tag(1)
                    
                    UserView(isLogin: $isLogin)
                        .tabItem {
                            Image(systemName: "person")
                            Text("내 정보")
                        }
                        .tag(2)
                }
                .zIndex(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
