# MZTextField
自定义UITextField组件，限制输入长度、监听删除事件

#### Cocoapods 引入
```
pod 'MZTextField', '~> 0.0.1'
```

#### 使用
```
let textField = MZTextField(frame: CGRect(x: 30, y: 100, width: 300, height: 40))
// MZTextField代理，监听删除按钮点击
textField.mzDeleagte = self
// 最大输入字符串长度、0代表不限制
textField.maxTextLength = 10
textField.placeholder = "请输入长度不超过10的字符串"
```
