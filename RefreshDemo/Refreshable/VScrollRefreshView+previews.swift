//
//  VScrollRefreshView+previews.swift
//  RefreshDemo
//
//  Created by gannha on 28/04/2022.
//

import SwiftUI

#if DEBUG
struct VScrollRefreshView_Previews: PreviewProvider {
    @State private static var isRefreshing: Bool = false
    @State private static var isLoadMore: Bool = false
    @State private static var data: [String] = fakeData
    
    static var previews: some View {
        VScrollRefreshView(
            isRefreshing: $isRefreshing,
            isLoadMore: $isLoadMore
        ) {
            ForEach(data, id: \.self) { e in
                Text(e)
                    .padding(.vertical)
            }
        }
        .onAppear(perform: loadData)
        .onChange(of: isRefreshing) { newValue in
            if newValue {
                loadData()
            }
        }
        .onChange(of: isLoadMore) { newValue in
            if newValue {
                loadMoreData()
            }
        }
    }
}

extension VScrollRefreshView_Previews {
    fileprivate static var fakeData: [String] {
        var data: [String] = []
        for _ in 0...10 {
            data.append(UUID().uuidString)
        }
        return data
    }
    
    fileprivate static func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            data = fakeData
            isRefreshing = false
        }
    }
    
    fileprivate static func loadMoreData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            data += fakeData
            isLoadMore = false
        }
    }
}
#endif
