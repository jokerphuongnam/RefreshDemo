//
//  VScrollRefreshView+refresh.swift
//  RefreshDemo
//
//  Created by gannha on 28/04/2022.
//

import SwiftUI

extension VScrollRefreshView {
    var pullToRefresh: some View {
        HStack {
            if let isRefreshing = isRefreshing {
                Spacer()
                SymbolView(
                    height: threshold,
                    loading: isRefreshing.wrappedValue,
                    frozen: frozen,
                    rotation: rotation,
                    state: .refreshing)
                
                if isRefreshing.wrappedValue == false {
                    Text("Pull to refresh")
                        .offset(y: -threshold)
                }
                Spacer()
            }
        }
    }
    
    var scrollToLoadMore: some View {
        HStack {
            if let isLoadMore = isLoadMore {
                Spacer()
                SymbolView(
                    height: threshold,
                    loading: isLoadMore.wrappedValue,
                    frozen: frozen,
                    rotation: rotation,
                    state: .loadMore)
                if isLoadMore.wrappedValue == false {
                    Text("Scroll to load more")
                        .offset(y: threshold)
                }
                Spacer()
            }
        }
    }
}
