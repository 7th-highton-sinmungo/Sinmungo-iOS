//
//  UploadRequest.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
import UIKit

struct UploadRequest: Hashable {
    var type: ImageType
    var name: String
    var image: UIImage
    
    // Hashable
    static func == (lhs: UploadRequest, rhs: UploadRequest) -> Bool {
        return lhs.image == rhs.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(image)
    }
    
    // General
    internal init(type: ImageType = .JPEG, name: String = "", image: UIImage = UIImage()) {
        self.type = type
        self.name = name
        self.image = image
    }
}
