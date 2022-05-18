require "json"

Pod::Spec.new do |s|
  # NPM package specification

  s.name         = "RNGestureHandler"
  s.version      = '2.2.0'
  s.summary      = ''
  s.homepage     = "https://github.com/software-mansion/react-native-gesture-handler"
  s.license      = "MIT"
  s.author       = { 'GuoZhiQiang' => '1029549847@qq.com' }
  s.platforms    = { :ios => "9.0", :tvos => "9.0" }
  s.source       = { :git => "https://gitlab.tuhu.cn/tuhushop/ios/lib-common/react-native-gesture-handler.git", :tag => "#{s.version}" }
  s.source_files = "ios/**/*.{h,m}"

  s.dependency "React-Core"

end
