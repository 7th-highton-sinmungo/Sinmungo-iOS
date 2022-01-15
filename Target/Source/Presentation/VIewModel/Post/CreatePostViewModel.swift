//
//  CreatePostViewModel.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
import UIKit

class CreatePostViewModel: ObservableObject {
    @Published var images: [UploadRequest] = []
    @Published var menuName = ""
}
