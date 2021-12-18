Pod::Spec.new do |spec|
  spec.name         = "MZTextField"
  spec.version      = "0.0.1"
  spec.summary      = "自定义UITextField组件，限制输入长度、监听删除事件"
  spec.homepage     = "https://github.com/1691665955/MZTextField"
  spec.authors         = { 'MZ' => '1691665955@qq.com' }
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.source = { :git => "https://github.com/1691665955/MZTextField.git", :tag => spec.version}
  spec.platform     = :ios, "9.0"
  spec.swift_version = '5.0'
  spec.source_files  = "MZTextField/MZTextField/*"
end
