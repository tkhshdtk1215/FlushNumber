//
//  ResultViewController.swift
//  Flush
//
//  Created by hidetaka on 2019/10/31.
//  Copyright © 2019 hidetaka. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result: Int = 0

    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.resultLabel.text = String(result)
    }
    

}
