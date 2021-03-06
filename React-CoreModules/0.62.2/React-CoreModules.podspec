# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

version = '0.62.2'

source = { :git => 'https://github.com/GuoZhiQiang/react-native.git', :branch => 'feature-0.62.2' }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2018.10.22.00'

Pod::Spec.new do |s|
    source_files = "**/*.{c,m,mm,cpp}"
    source_files = File.join('React/' + 'CoreModules', source_files)
    s.name                   = "React-CoreModules"
    s.version                = version
    s.summary                = "-"  # TODO
    s.homepage               = "http://facebook.github.io/react-native/"
    s.license                = "MIT"
    s.author                 = "Facebook, Inc. and its affiliates"
    s.platforms              = { :ios => "9.0", :tvos => "9.2" }
    s.compiler_flags         = folly_compiler_flags + ' -Wno-nullability-completeness'
    s.source                 = source
    s.source_files           = source_files
    s.header_dir             = "CoreModules"
    s.pod_target_xcconfig    = {
                               "USE_HEADERMAP" => "YES",
                               "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
                               "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/React/CoreModules\" \"$(PODS_ROOT)/Folly\""
                             }

    s.dependency "FBReactNativeSpec", version
    s.dependency "Folly", folly_version
    s.dependency "RCTTypeSafety", version
    s.dependency "React-Core/CoreModulesHeaders", version
    s.dependency "React-RCTImage", version
    s.dependency "ReactCommon/turbomodule/core", version
end
