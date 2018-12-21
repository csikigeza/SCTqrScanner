//
//  SCTqrResult.swift
//  SCTqrScanner
//
//  Created by Geza Csiki on 30.11.18.
//  Copyright © 2018 Geza Csiki. All rights reserved.
//


public struct SCTqrResult {
    public let bic: String?
    public let name: String
    public let iban: String
    public let amount: String?
    public let purpose: String?
    public let remittance: String?
    public let reference: String?
}
