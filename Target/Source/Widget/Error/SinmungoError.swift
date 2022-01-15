//
//  SinmungoError.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

enum SinmungoError: Error {
    case error(message: String, type: ErrorType = .basic, errorBody: Dictionary<String, Any> = Dictionary())
}

enum ErrorType: String {
    case basic = "BASIC"
    case selfIsNil = "SELF_IS_NIL"
    case unhandled = "UNHANDLED"
}
