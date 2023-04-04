//
//  DHWBundleExtensions.swift
//  OneDay
//
//  Created by 邓毕华 on 2023/3/15.
//

import Foundation

extension Bundle {
    private static var bundle: Bundle?
    
    class func dhw_localizedString(_ key: String) -> String {
//        if bundle == nil {
//            guard let path = Bundle.zlPhotoBrowserBundle?.path(forResource: getLanguage(), ofType: "lproj") else {
//                return ""
//            }
//            bundle = Bundle(path: path)
//        }
//
//        let value = bundle?.localizedString(forKey: key, value: nil, table: nil)
//        return Bundle.main.localizedString(forKey: key, value: value, table: nil)
        return key
    }
//    private class func getLanguage() -> String {
//        var language = "en"
//
//        switch ZLCustomLanguageDeploy.language {
//        case .system:
//            language = Locale.preferredLanguages.first ?? "en"
//
//            if language.hasPrefix("zh") {
//                if language.range(of: "Hans") != nil {
//                    language = "zh-Hans"
//                } else {
//                    language = "zh-Hant"
//                }
//            } else if language.hasPrefix("ja") {
//                language = "ja-US"
//            } else if language.hasPrefix("fr") {
//                language = "fr"
//            } else if language.hasPrefix("de") {
//                language = "de"
//            } else if language.hasPrefix("ru") {
//                language = "ru"
//            } else if language.hasPrefix("vi") {
//                language = "vi"
//            } else if language.hasPrefix("ko") {
//                language = "ko"
//            } else if language.hasPrefix("ms") {
//                language = "ms"
//            } else if language.hasPrefix("it") {
//                language = "it"
//            } else if language.hasPrefix("id") {
//                language = "id"
//            } else if language.hasPrefix("pt") {
//                language = "pt-BR"
//            } else if language.hasPrefix("es") {
//                language = "es-419"
//            } else if language.hasPrefix("tr") {
//                language = "tr"
//            } else if language.hasPrefix("ar") {
//                language = "ar"
//            } else {
//                language = "en"
//            }
//        case .chineseSimplified:
//            language = "zh-Hans"
//        case .chineseTraditional:
//            language = "zh-Hant"
//        case .english:
//            language = "en"
//        case .japanese:
//            language = "ja-US"
//        case .french:
//            language = "fr"
//        case .german:
//            language = "de"
//        case .russian:
//            language = "ru"
//        case .vietnamese:
//            language = "vi"
//        case .korean:
//            language = "ko"
//        case .malay:
//            language = "ms"
//        case .italian:
//            language = "it"
//        case .indonesian:
//            language = "id"
//        case .portuguese:
//            language = "pt-BR"
//        case .spanish:
//            language = "es-419"
//        case .turkish:
//            language = "tr"
//        case .arabic:
//            language = "ar"
//        }
//
//        return language
//    }
}
