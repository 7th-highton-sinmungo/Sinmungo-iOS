//
//  ViewExt.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

extension View{
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>, isDetailLink: Bool = false) -> some View {
            self.background(
                NavigationLink(isActive: binding, destination: { view }) {
                    EmptyView()
                }
                .isDetailLink(isDetailLink)
            )
        }
}
