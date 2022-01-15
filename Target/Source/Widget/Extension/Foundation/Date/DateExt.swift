//
//  DateExt.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

extension Date{
    func getMonth() -> Int{
        return Calendar.current.component(.month, from: self)
    }
}
