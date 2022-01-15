//
//  MainViewModel.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

class MainViewModel: BaseViewModel {
    @Published var posts: [Post] = [Post(index: 0, content: "하겐다즈", createdAt: Date(), images: ["https://file.mk.co.kr/meet/neds/2020/10/image_readtop_2020_1043615_16024868354388303.jpg", "https://img.insight.co.kr/static/2019/10/08/700/tvwbg5830h6shlqi2220.jpg"], likeCount: 20, isLike: true, isChosen: false, isMine: false)]
    @Published var searchType = SearchType.POPULAR
    
    let userRemote = UserRemote()
    
    override init() {
        super.init()
        fetchPosts()
    }
    
    func fetchPosts() {
        addCancellable(userRemote.getSortedPosts(searchType.rawValue)) { [weak self] posts in
            self?.posts = posts
        }
    }
    
    let chooseRemote = ChooseRemote()
    let likeRemote = LikeRemote()
    let postRemote = PostRemote()
    
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

enum SearchType: Int {
    case RECENT = 0
    case POPULAR = 1
}
