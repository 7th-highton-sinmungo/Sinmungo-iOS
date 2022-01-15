//
//  TeacherProfileView.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct TeacherProfileView: View {
    var user: TeacherUser
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.profileImageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else if phase.error != nil {
                    Image(systemName: "person.circle")
                        .foregroundColor(.secondary)
                } else {
                    ProgressView()
                }
            }
            .clipShape(Circle())
            .frame(width: 70, height: 70, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(user.name)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct TeacherProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherProfileView(user: TeacherUser(name: "뚱이", profileImageUrl: "https://img.insight.co.kr/static/2020/08/12/700/fyzvinle3b068ce501hq.jpg"))
    }
}
