//
//  DHWFontExtensions.swift
//  SSZipTest
//
//  Created by 谢林枫 on 2023/3/13.
//

import UIKit

enum DHWFontStyle: String {
    case regular = "TT Norms Pro Regular"
    case medium = "TT Norms Pro Medium"
    case bold = "TT Norms Pro Bold"
    case boldItalic = "TT Norms Pro Bold Italic"
    
    func dhw_fontName() -> String {
        switch self {
        case .regular:
            return "TTNormsPro-Regular"
        case .medium:
            return "TTNormsPro-Medium"
        case .bold:
            return "TTNormsPro-Bold"
        case .boldItalic:
            return "TTNormsPro-BoldItalic"
        }
    }
}
/// 语聊房字体方法
extension UIFont {
    
    static func dhw_fontRegular(_ fontSize: CGFloat) -> UIFont? {
        dhw_font(fontSize: fontSize, style: .regular)
    }
    
    static func dhw_fontMedium(_ fontSize: CGFloat) -> UIFont? {
        dhw_font(fontSize: fontSize, style: .medium)
    }
    
    static func dhw_fontBold(_ fontSize: CGFloat) -> UIFont? {
        dhw_font(fontSize: fontSize, style: .bold)
    }
    
    static func dhw_fontBoldItalic(_ fontSize: CGFloat) -> UIFont? {
        dhw_font(fontSize: fontSize, style: .boldItalic)
    }
    
    static func dhw_font(fontSize: CGFloat, style: DHWFontStyle = .regular) -> UIFont? {
        guard let font = UIFont.init(name: style.dhw_fontName(), size: fontSize) else {
            return .systemFont(ofSize: fontSize)
        }
        return font
    }
    
}
