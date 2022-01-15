//
//  StudentProfileView.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct StudentProfileView: View {
    var user: StudentUser
    
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
            .frame(width: 50, height: 50, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(user.name)
                
                Text(String(user.gcn))
                    .foregroundColor(.secondary)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct StudentProfileView_Previews: PreviewProvider {
    static var previews: some View {
        StudentProfileView(user: StudentUser(name: "뚱이", gcn: 2202, profileImageUrl: "https://img.insight.co.kr/static/2020/08/12/700/fyzvinle3b068ce501hq.jpg"))
    }
}
