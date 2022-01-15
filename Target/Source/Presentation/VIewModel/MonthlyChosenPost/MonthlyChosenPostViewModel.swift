//
//  MonthlyChosenPostViewModel.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine
import Foundation

final class MonthlyChosenPostViewModel: ObservableObject{
    // MARK: - Properties
    @Published var selectedDate = Date()
    @Published var posts: [Post] = []
    
    private var bag = Set<AnyCancellable>()
    
    // MARK: - Init
    init(){
        bindInput()
        bindOutput()
    }
    
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
        case .minusDidTap:
            selectedDate.addTimeInterval(-month)
        }
    }
    
    private func bindInput(){
        
    }
    
    // MARK: - Output
    private func bindOutput(){
        
    }
}
