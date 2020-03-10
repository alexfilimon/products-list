# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

inhibit_all_warnings!

target 'ProductsList' do
  use_frameworks!

  # Pods for ProductsList
  $SurfUtils = "https://github.com/surfstudio/iOS-Utils.git"
  $Tag = '10.0.4'

  pod 'SwiftGen'
  pod 'SwiftLint'
  pod 'BulletinBoard'
  pod 'ReactiveDataDisplayManager', :git => 'https://github.com/alexfilimon/ReactiveDataDisplayManager', :commit => 'bcef2567ff9dcf8f35e07438dfa09120c766bd90'
  pod 'SurfUtils/KeyboardPresentable', :git => $SurfUtils, :tag => $Tag
  pod 'SurfUtils/StringAttributes', :git => $SurfUtils, :tag => $Tag
  pod 'SurfUtils/VibrationFeedbackManager', :git => $SurfUtils, :tag => $Tag
  pod 'SurfUtils/CommonButton', :git => $SurfUtils, :tag => $Tag
  pod 'SurfUtils/LocalStorage', :git => $SurfUtils, :tag => $Tag

end
