//
//  Helper.swift
//  SCTqrScanner
//
//  Created by Geza Csiki on 19.12.18.
//  Copyright © 2018 Geza Csiki. All rights reserved.
//

import Foundation

class Helper {
    static var app: Helper {
        return Helper()
    }
    
    // Process input String to Standard EPC qr Result
    // If the QR does not conform to the EPC Standards (https://www.europeanpaymentscouncil.eu/sites/default/files/kb/file/2018-05/EPC069-12%20v2.1%20Quick%20Response%20Code%20-%20Guidelines%20to%20Enable%20the%20Data%20Capture%20for%20the%20Initiation%20of%20a%20SCT.pdf) then return nil
    public func processingQR(_ code: String) -> SCTqrResult? {
        
        if code.contains("\n") {
            let sctElements = code.components(separatedBy: "\n")
            
            if sctElements.count > 6 {
                
                if sctElements[3] == "SCT" {
                    
                    let bic: String? = sctElements[4]
                    let name: String = sctElements[5]
                    let iban: String = sctElements[6]
                    var amount: String?
                    var purpose: String?
                    var remittance: String?
                    var reference: String?
                    
                    if sctElements.count > 7 {
                        amount = sctElements[7].replacingOccurrences(of: "EUR", with: "")
                    }
                    
                    if sctElements.count > 8 {
                        if !sctElements[8].isEmpty {
                            purpose = sctElements[8]
                        }
                    }
                    
                    if sctElements.count > 9 {
                        if !sctElements[9].isEmpty {
                            remittance = sctElements[9]
                        }
                    }
                    
                    if sctElements.count > 10 {
                        if !sctElements[10].isEmpty {
                            reference = sctElements[10]
                        }
                    }
                    let result: SCTqrResult = SCTqrResult(bic: bic, name: name, iban: iban, amount: amount, purpose: purpose, remittance: remittance, reference:reference)
                    
                    return result
                }
            }
        }
        
        return nil
        
    }
    
}
