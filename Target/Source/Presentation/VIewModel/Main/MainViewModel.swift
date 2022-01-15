//
//  MainViewModel.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var posts: [Post] = [Post(index: 0, content: "하겐다즈", createdAt: Date(), images: ["https://file.mk.co.kr/meet/neds/2020/10/image_readtop_2020_1043615_16024868354388303.jpg", "https://img.insight.co.kr/static/2019/10/08/700/tvwbg5830h6shlqi2220.jpg"], likeCount: 20, isLike: true)]
    @Published var searchType = SearchType.POPULAR
}

enum SearchType {
    case POPULAR
    case RECENT
}
