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
            Image(uiImage: SinmungoAsset.Assets.sinmungoLogo.image)
                .resizable()
                .frame(width: 183, height: 70)
            
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
