#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AMEEnumeratedObject"
  s.version          = "0.2.0"
  s.summary          = "AMEEnumeratedObject provide defining method to create a enum object as a plain old objc object."
  s.description      = <<-DESC
                       AMEEnumeratedObject provide defining method to create a enum object as a plain old objc object.
                       This almost realize the enum object like Java lang's one.
                       DESC
  s.homepage         = "https://github.com/ainame/AMEEnumeratedObject"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "ainame" => "s.namai.2012@gmail.com" }
  s.source           = { :git => "https://github.com/ainame/AMEEnumeratedObject.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ainame'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  # s.resources = 'Pod/Assets/*.png'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
