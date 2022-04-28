//
//  VStackScrollRefresh.swift
//  RefreshDemo
//
//  Created by gannha on 27/04/2022.
//

import SwiftUI

struct VScrollRefreshView<Content: View> {
    @State var previousScrollOffset: CGFloat = 0
    @State var scrollOffset: CGFloat = 0
    @State var frozen: Bool = false
    @State var rotation: Angle = .degrees(0)
    
    var threshold: CGFloat = 80
    var isRefreshing: Binding<Bool>?
    var isLoadMore: Binding<Bool>?
    
    let content: Content
    var refresh: AnyView? = nil
    var loadMore: AnyView? = nil
    
    init(
        height: CGFloat = 80,
        isRefreshing: Binding<Bool>? = nil,
        isLoadMore: Binding<Bool>? = nil,
        @ViewBuilder content: () -> Content) {
            self.threshold = height
            self.isRefreshing = isRefreshing
            self.isLoadMore = isLoadMore
            self.content = content()
            
        }
}
