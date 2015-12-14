
Pod::Spec.new do |s|

  s.name         = 'SUICategories'
  s.version      = '1.0.0'
  s.platform     = :ios, '7.0'
  s.summary      = 'A collection of useful Objective-C categories.'

  s.license      = 'MIT'
  s.homepage     = 'https://github.com/randomprocess/SUICategories'
  s.author       = { 'suio~' => 'randomprocess@qq.com' }
  s.source       = { :git => 'https://github.com/randomprocess/SUICategories.git',
                     :tag => s.version.to_s }

  s.requires_arc = true

  s.public_header_files = 'SUICategories/**/*.h'
  s.source_files  = 'SUICategories/SUICategories.h'


  s.frameworks = 'UIKit', 'Foundation', 'CoreGraphics', 'QuartzCore'
  s.dependency 'ReactiveCocoa', '~> 2.5'
  s.dependency 'SUIUtilities', '~> 1.0.2'

  s.subspec 'Foundation' do |ss|
    ss.source_files = 'SUICategories/Foundation/*.{h,m}'
  end

  s.subspec 'UIKit' do |ss|
    ss.dependency 'SUICategories/Foundation'
    ss.source_files = 'SUICategories/UIKit/*.{h,m}'
  end

end
