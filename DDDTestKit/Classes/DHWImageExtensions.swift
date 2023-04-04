//
//  DHWImageExtensions.swift
//  SSZipTest
//
//  Created by 谢林枫 on 2023/3/13.
//

import UIKit

/// 语聊房图片方法
extension UIImage {
    static func dhw_image(imageName: String) -> UIImage? {
        let path = DHWZipFileTools.dhw_instance.dhw_loadFile(imageName, fileType: .pics)
        return UIImage.init(contentsOfFile: path)
    }
    
    class func dhw_createGradientLayer(points: [CGPoint],colors: [CGColor], size: CGSize) -> UIImage {
        let layer : CAGradientLayer = CAGradientLayer ()
        let gradientColors: [CGColor] = colors
        layer.colors = gradientColors
        
        let gradientLocations: [NSNumber] = [0.0,1.0]
        layer.locations = gradientLocations
        
        layer.startPoint = points[0]
        for index in 1 ..< (colors.count - 1) {
            layer.anchorPoint = points[index]
        }
        layer.endPoint = points[colors.count - 1]
        
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            context.strokePath()
            context.setStrokeColor(UIColor.black.cgColor)
            layer.render(in: context)
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func dhw_resizeImage(_ size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
        var rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        var size = self.size
        rect = CGRectStandardize(rect)
        size.width = size.width < 0 ? -size.width : size.width
        size.height = size.height < 0 ? -size.height : size.height
        let centerPoint = CGPoint(x: CGRectGetMidX(rect), y: CGRectGetMidY(rect))
        if rect.size.width < 0.01 || rect.size.height < 0.01 ||
            size.width < 0.01 || size.height < 0.01 {
            rect.origin = centerPoint
            rect.size = .zero
        }else{
            var scale = 0.0
            if size.width / size.height < rect.size.width / rect.size.height {
                scale = rect.size.width / size.width
            }else{
                scale = rect.size.height / size.height
            }
            size.width *= scale
            size.height *= scale
            rect.size = size
            rect.origin = CGPointMake(centerPoint.x - size.width * 0.5, centerPoint.y - size.height * 0.5)
        }
        if rect.width != 0, rect.height != 0, let context = UIGraphicsGetCurrentContext(){
            context.saveGState()
            context.addRect(rect)
            context.clip()
            draw(in: rect)
            context.restoreGState()
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func dhw_imageAddCornerRadius(_ cornerRadius: CGFloat) -> UIImage? {
        let w = self.size.width
        let h = self.size.height
        let path = UIBezierPath()
        path.addArc(withCenter: .init(x: cornerRadius, y: h-cornerRadius), radius: cornerRadius, startAngle: .pi/2, endAngle: .pi, clockwise: true)
        path.addArc(withCenter: .init(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .pi, endAngle: .pi/2*3, clockwise: true)
        path.addArc(withCenter: .init(x: w-cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .pi/2*3, endAngle: 0, clockwise: true)
        path.addArc(withCenter: .init(x: w-cornerRadius, y: h-cornerRadius), radius: cornerRadius, startAngle: 0, endAngle: .pi/2, clockwise: true)
        path.close()
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.addPath(path.cgPath)
        context?.clip()
        draw(in: .init(x: 0, y: 0, width: w, height: h))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
