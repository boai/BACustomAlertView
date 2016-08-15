Pod::Spec.new do |s|
    s.name         = 'BACustomAlertView'
    s.version      = '1.0.3'
    s.summary      = 'A good player made by renzifeng'
    s.homepage     = 'https://github.com/boai/BACustomAlertView'
    s.license      = 'MIT'
    s.authors      = { 'boai' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '7.0'
    s.source       = { :git => 'https://github.com/boai/BACustomAlertView.git', :tag => s.version.to_s }
    s.source_files = 'BACustomAlertView/**/*.{h,m}'
    s.requires_arc = true
end