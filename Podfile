# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'ios-sdk-placeline-onboarding' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ios-sdk-placeline-onboarding
  pod 'HyperTrack'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.3'
      end
    end
  end
  

  target 'ios-sdk-placeline-onboardingTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ios-sdk-placeline-onboardingUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
