#
# Be sure to run `pod lib lint CHITouchySuperButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CHITouchySuperButton'
  s.version          = '1.0.6'
  s.summary          = 'Drop-in UIButton subclass designed to make custom animations easy'

  s.description      = <<-DESC
  CHITouchySuperButton is a drop-in UIButton subclass that allows you to create and customize a highly interactive button in just a few lines of code. This class is compatible with the UIView animatable properties: transform, alpha, center, frame, bounds, and backgroundColor. This class is widely used in all SongShift apps to make it feel a lot more interactive. This package is only compatible with iOS apps and targets iOS 10+.
                          DESC

  s.swift_versions = ['4.2']
  s.homepage         = 'https://github.com/songshift/CHITouchySuperButton'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'benrosen78' => 'benrosen78@gmail.com' }
  s.source           = { :git => 'https://github.com/songshift/CHITouchySuperButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/songshift'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/**/*'

end
