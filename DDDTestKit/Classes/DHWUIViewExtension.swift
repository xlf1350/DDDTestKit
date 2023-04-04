//
//  DHWUIViewExtension.swift
//  OneDay
//
//  Created by 谢林枫 on 2023/3/14.
//

import UIKit

extension UIView {
    
    /// 边框渐变
    /// - Parameters:
    ///   - cornerRadius: 圆角
    ///   - lineWidth: 线宽
    ///   - colors: 颜色
    func dhw_addGradientLayerWithCorner(cornerRadius:CGFloat, lineWidth:CGFloat, colors: [CGColor], startPoint: CGPoint = .init(x: 0, y: 0), endPoint: CGPoint = .init(x: 1, y: 1)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = cornerRadius
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        let maskLayer = CAShapeLayer()
        maskLayer.lineWidth = lineWidth
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: lineWidth / 2, y: lineWidth / 2, width: bounds.width - lineWidth, height: bounds.height - lineWidth), cornerRadius: cornerRadius).cgPath
        maskLayer.fillColor = UIColor.clear.cgColor
        maskLayer.strokeColor = UIColor.black.cgColor
        
        gradientLayer.mask = maskLayer
        self.layer.addSublayer(gradientLayer)
    }
    
    var dhw_x: CGFloat {
        get {
            frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var dhw_y: CGFloat {
        get {
            frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    var dhw_size: CGSize {
        get {
            frame.size
        }
        set {
            frame.size = newValue
        }
    }
    
    var dhw_height: CGFloat {
        get {
            frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    var dhw_width: CGFloat {
        get{
            frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    var dhw_centerX: CGFloat {
        get{
            center.x
        }
        set {
            self.center.x = newValue
        }
    }
    
    var dhw_centerY: CGFloat {
        get{
            center.y
        }
        set{
            center.y = newValue
        }
    }
}
