# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

version = '0.62.2'

source = { :git => 'https://github.com/GuoZhiQiang/react-native.git', :branch => 'feature-0.62.2' }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2018.10.22.00'
boost_compiler_flags = '-Wno-documentation'

Pod::Spec.new do |s|
    
    s.name                   = "React-jsi"
    s.version                = version
    s.summary                = "-"  # TODO
    s.homepage               = "http://facebook.github.io/react-native/"
    s.license                = "MIT"
    s.author                 = "Facebook, Inc. and its affiliates"
    s.platforms              = { :ios => "9.0", :tvos => "9.2" }
    s.source                 = source
    s.framework              = "JavaScriptCore"
    s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
    s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\"" }
    s.header_dir             = "jsi"
    s.default_subspec        = "Default"
    s.source_files           = "ReactCommon/jsi/**/*.{cpp,h}"
    s.exclude_files          = "ReactCommon/jsi/**/test/*"

    s.dependency "boost-for-react-native", "1.63.0"
    s.dependency "DoubleConversion"
    s.dependency "Folly", folly_version
    s.dependency "glog"

    s.subspec "Default" do
    # no-op
    end

    s.subspec "Fabric" do |ss|
        ss.pod_target_xcconfig  = { "OTHER_CFLAGS" => "$(inherited) -DRN_FABRIC_ENABLED" }
    end
end
