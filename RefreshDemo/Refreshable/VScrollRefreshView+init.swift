//
//  VScrollRefreshView+init.swift
//  RefreshDemo
//
//  Created by gannha on 28/04/2022.
//

import SwiftUI

extension VScrollRefreshView {
    init<Refresh> (
        height: CGFloat = 80,
        isRefreshing: Binding<Bool>? = nil,
        isLoadMore: Binding<Bool>? = nil,
        @ViewBuilder content: () -> Content,
        @ViewBuilder refresh: () -> Refresh) where Refresh : View {
            self.init(
                height: height,
                isRefreshing: isRefreshing,
                isLoadMore: isLoadMore,
                content: content
            )
            self.refresh = AnyView(refresh())
        }
    
    init<LoadMore> (
        height: CGFloat = 80,
        isRefreshing: Binding<Bool>? = nil,
        isLoadMore: Binding<Bool>? = nil,
        @ViewBuilder content: () -> Content,
        @ViewBuilder loadMore: () -> LoadMore) where LoadMore : View {
            self.init(
                height: height,
                isRefreshing: isRefreshing,
                isLoadMore: isLoadMore,
                content: content
            )
            self.loadMore = AnyView(loadMore())
        }
    
    init<Refresh, LoadMore> (
        height: CGFloat = 80,
        isRefreshing: Binding<Bool>? = nil,
        isLoadMore: Binding<Bool>? = nil,
        @ViewBuilder content: () -> Content,
        @ViewBuilder refresh: () -> Refresh,
        @ViewBuilder loadMore: () -> LoadMore) where Refresh : View, LoadMore : View {
            self.init(
                height: height,
                isRefreshing: isRefreshing,
                isLoadMore: isLoadMore,
                content: content
            )
            self.refresh = AnyView(refresh())
            self.loadMore = AnyView(loadMore())
        }
}
