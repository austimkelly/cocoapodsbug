

Pod::Spec.new do |s|
  s.name = "MY"
  s.version = '1.0.0'
  s.homepage = 'https://developer.foobar.com'
  
  s.summary = 'Sample to show a dependency bug.'
  s.description = 'Grits!.'

  s.platform = :ios, '8.0'
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
     core.source_files = 'Pods/Core/**/*.{h,m}', 'Pods/Core/**/*.{h,m}'
     core.dependency 'MY/MyBacon'
  end

  s.subspec 'MyBacon' do |ba|
    ba.source_files = 'Pods/MyBacon/**/*.{h,m}'
  end

  s.subspec 'MySubspec' do |ads|
    ads.source_files = 'Pod/BVAdvertising/**/*.{h,m}'
    # install Google Ads SDK, min of 7.6, and up to but not including 8.0
    # NOTE: When using CocooaPods with "use_frameworks!" and a Swift app you cannot have a dependency # on a library that is not dynamic. You must install the SDK manually if using BVAdvertising.
    ads.dependency 'Google-Mobile-Ads-SDK', '~> 7.6'
    ads.dependency 'MY/Core'
  end



end