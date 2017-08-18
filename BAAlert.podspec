Pod::Spec.new do |s|
    s.name         = "BAAlert"
    s.version      = "1.2.3"
    s.summary      = '目前为止，最为精简的 alert 和 actionSheet 封装！BAAlert 让你的弹框不再孤单！'
    s.homepage     = 'https://github.com/BAHome/BAAlert'
    s.license      = 'MIT'
    s.authors      = { 'boa' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '7.0'
    s.source       = { :git => 'https://github.com/BAHome/BAAlert.git', :tag => s.version.to_s }
    s.source_files = 'BAAlert/BAAlert/*.{h,m}'
    s.requires_arc = true
    s.resource     = 'BAAlert/**/*.bundle'

end
