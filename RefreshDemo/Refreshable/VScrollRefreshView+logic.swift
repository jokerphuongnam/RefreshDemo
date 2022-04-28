//
//  VScrollRefreshView+logic.swift
//  RefreshDemo
//
//  Created by gannha on 28/04/2022.
//

import SwiftUI

extension VScrollRefreshView {
    func refreshLogic(values: [RefreshableKeyTypes.PrefData]) {
        DispatchQueue.main.async {
            // Calculate scroll offset
            let movingBounds = values.first { $0.vType == .movingView }?.bounds ?? .zero
            let fixedBounds = values.first { $0.vType == .fixedView }?.bounds ?? .zero
            
            scrollOffset = movingBounds.minY - fixedBounds.minY
            
            let scrollHeight = movingBounds.size.height - fixedBounds.size.height + threshold
            
            rotation = symbolRotation(scrollOffset, height: scrollHeight)
            
            if isRefreshing?.wrappedValue == false && (scrollOffset > threshold && previousScrollOffset <= threshold) {
                // Crossing the threshold on the way down, we start the refresh process
                isRefreshing?.wrappedValue = true
            } else if isRefreshing?.wrappedValue == false && (abs(scrollOffset) > scrollHeight && abs(previousScrollOffset) <= scrollHeight) {
                // Crossing the bottom on the way up, we start the load more process
                isLoadMore?.wrappedValue = true
            }
            
            if isRefreshing?.wrappedValue == true || isLoadMore?.wrappedValue == true {
                // Crossing the threshold on the way up, we add a space at the top of the scrollview
                if previousScrollOffset > threshold && scrollOffset <= threshold {
                    frozen = true
                } else if abs(previousScrollOffset) > scrollHeight && abs(scrollOffset) <= scrollHeight {
                    frozen = true
                }
            } else {
                // remove the sapce at the top of the scroll view
                frozen = false
            }
            
            // Update last scroll offset
            previousScrollOffset = scrollOffset
        }
    }
    
    func symbolRotation(_ scrollOffset: CGFloat, height scrollHeight: CGFloat) -> Angle {
        if abs(scrollOffset) > scrollHeight / 2 {
            if abs(scrollOffset) < scrollHeight - threshold * 0.4 {
                return .degrees(0)
            } else {
                let height = abs(scrollHeight) - threshold
                let h = Double(abs(scrollHeight) - height)
                let d = Double(abs(scrollOffset) - height)
                let v = max(min(d - (h * 0.6), h * 0.4), 0)
                return .degrees(180 * v / (h * 0.4))
            }
        }
        // We will begin rotation, only after we have passed
        // 60% of the way of reaching the threshold.
        if scrollOffset < threshold * 0.60 {
            return .degrees(0)
        } else {
            // Calculate rotation, based on the amount of scroll offset
            let h = Double(threshold)
            let d = Double(scrollOffset)
            let v = max(min(d - (h * 0.6), h * 0.4), 0)
            return .degrees(180 * v / (h * 0.4))
        }
    }
}
