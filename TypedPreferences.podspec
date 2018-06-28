#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TypedPreferences'
  s.version          = '0.1.0'

  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.watchos.deployment_target = '2.0'
  s.osx.deployment_target = "10.9"

  s.summary          = 'Typed property-based UserDefaults for Swift.'
  s.description      = <<-DESC
Save your application settings using strictly-typed keys and safely store/load via UserDefaults in Swift and ObjC.
                       DESC

  s.homepage         = 'https://github.com/ReImpl/TypedPreferences'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kernel' => 'kernel@reimplement.mobi' }
  s.source           = { :git => 'https://github.com/ReImpl/TypedPreferences.git', :tag => s.version.to_s }

  s.source_files = 'TypedPreferences/Classes/**/*'

  s.swift_version = '4.1'
  s.requires_arc = true
end
