![Logo](https://github.com/csikigeza/SCTqrScanner/blob/master/SCTqrScannerLogo.png)
# SCTqrScanner

The SCTqrScanner read special QR codes  created for SEPA Credit Transfer. After scan the reader returns the info from QR in special SCTqrResult. This Result contains the name and the IBAN (Mandatory fileds), bic, amount, purpose, remittance or reference, which are optional fields

[![xCode](https://img.shields.io/badge/xCode-10.1%2B-blue.svg)](http://cocoapods.org/pods/SCTqrScanner)
[![Swift](https://img.shields.io/badge/swift-4.2%2B-brightgreen.svg)](http://cocoapods.org/pods/SCTqrScanner)
[![License](https://img.shields.io/badge/license-MIT-black.svg)](http://cocoapods.org/pods/SCTqrScanner)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](http://cocoapods.org/pods/SCTqrScanner)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Requirements

- iOS 10.0+
- Xcode 10.1+
- Swift 4.2+

## Screens

<p align="center">
<img src="https://github.com/csikigeza/SCTqrScanner/blob/master/sctScreen1.PNG" width="150" title="Start Screen">
<img src="https://github.com/csikigeza/SCTqrScanner/blob/master/sctScreen2.PNG" width="150" alt="Screen2">
<img src="https://github.com/csikigeza/SCTqrScanner/blob/master/sctScreen3.PNG" width="150" alt="Screen3">
<img src="https://github.com/csikigeza/SCTqrScanner/blob/master/sctScreen4.PNG" width="150" alt="Screen4">
</p>


## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate SCTqrScanner into your xCode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SCTqrScanner'
```

Install into your project:

``` bash
$ pod install
```

Open your project in xCode from the .xcworkspace file (not the usual project file):

``` bash
$ open MyProject.xcworkspace
```

You can now `import SCTqrScanner` framework into your files.


### Carthage

1. Get Carthage by running `brew install carthage` 
1. Create a Cartfile in the same directory where your `.xcodeproj` or `.xcworkspace` is

```
touch Cartfile
```

1. List the desired dependencies in the Cartfile, for example:

```
gitHub "csikigeza/SCTqrScanner"
```

1. Run `carthage update`
1. A `Cartfile.resolved` file and a `Carthage` directory will appear in the same directory where your `.xcodeproj` or `.xcworkspace` is
1. Drag the built `.framework` binaries from `Carthage/Build/<platform>` into your application’s Xcode project.
1. On your application targets’ _Build Phases_ settings tab, click the _+_ icon and choose _New Run Script Phase_. Create a Run Script in which you specify your shell (ex: `/bin/sh`), add the following contents to the script area below the shell:

```sh
/usr/local/bin/carthage copy-frameworks
```

- Add the paths to the frameworks you want to use under “Input Files". For example:

```
$(SRCROOT)/Carthage/Build/iOS/SCTqrScanner.framework
```

- Add the paths to the copied frameworks to the “Output Files”. For example:

```
$(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/SCTqrScanner.framework
```

## Usage

Since iOS10+, you will need the permision from user  for the camera usage. 
For that you will need to add the **Privacy - Camera Usage Description** *(NSCameraUsageDescription)* field in your Info.plist file.

Create your own codeReader and videoLayer properties on the ViewController on which you want to use the SCTqrScanner.

```swift
private var codeReader = SCTqrScanner()
private var videoLayer: CALayer!
```

Also you need a IBOutlet for the camera preview: 

```swift
@IBOutlet weak var videoPreview: UIView!
```


Start the SCTqrScanner in viewWillAppear and handl the response.

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    codeReader.startReading { [weak self] (qrResult) in
            //TODO: use response
    }
}
```
The qrResult can be nil, if the QR does not conform to the SEPA Credit Transfer Standards defined from European Payments Council ([See SCT Standards](https://www.europeanpaymentscouncil.eu/document-library/guidance-documents/quick-response-code-guidelines-enable-data-capture-initiation)).
Otherwise the respons has SCTqrResult type.

SCTqrResult contains obligatory the name and iban.


Assign the Camera preview to your view in viewDidload:

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    videoLayer = codeReader.videoPreview
    videoPreview.layer.addSublayer(videoLayer)
}
```


## License

SCTqrScanner is released under the MIT license. [See LICENSE](https://github.com/csikigeza/SCTqrScanner/blob/master/LICENSE) for details.
