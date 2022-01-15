//
//  MainView.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        SortButton(searchType: $viewModel.searchType)
                    }
                    .padding(.horizontal)
                    
                    ForEach(viewModel.posts, id: \.self) { post in
                        PostView(post: post)
                    }
                }
                .padding()
            }
            .navigationTitle("Menu")
            .navigationBarItems(
                trailing: NavigationLink(destination: {
                    Text("")
                }, label: {
                    Image(systemName: "plus")
                })
            )
        }
    }
}

struct SortButton: View {
    @Binding var searchType: SearchType
    
    var body: some View {
        Menu {
            Button {
                searchType = SearchType.POPULAR
            } label: {
                Image(systemName: "heart")
                Text("좋아요순")
            }
            
            Button {
                searchType = SearchType.RECENT
            } label: {
                Image(systemName: "arrow.up.arrow.down")
                Text("최신순")
            }
        } label: {
            if searchType == SearchType.POPULAR {
                Image(systemName: "heart")
                Text("좋아요순")
            }
            else {
                Image(systemName: "arrow.up.arrow.down")
                Text("최신순")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
