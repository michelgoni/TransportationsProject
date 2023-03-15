# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/michelgoni/TransportProjectSpecs.git'

target 'TransportationsProject' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      end
    end
  end

  # Pods for TransportationsProject
  pod 'Google-Maps-iOS-Utils', '~> 4.1.0'
  pod 'SwiftLint'
  pod 'TransportsData', '0.2.0'
  pod 'TransportationDomain', '0.1.5'
  pod 'TransportationApiClient', '0.1.3'

end
