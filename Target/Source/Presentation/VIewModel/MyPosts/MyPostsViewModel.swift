//
//  MyPostsViewModel.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine
import Foundation

final class MyPostsViewModel: BaseViewModel {
    @Published var posts: [Post] = []
    
    let chooseRemote = ChooseRemote()
    let likeRemote = LikeRemote()
    let postRemote = PostRemote()
    let studentRemote = StudentRemote()
    
    override init() {
        super.init()
        fetchPosts()
    }
    
    func fetchPosts() {
        addCancellable(studentRemote.getMyPosts()) { [weak self] posts in
            self?.posts = posts
        }
    }
    
    func onApplyChoose(index: Int) {
        addCancellable(chooseRemote.postChoose(index)) { [weak self] _ in
            self?.posts[(self?.posts.map({$0.index}).firstIndex(of: index)!)!].isChosen = true
        }
    }
    
    func onDeleteChoose(index: Int) {
        addCancellable(chooseRemote.deleteChoose(index)) { [weak self] _ in
            self?.posts[(self?.posts.map({$0.index}).firstIndex(of: index)!)!].isChosen = false
        }
    }
    
    func onApplyLike(index: Int) {
        addCancellable(likeRemote.postLike(index)) { [weak self] _ in
            self?.posts[(self?.posts.map({$0.index}).firstIndex(of: index)!)!].isLike = true
        }
    }
    
    func onDeleteLike(index: Int) {
        addCancellable(likeRemote.deleteLike(index)) { [weak self] _ in
            self?.posts[(self?.posts.map({$0.index}).firstIndex(of: index)!)!].isLike = false
        }
    }
    
    func onDeletePost(index: Int) {
        addCancellable(postRemote.deletePost(index: index)) { [weak self] _ in
            self?.posts = (self?.posts.filter({ $0.index == index }))!
        }
    }
}
