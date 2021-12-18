//
//  ViewController.swift
//  MZTextField
//
//  Created by 曾龙 on 2021/12/18.
//

import UIKit

class ViewController: UIViewController, MZTextFieldDelegate {

    lazy var textField1: MZTextField = {
        let textField = MZTextField(frame: CGRect(x: 30, y: 100, width: 300, height: 40))
        textField.backgroundColor = .lightGray
        textField.placeholder = "请输入长度不超过10的字符串"
        textField.maxTextLength = 10
        return textField
    }()
    
    @IBOutlet weak var textField2: MZTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField1)
        view.addSubview(textField2)
        textField2.maxTextLength = 12
        textField2.mzDeleagte = self
    }

    func textFieldDidDeleteBackword(_ textField: MZTextField, _ originText: String) {
        print("originText:\(originText)")
        print("currentText:\(textField.text ?? "")")
    }
}

