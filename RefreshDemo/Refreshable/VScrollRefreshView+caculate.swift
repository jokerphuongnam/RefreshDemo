//
//  VScrollRefreshView+caculate.swift
//  RefreshDemo
//
//  Created by gannha on 28/04/2022.
//

import SwiftUI

extension VScrollRefreshView {
    struct MovingView: View {
        var body: some View {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: RefreshableKeyTypes.PrefKey.self, value: [RefreshableKeyTypes.PrefData(vType: .movingView, bounds: proxy.frame(in: .global))])
            }
        }
    }
    
    struct FixedView: View {
        var body: some View {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: RefreshableKeyTypes.PrefKey.self, value: [RefreshableKeyTypes.PrefData(vType: .fixedView, bounds: proxy.frame(in: .global))])
            }
        }
    }
}
