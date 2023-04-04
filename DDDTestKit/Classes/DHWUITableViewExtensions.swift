//
//  DHWUITableViewExtensions.swift
//  OneDay
//
//  Created by 邓毕华 on 2023/3/29.
//

import Foundation
import UIKit

public extension UITableView {
    /// 滑动到底部
    /// - Parameter animated: 是否有动画
    func dhw_scrollToBottom(animated: Bool) {
        if !isScrollEnabled {
            return
        }
        
        setContentOffset(.init(x: contentOffset.x, y: contentSize.height + adjustedContentInset.bottom - bounds.height), animated: animated)
    }
}
