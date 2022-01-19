platform :ios, '12.1'
use_frameworks!
inhibit_all_warnings!

def shared_pods
  pod 'RxSwift', '= 5.1.1'
  pod 'RxCocoa', '= 5.1.1'
end
target 'CampaignBrowser' do
  shared_pods
  pod 'MapleBacon', '= 4.0.1'
end

target 'CampaignBrowserSnapShotTests' do
  shared_pods
  pod 'SnapshotTesting', '~> 1.9.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if ['MapleBacon'].include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
end
