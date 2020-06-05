
Pod::Spec.new do |spec|

#1
  spec.platform     = :ios
  spec.ios.deployment_target = '10.0'
  spec.name         = "SCTqrScanner"
  spec.summary      = "iOS Scanner for the SEPA Credit Transfer Quick Response Code"
  spec.description  = "The SCTqrScanner read special QR codes  created for SEPA Credit Transfer. After scan the reader returns the info from QR in special SCTqrResult. This Result contains the name and the IBAN (Mandatory fileds), bic, amount, purpose, remittance or reference, which are optional fields"

#2
  spec.version      = "1.1.0"

#3
  spec.license      = { :type => "MIT", :file => "LICENSE" }

#4
  spec.author       = { "Geza Csiki" => "xphomeservice@yahoo.com" }

#5
  spec.homepage     = "https://github.com/csikigeza/SCTqrScanner"

#6
  spec.source       = { :git => "https://github.com/csikigeza/SCTqrScanner.git", :tag => "v1.1.0" }
  spec.source_files  = "SCTqrScanner/**/*.{h,swift}"
  spec.swift_version = "4.2"

end
