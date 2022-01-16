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
                                .foregroundColor(.primary)
                            Text("홈")
                                .foregroundColor(.primary)
                        }
                        .tag(0)
                    
                    MonthlyChosenPostView()
                        .tabItem {
                            Image(systemName: "calendar")
                                .foregroundColor(.primary)
                            Text("월별 조회")
                                .foregroundColor(.primary)
                        }
                        .tag(1)
                    
                    UserView(isLogin: $isLogin)
                        .tabItem {
                            Image(systemName: "person")
                                .foregroundColor(.primary)
                            Text("내 정보")
                                .foregroundColor(.primary)
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
