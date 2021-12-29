//
//  MZTextField.swift
//  MZTextField
//
//  Created by 曾龙 on 2021/12/18.
//

import UIKit

@objc
public protocol MZTextFieldDelegate: NSObjectProtocol {
    @objc optional func textFieldDidDeleteBackword(_ textField: MZTextField, _ originText: String)
}

open class MZTextField: UITextField {
    
    /// 最大输入字符串长度、0代表不限制
    public var maxTextLength: Int = 0 {
        didSet {
            self.addTarget(self, action: #selector(textDidChanged(_:)), for: .editingChanged)
        }
    }
    
    /// MZTextField代理，监听删除按钮点击
    public weak var mzDeleagte: MZTextFieldDelegate?
    
    open override func deleteBackward() {
        let string = self.text ?? ""
        super.deleteBackward()
        self.delegate
        if self.mzDeleagte != nil && self.mzDeleagte!.responds(to: #selector(MZTextFieldDelegate.textFieldDidDeleteBackword(_: _:))){
            self.mzDeleagte?.textFieldDidDeleteBackword?(self, string)
        }
    }
    
    @objc func textDidChanged(_ textField: MZTextField) {
        let toBeString = textField.text ?? ""
        if let language = (UIApplication.shared.textInputMode?.primaryLanguage) {
            // 中文输入
            if language == "zh-Hans" {
                guard let _ = textField.markedTextRange else {
                    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
                    if toBeString.count > textField.maxTextLength {
                        textField.text = String(toBeString[toBeString.startIndex..<toBeString.index(toBeString.startIndex, offsetBy: textField.maxTextLength)])
                    }
                    return
                }
            } else {
                //中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
                if toBeString.count > textField.maxTextLength {
                    textField.text = String(toBeString[toBeString.startIndex..<toBeString.index(toBeString.startIndex, offsetBy: textField.maxTextLength)])
                }
            }
        }
    }
    
}
