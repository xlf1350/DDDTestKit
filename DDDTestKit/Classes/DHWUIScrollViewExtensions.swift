//
//  DHWUIScrollViewExtensions.swift
//  OneDay
//
//  Created by 邓毕华 on 2023/3/29.
//

import Foundation
import UIKit

public extension UIScrollView {
    /// 是否滑动到最底部
    var dhw_alreadyAtBottom: Bool {
        get {
            let height = frame.size.height
            let contentOffsetY = contentOffset.y
            let bottomOffset = contentSize.height - contentOffsetY
            print("adfsafdasf:\(bottomOffset)-\(height)")
            return bottomOffset <= height
        }
    }
}
