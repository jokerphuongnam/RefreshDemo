//
//  MainView.swift
//  RefreshDemo
//
//  Created by gannha on 27/04/2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject fileprivate var vm: MainViewModel = MainViewModel()
    
    var body: some View {
        VScrollRefreshView(
            isRefreshing: $vm.isRefreshing,
            isLoadMore: $vm.isLoadMore
        ) {
            ForEach(vm.data, id: \.self) { element in
                Text(element)
                    .padding(.vertical)
                    .background(Color.white)
                    .background(Color(red: 211, green: 211, blue: 211))
                    .padding(.vertical)
                
            }
        } refresh: {
            ProgressView()
        }
        .onAppear(perform: vm.loadData)
        .onChange(of: vm.isRefreshing) { newValue in
            if newValue {
                vm.loadData()
            }
        }
        .onChange(of: vm.isLoadMore) { newValue in
            if newValue {
                vm.loadMoreData()
            }
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
