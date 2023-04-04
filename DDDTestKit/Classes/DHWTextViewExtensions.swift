//
//  DHWTextViewExtensions.swift
//  OneDay
//
//  Created by 邓毕华 on 2023/3/20.
//

import Foundation

extension UITextView {
    class func dhw_textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String, maxWordsCount: Int) -> Bool {
        if text == "" { // 删除字数
            return true
        }
            
        let inputMode = UITextInputMode.activeInputModes.first?.primaryLanguage
        if inputMode == "zh-Hans" || inputMode == "zh-Hant" { // 简体/繁体中文输入法(拼音、手写输入等)
            if let selectedRange = textView.markedTextRange,
                let _ = textView.position(from: selectedRange.start, offset: 0) { // 如果有高亮的文本，如拼音、手写
                // 拼音输入：联想的过程中，location时刻变化(高亮文本的尾部位置)，length始终为0
                // 手写输入：联想的过程中不会回调该代理方法，确认联想词后才会进入该代理方法
                if range.length > 0 { // 选中联想词后，location变回高亮文本的起始位置，length为高亮文本的长度，需要对字数限制字数
                    return !dhw_limitMaxWordsCount(textView, replacementText: text, isLocationToEnd: false, maxWordsCount: maxWordsCount)
                }
            } else { // 没有高亮选择的字，对已输入的文字进行字数限制
                if range.location >= maxWordsCount {
                    return false
                } else { // 处理粘贴引起的字数超限, 截取文本后需要自己去移动光标到尾部
                    return !dhw_limitMaxWordsCount(textView, replacementText: text, isLocationToEnd: true, maxWordsCount: maxWordsCount)
                }
            }
        } else { // 中文输入法以外的输入法直接进行字数限制
            if range.location >= maxWordsCount {
                return false
            } else { // 处理粘贴引起的字数超限, 截取文本后需要自己去移动光标到尾部
                return !dhw_limitMaxWordsCount(textView, replacementText: text, isLocationToEnd: true, maxWordsCount: maxWordsCount)
            }
        }
            
        return true
    }
    class func dhw_limitMaxWordsCount(_ textView: UITextView, replacementText text: String, isLocationToEnd: Bool, maxWordsCount: Int) -> Bool {
        let string = textView.text + text
        if string.utf16.count > maxWordsCount {
            textView.text = String(string.prefix(maxWordsCount))
//            self.isLocationToEnd = isLocationToEnd
            return true
        }
        return false
    }
}
