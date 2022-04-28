//
//  VScrollRefreshView+show.swift
//  RefreshDemo
//
//  Created by gannha on 28/04/2022.
//

import SwiftUI

extension VScrollRefreshView: View {
    var body: some View {
        VStack {
            ScrollView {
                ZStack(alignment: .top) {
                    MovingView()
                    
                    VStack {
                        content
                    }
                    .alignmentGuide(.top) { d in
                        (isRefreshing?.wrappedValue == true && frozen) ? -threshold : 0.0
                    }
                    .padding(.bottom, (isLoadMore?.wrappedValue == true && frozen) ? threshold : 0.0)
                    
                    if let isLoadMore = isLoadMore {
                        VStack {
                            Color.clear
                                .frame(maxHeight: .infinity)
                            
                            if let loadMore = loadMore {
                                if isLoadMore.wrappedValue {
                                    loadMore
                                        .offset(y: -(-threshold + (isLoadMore.wrappedValue && frozen ? +threshold : 0.0)))
                                }
                            } else {
                                scrollToLoadMore
                            }
                        }
                    }
                    
                    if let isRefreshing = isRefreshing {
                        VStack {
                            if let refresh = refresh {
                                if isRefreshing.wrappedValue {
                                    refresh
                                        .offset(y: -threshold + (isRefreshing.wrappedValue && frozen ? +threshold : 0.0))
                                }
                            } else {
                                pullToRefresh
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
            .background(FixedView())
            .onPreferenceChange(RefreshableKeyTypes.PrefKey.self) { values in
                refreshLogic(values: values)
            }
        }
    }
}
