//
//  ViewController.swift
//  SCTqrScannerSampleApp
//
//  Created by Geza Csiki on 20.12.18.
//  Copyright © 2018 Geza Csiki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBAction func touchUpInsideStartBtn(_ sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "SCPqrScannerViewController")
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


