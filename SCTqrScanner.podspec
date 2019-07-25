
Pod::Spec.new do |s|

#1
  s.platform     = :ios
  s.ios.deployment_target = '10.0'
  s.name         = "SCTqrScanner"
  s.summary      = "iOS Scanner for the SEPA Credit Transfer Quick Response Code"
  s.description  = "The SCTqrScanner read special QR codes  created for SEPA Credit Transfer. After scan the reader returns the info from QR in special SCTqrResult. This Result contains the name and the IBAN (Mandatory fileds), bic, amount, purpose, remittance or reference, which are optional fields"
  
#2
  s.version      = "0.9.5"
    
#3
  s.license      = { :type => "MIT", :file => "LICENSE" }
    
#4  
  s.author       = { "Geza Csiki" => "xphomeservice@yahoo.com" }
  
#5
  s.homepage     = "https://github.com/csikigeza/SCTqrScanner"

#6
  s.source       = { :git => "https://github.com/csikigeza/SCTqrScanner.git", :tag => "0.9.5" }
  s.source_files  = "SCTqrScanner/**/*.{h,swift}"
  s.swift_version = "4.2" 
  
end
