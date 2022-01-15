//
//  UploadRequest.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
import UIKit

class UploadRequest {
    var type: ImageType
    var name: String
    var image: UIImage
    
    internal init(type: ImageType = .JPEG, name: String = "", image: UIImage = UIImage()) {
        self.type = type
        self.name = name
        self.image = image
    }
}
