Pod::Spec.new do |s|
  s.name = 'ZTSportKit'
  s.version = '1.1.24'
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = 'Official Zhortech ZTSportKit SDK for iOS to work with Sport products.'
  s.homepage = 'https://zhortech.com/'
  s.social_media_url = 'https://twitter.com/zhortech'
  s.authors = { "Pavel Shpak" => "p.shpak@zhortech.com" }
  s.source = { :git => "https://github.com/zhortech/ztsportkit-ios-sdk.git", :tag  => s.version.to_s }
  s.platform = :ios
  s.requires_arc = true
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.10.1'
  
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  
  s.source = { :git => 'https://github.com/zhortech/ztsportkit-ios-sdk.git', :tag => s.version.to_s }
  s.vendored_frameworks = 'Sources/ZTSportKit.xcframework'
  
  s.dependency 'ZTCoreKit', '~> ' +s.version.to_s

  s.ios.deployment_target   = '13.0'
  s.ios.weak_frameworks = 'Foundation'
  
  s.exclude_files = 'docs/'
end
