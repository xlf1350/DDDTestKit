//
//  DHWZipFileTools.swift
//  SSZipTest
//
//  Created by 谢林枫 on 2023/3/13.
//

import Foundation
import SSZipArchive

enum DHWResourceType: String {
    case fonts = "Fonts"
    case pics = "Pics"
    case svgs = "Svgas"
}

/// 语聊房解压Zip工具
class DHWZipFileTools: NSObject {
    
    static let dhw_instance = DHWZipFileTools()
    
    let dhw_fileName = "MultiBeamResource"
    
    private override init() {
        super.init()
    }
    
    func dhw_loadResource() {
        let success = SSZipArchive.unzipFile(atPath: Bundle.main.path(forResource:dhw_fileName, ofType:"zip")!, toDestination: dhw_filePath())
        if success {
            print("成功")
            dhw_registFonts()
        }
    }
    
    func dhw_loadFile(_ fileName: String, fileType: DHWResourceType) -> String {
        return dhw_filePath() + "/\(dhw_fileName)" + "/\(fileType.rawValue)" + "/\(fileName)"
    }
    
    private func dhw_filePath() -> String {
        let documentPath = NSHomeDirectory() + "/Documents"
        return documentPath
    }
    
    private func dhw_registFonts() {
        let fontNames = [
            "\(DHWFontStyle.boldItalic.rawValue).otf",
            "\(DHWFontStyle.bold.rawValue).otf",
            "\(DHWFontStyle.medium.rawValue).otf",
            "\(DHWFontStyle.regular.rawValue).otf"
        ]
        fontNames.forEach({dhw_registerFont(fontName: $0)})
    }
    
    private func dhw_registerFont(fontName: String) {
        let filePath = dhw_loadFile(fontName, fileType: .fonts)
        print("---- MultiBeam ---- RegisterFont Path ==== \(filePath)")
        guard let fontData = NSData(contentsOfFile: filePath),
              let dataProvider = CGDataProvider(data: fontData),
              let fontRef = CGFont(dataProvider) else {
            print("*** ERROR: ***")
            return
        }
    
        var errorRef: Unmanaged<CFError>? = nil
    
        if !CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) {
            print("*** ERROR: \(errorRef.debugDescription) ***")
        }
    }
    
    
}

