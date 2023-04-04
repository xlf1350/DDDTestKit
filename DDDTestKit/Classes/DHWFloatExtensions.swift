//
//  DHWFloatExtensions.swift
//  OneDay
//
//  Created by 邓毕华 on 2023/3/23.
//

import Foundation

extension Float {
    /// 准确的小数尾截取 - 没有进位
    func dhw_decimalString(_ base: Self = 1) -> String {
        let tempCount: Self = pow(10, base)
        let temp = self*tempCount
        
        let target = Self(Int(temp))
        let stepone = target/tempCount
        if stepone.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", stepone)
        }else{
            return "\(stepone)"
        }
    }
}
