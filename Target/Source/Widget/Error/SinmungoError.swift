//
//  SinmungoError.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

enum SinmungoError: Error {
    case error(message: String = "에러가 발생했습니다.", errorBody: Dictionary<String, Any> = Dictionary())
}
