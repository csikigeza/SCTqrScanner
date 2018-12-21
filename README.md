# SCTqrScanner
Scanner for the European Payments Council Quick Response Code

[![xCode](https://img.shields.io/badge/xCode-10.1%2B-blue.svg)](http://cocoapods.org/pods/SCTqrScanner)
[![Swift](https://img.shields.io/badge/swift-4.2%2B-brightgreen.svg)](http://cocoapods.org/pods/SCTqrScanner)
[![License](https://img.shields.io/badge/license-MIT-black.svg)](http://cocoapods.org/pods/SCTqrScanner)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](http://cocoapods.org/pods/SCTqrScanner)

## Requirements

- iOS 10.0+
- Xcode 10.1+
- Swift 4.2+

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


## Usage

SInce iOS10+, you will need the permision from user  for the camera usage. 
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
The qrResult can be nil, if the QR does not conform to the SCT Standards ([See SCT Standards](https://www.europeanpaymentscouncil.eu/sites/default/files/kb/file/2018-05/SCT069-12%20v2.1%20Quick%20Response%20Code%20-%20Guidelines%20to%20Enable%20the%20Data%20Capture%20for%20the%20Initiation%20of%20a%20SCT.pdf)).
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
