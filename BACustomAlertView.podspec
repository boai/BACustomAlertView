Pod::Spec.new do |s|
    s.name         = 'BACustomAlertView'
    s.version      = '1.0.4'
    s.summary      = '一个完全实现自定义的alertView！目前为止，最为精简的alert封装，以后alert就用博爱的BACustomAlertView了！'
    s.homepage     = 'https://github.com/boai/BACustomAlertView'
    s.license      = 'MIT'
    s.authors      = { 'boai' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '7.0'
    s.source       = { :git => 'https://github.com/boai/BACustomAlertView.git', :tag => s.version.to_s }
    s.source_files = 'BACustomAlertView/**/*.{h,m}'
    s.requires_arc = true
end