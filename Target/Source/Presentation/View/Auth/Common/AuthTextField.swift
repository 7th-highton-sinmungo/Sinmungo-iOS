//
//  AuthTextField.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct AuthTextField: View {
    var title: String
    @Binding var input: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .foregroundColor(.black)
                    .font(.custom(SinmungoFontFamily.Roboto.regular.name, size: 15))
                Spacer()
            }
            .padding(.bottom, 5)
            TextField("\(title)를 입력해주세요.", text: $input)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                        .frame(height: 40)
                }
                
        }
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(title: "test", input: .constant(""))
    }
}
