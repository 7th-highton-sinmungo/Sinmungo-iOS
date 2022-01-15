//
//  MonthlyChosenPostViewModel.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine
import Foundation

final class MonthlyChosenPostViewModel: BaseViewModel {
    // MARK: - Properties
    @Published var selectedDate = Date()
    @Published var posts: [Post] = []
    
    deinit {
        bag.removeAll()
    }
    
    // MARK: - Input
    enum Input{
        case plusDidTap
        case minusDidTap
    }
    
    
    func apply(_ input: Input) {
        let month = TimeInterval(60 * 1 * 60 * 24 * 30)
        switch input{
        case .plusDidTap:
            selectedDate.addTimeInterval(month)
            onApplyChosenPost()
        case .minusDidTap:
            selectedDate.addTimeInterval(-month)
            onApplyChosenPost()
        }
    }
    
    let chooseRemote = ChooseRemote()
    let likeRemote = LikeRemote()
    let postRemote = PostRemote()
    let userRemote = UserRemote()
    
    func onApplyChosenPost() {
        addCancellable(userRemote.getChosenPosts(selectedDate.getMonth().toMonth)) { [weak self] post in
            self?.posts = post
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
