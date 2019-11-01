//
//  ViewController.swift
//  Flush
//
//  Created by hidetaka on 2019/10/31.
//  Copyright © 2019 hidetaka. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var currentGameType: gameType = .easy
    var count = 0
    var numArray = [Int]()
    var result = 0
    var timer = Timer()
    
    
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var startLabel: UILabel!
    @IBOutlet var flushNum: UILabel!
    @IBOutlet var startBtnLabel: UIButton!
    @IBOutlet var answerBtnLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.answerBtnLabel.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.startLabel.text = "開始"
        self.startBtnLabel.isEnabled = true
        self.answerBtnLabel.isEnabled = false
        switch currentGameType {
        case .easy:
            self.levelLabel.text = "EASY"
        case .normal:
            self.levelLabel.text = "NORMAL"
        case .hard:
            self.levelLabel.text = "HARD"
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.timer.invalidate()
    }

    @IBAction func startBtn(_ sender: Any) {
        self.count = 0
        self.numArray = [Int]()
        self.result = 0
        self.startBtnLabel.isEnabled = false
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                             target: self,
                             selector: #selector(flushTimer),
                             userInfo: nil,
                             repeats: true)
    }
    
    @IBAction func answerBtn(_ sender: Any) {
        for n in self.numArray {
            self.result += n
        }
        performSegue(withIdentifier: "ResultSegue", sender: self.result)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as? ResultViewController
        next?.result = sender as! Int
    }
    
    func setFlushTimer(range: ClosedRange<Int>){
        if self.count < 10{
            let randomNum = Int.random(in: range)
            self.numArray.append(randomNum)
            self.flushNum.text = String(randomNum)
            self.count += 1
            print(count)
        } else {
            self.timer.invalidate()
            self.flushNum.text = "終了"
            self.answerBtnLabel.isEnabled = true
        }
    }
    
    @objc func flushTimer() {
        
        switch (currentGameType) {
        case .easy :
            setFlushTimer(range: 1...9)
            break
        case.normal :
            setFlushTimer(range: 10...99)
            break
        case .hard :
            setFlushTimer(range: 100...999)
            break
        }
    }
    

}

