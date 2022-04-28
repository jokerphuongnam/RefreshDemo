//
//  VScrollRefresh+SymbolView.swift
//  RefreshDemo
//
//  Created by gannha on 28/04/2022.
//

import SwiftUI

extension VScrollRefreshView {
    enum RefreshableSate: CGFloat {
        case refreshing = 1
        case loadMore = -1
    }
    
    struct SymbolView: View {
        var height: CGFloat
        var loading: Bool
        var frozen: Bool
        var rotation: Angle
        var state: RefreshableSate
        
        var body: some View {
            ZStack {
                if loading {
                    // If loading, show the activity control
                    VStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    .frame(height: height)
                    .fixedSize()
                    .offset(y: state.rawValue * (-height + (loading && frozen ? height : 0.0)))
                } else {
                    // If not loading, show the arrow
                    Image(systemName: state == .refreshing ? "arrow.down" : "arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: height * 0.25, height: height * 0.25)
                        .fixedSize()
                        .padding(height * 0.375)
                        .rotationEffect(rotation)
                        .offset(y: state.rawValue * (-height + (loading && frozen ? +height : 0.0)))
                }
            }
        }
    }
}
