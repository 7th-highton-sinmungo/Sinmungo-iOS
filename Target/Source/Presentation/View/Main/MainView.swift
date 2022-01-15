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
            List {
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            Menu {
                                Button {
                                    viewModel.searchType = SearchType.POPULAR
                                    viewModel.fetchPosts()
                                } label: {
                                    Image(systemName: "heart")
                                    Text("좋아요순")
                                }
                                
                                Button {
                                    viewModel.searchType = SearchType.RECENT
                                    viewModel.fetchPosts()
                                } label: {
                                    Image(systemName: "arrow.up.arrow.down")
                                    Text("최신순")
                                }
                            } label: {
                                if viewModel.searchType == SearchType.POPULAR {
                                    Image(systemName: "heart")
                                    Text("좋아요순")
                                }
                                else {
                                    Image(systemName: "arrow.up.arrow.down")
                                    Text("최신순")
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        ForEach(viewModel.posts, id: \.self) { post in
                            PostView(post: post, onApplyChoose: viewModel.onApplyChoose, onDeleteChoose: viewModel.onDeleteChoose, onApplyLike: viewModel.onApplyLike, onDeleteLike: viewModel.onDeleteLike, onDeletePost: viewModel.onDeletePost)
                                .padding(.bottom)
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .refreshable {
                viewModel.fetchPosts()
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(
                trailing: VStack {
                    if UserTypeController.getInstance().getUserType() == UserType.STUDENT {
                        NavigationLink(
                            destination: {
                                CreatePostView()
                            }, label: {
                                Image(systemName: "plus")
                            }
                        )
                    }
                }
            )
            .navigationTitle("Menu")
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
