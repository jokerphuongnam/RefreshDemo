//
//  MainViewModel.swift
//  RefreshDemo
//
//  Created by gannha on 27/04/2022.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var isRefreshing: Bool = false
    @Published var isLoadMore: Bool = false
    
    func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.data = self?.fakeData ?? []
            self?.isRefreshing = false
        }
    }
    
    func loadMoreData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.data += self?.fakeData ?? []
            self?.isLoadMore = false
        }
    }
    
    private var fakeData: [String] {
        var data: [String] = []
        for _ in 0...20 {
            data.append(UUID().uuidString)
        }
        return data
    }
}
