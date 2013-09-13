Pod::Spec.new do |s|
  s.name         = "STActivity"
  s.version      = "1.0.0"
  s.summary      = "A short description of STActivity."

  s.description  = <<-DESC
                   STActivities consist of UIActivity subclasses for Twitter and Facebook sharing, which send users to Setting if they are not logged into their accounts.
                   DESC

  s.homepage     = "https://github.com/uson1x/STActivities"
  s.license      = <<-LICENSE
		Copyright (c) 2013 Ivan Parfenchuk. All rights reserved.
		      LICENSE
  s.author       = 'Ivan Parfenchuk'
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
 
  s.source       = { :git => "https://github.com/gpinigin/STActivities.git", :tag => "1.0.0" }
  s.source_files  = 'STActivity/**/*.{h,m}'
 
  s.resources = "STActivity/STActivity.bundle"

  s.ios.frameworks = 'Twitter'
  s.ios.weak_frameworks = 'Social'

  s.requires_arc = true
end
