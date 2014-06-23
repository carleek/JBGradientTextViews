#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "JBGradientTextViews"
  s.version          = File.read('VERSION')
  s.summary          = "JBGradientTextViews adds the ability to add gradients to all your favorite UI text classes!"
  s.homepage         = "https://github.com/carleek/JBGradientTextViews"
  s.license          = 'MIT'
  s.author           = { "carleek" => "joshbryson@quickworkapps.com" }
  s.source           = { :git => "https://github.com/carleek/JBGradientTextViews.git", :tag => s.version.to_s }

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.framework	 = "UIKit"
end
