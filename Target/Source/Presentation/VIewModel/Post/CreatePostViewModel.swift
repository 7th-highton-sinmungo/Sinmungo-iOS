//
//  CreatePostViewModel.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
import UIKit

class CreatePostViewModel: BaseViewModel {
    @Published var images: [UploadRequest] = []
    @Published var menuName = ""
    @Published var isSuccess = false
    
    private let postRemote = PostRemote()
    private let imageRemote = ImageRemote()
    
    func applyCreatePost() {
        addCancellable(imageRemote.postUploadPostImages(images)) { [weak self] urls in
            guard let self = self else { return }
            self.addCancellable(self.postRemote.postCreatePost(.init(content: self.menuName, images: urls ))) { _ in
                self.isSuccess = false
            }
        
        }
    }
}
