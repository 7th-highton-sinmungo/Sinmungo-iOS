//
//  LogoView.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(maxWidth: 62, maxHeight: 62)
            Text("앱 이름")
                .font(.custom(SinmungoFontFamily.Roboto.regular.name, size: 27))
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
