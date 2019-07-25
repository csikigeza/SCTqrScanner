//
//  SCTqrScanner.swift
//  SCTqrScanner
//
//  Created by Geza Csiki on 30.11.18.
//  Copyright © 2018 Geza Csiki. All rights reserved.
//

import AVFoundation

public class SCTqrScanner: NSObject {
    
    // MARK: - Properties
    public var videoPreview = CALayer()
//    fileprivate(set) var videoPreview = CALayer()
    public var captureSession: AVCaptureSession?
    public var didRead: ((SCTqrResult?) -> Void)?
    
    // MARK: - INIT
    public override init() {
        super.init()
        
        //Make sure the device can handle video
        guard let videoDevice = AVCaptureDevice.default(for: .video),
            let deviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {
                return
        }
        captureSession = AVCaptureSession()
        
        //input
        captureSession?.addInput(deviceInput)
        
        //output
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        //interprets qr codes only
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        //preview
        if let capture = captureSession {
            let captureVideoPreview = AVCaptureVideoPreviewLayer(session: capture)
            captureVideoPreview.videoGravity = AVLayerVideoGravity.resizeAspectFill
            self.videoPreview = captureVideoPreview
//            self.video = captureVideoPreview
        }
    }
    
}

// MARK: - Code processing
protocol CodeReader {
    func startReading(completion: @escaping (SCTqrResult?) -> Void)
    func stopReading()
    var videoPreview: CALayer {get}
}

extension SCTqrScanner: CodeReader {
    public func startReading(completion: @escaping (SCTqrResult?) -> Void) {
        self.didRead = completion
        captureSession?.startRunning()
    }
    
    public func stopReading() {
        captureSession?.stopRunning()
    }
}


// MARK: - AVCaptureMetadataOutputObjectsDelegate
extension SCTqrScanner: AVCaptureMetadataOutputObjectsDelegate {
    
     public func metadataOutput(_ captureOutput: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        guard let readableCode = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
            let code = readableCode.stringValue else {
                return
        }
        
        //Vibrate the phone
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        stopReading()
        
        let result = Helper.app.processingQR(code)
        
        didRead?(result)
    }
}



