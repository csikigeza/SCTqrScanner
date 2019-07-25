//
//  SCTqrScannerViewController.swift
//  SCTqrScannerSampleApp
//
//  Created by Geza Csiki on 20.12.18.
//  Copyright © 2018 Geza Csiki. All rights reserved.
//

import UIKit
import SCTqrScanner

class SCTqrScannerViewController: UIViewController {
    
    //MARK: - Properties
    private var videoLayer: CALayer!
    var codeReader = SCTqrScanner()
    
    //MARK: - IBOutlets
    @IBOutlet weak var videoPreview: UIView!
    
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var repeatBtn: UIButton!
    
    @IBAction func touchUpInsideBackBtn(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpInsideRepeatBtn(_ sender: AnyObject) {
        self.resultView.isHidden = true
        codeReader.startReading { [weak self] (code) in
            self?.showResult(code)
        }
    }
    
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIElements()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        videoLayer.frame = videoPreview.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        codeReader.startReading { [weak self] (code) in
            self?.showResult(code)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        codeReader.stopReading()
    }
    
    //MARK: - UISettings
    fileprivate func setUIElements() {
        videoLayer = codeReader.videoPreview
        videoPreview.layer.addSublayer(videoLayer)
        self.resultView.isHidden = true
    }
    
    func showResult(_ result: SCTqrResult?) {
        self.resultView.isHidden = false
        if let sctQRResult = result {
            let name = "NAME: \(sctQRResult.name)"
            let iban = "\nIBAN: \(sctQRResult.iban)"
            
            var bicStr = "\nBIC: -"
            if let bic = sctQRResult.bic {
                 bicStr = "\nBIC: \(bic)"
            }
           
            var amountStr = "\nAmount: -"
            if let amount = sctQRResult.amount {
                amountStr = "\nAmount: \(amount)"
            }
            
            var purposeStr = "\nPurpose: -"
            if let purpose = sctQRResult.purpose {
                purposeStr = "\nPurpose: \(purpose)"
            }
            
            var remittanceStr = "\nRemittance: -"
            if let remittance = sctQRResult.remittance {
                remittanceStr = "\nRemittance: \(remittance)"
            }
            
            var referenceStr = "\nReference: -"
            if let reference = sctQRResult.reference {
                referenceStr = "\nReference: \(reference)"
            }
        
            self.resultLbl.text = name + iban + bicStr + amountStr + purposeStr + remittanceStr + referenceStr
        } else {
            self.resultLbl.text = "ERROR: \nQR does not conform to SCT Standards"
        }
    }
}

