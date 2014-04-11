Pod::Spec.new do |s|
  s.name                    = "Verb"
  s.version                 = "0.0.1"
  s.summary                 = "A small framework that simplifies building UIDynamicAnimator based animators for a view"
  s.homepage                = "https://github.com/wess/Verb"
  s.license	            = "MIT"
  s.author                  = { "Wess Cope" => "wcope@me.com"}
  s.ios.deployment_target   = "7.0"
  s.source                  = {:git => "https://github.com/wess/Verb.git", :tag => "0.0.1"}
  s.source_files            = "Verb/Verb/*.{h,m}"
  s.requires_arc            = true
  s.frameworks              = "Foundation", "UIKit", "QuartzCore", "Security", "Accelerate"
  s.prefix_header_contents  = '#import <Verb/Verb.h>'
end
