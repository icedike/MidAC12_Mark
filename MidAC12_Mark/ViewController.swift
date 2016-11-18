//
//  ViewController.swift
//  MidAC12_Mark
//
//  Created by LIN TINGMIN on 18/11/2016.
//  Copyright © 2016 MarkRobotDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultText: UILabel!
    var isCaculating = false
    var tempResult = 0
    var numberArray = [0,0]
    var operation = 0 // 0 = no operation , 1 = add 2 = sub 3 = multi
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var sub: UIButton!
    @IBOutlet weak var multi: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numButton(_ sender: UIButton) {
        setBlackToBlue()
        
        var currentNum = Int(resultText.text!)
        if isCaculating{
            isCaculating = false
            currentNum = 0
        }
 
        
        if let okCurrent = currentNum {
            
            //ignore 0 after 0
            if okCurrent == 0 && sender.tag == 0 {
                return
            }
            currentNum = okCurrent*10 + sender.tag
        }
        resultText.text = String(currentNum!)
        
    }
    
    @IBAction func clearAllButton(_ sender: UIButton) {
        resultText.text = "0"
        numberArray = [0,0]
        operation = 0
        
    }
    @IBAction func addButton(_ sender: UIButton) {
        add.tintColor = UIColor.black
        calcuation()
        operation = 1
    }
    @IBAction func subButton(_ sender: UIButton) {
        sub.tintColor = UIColor.black
        calcuation()
        operation = 2
    }
    @IBAction func resultButton(_ sender: UIButton) {
        setBlackToBlue()
        calcuation()
        operation = 0
    }

    @IBAction func multi(_ sender: UIButton) {
        multi.tintColor = UIColor.black
        calcuation()
        operation = 3
    }
    
    
    func setBlackToBlue(){
        add.tintColor = UIColor.blue
        sub.tintColor = UIColor.blue
        multi.tintColor = UIColor.blue
    }
    
    func calcuation(){
        numberArray[0] = numberArray[1]
        if let okCurrent = Int(resultText.text!){
            numberArray[1] = okCurrent
        }
        switch operation {
        case 1:
            resultText.text = String(numberArray[0] + numberArray[1])
            numberArray[1] += numberArray[0]
        case 2:
            resultText.text = String(numberArray[0] - numberArray[1])
            numberArray[1] = numberArray[0] - numberArray[1]
        case 3:
            resultText.text = String(numberArray[0] * numberArray[1])
            numberArray[1] *= numberArray[0]
        default:
            print("always return")
        }
        isCaculating = true
    }
}

