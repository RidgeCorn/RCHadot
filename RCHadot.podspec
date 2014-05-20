Pod::Spec.new do |s|
  version = "0.0.1"
  s.name         = "RCHadot"
  s.version      = version
  s.homepage     = "https://github.com/ridgecorn/RCHadot"
  s.author       = { "Looping" => "www.looping@gmail.com" }
  s.source       = { :git => "https://github.com/ridgecorn/RCHadot.git", :tag => version }
  s.platform     = :ios, '5.0'
  s.source_files = 'RCHadot/**/*.{h,m}'
  s.requires_arc = true
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  
  s.dependency 'ReactiveCocoa'
  s.dependency 'Routable'
  s.dependency 'AFNetworking', '~> 1.0'
  s.dependency 'Reachability'
  s.dependency 'TMCache'
  s.dependency 'NUI'
  s.dependency 'Mantle'
  s.dependency 'JSONModel'
  s.dependency 'Lockbox'
  s.dependency 'Objective-LevelDB'

end
