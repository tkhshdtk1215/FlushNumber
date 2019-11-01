//
//  SelectViewController.swift
//  Flush
//
//  Created by hidetaka on 2019/10/31.
//  Copyright © 2019 hidetaka. All rights reserved.
//

import UIKit

enum gameType {
    case easy
    case normal
    case hard
}

class SelectViewController: UIViewController {

    @IBAction func easyBtn(_ sender: Any) {
        moveToGame(.easy)
    }
    
    @IBAction func normalBtn(_ sender: Any) {
        moveToGame(.normal)
    }
    
    @IBAction func hardBtn(_ sender: Any) {
        moveToGame(.hard)
    }
    
    func moveToGame(_ gameType: gameType) {
        performSegue(withIdentifier: "LevelSegue", sender: gameType)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as? ViewController
        next?.currentGameType = sender as! gameType
    }
    
}
