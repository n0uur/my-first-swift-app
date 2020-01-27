//
//  ViewController.swift
//  windows10
//
//  Created by KhunNirantree Parurat on 27/1/2563 BE.
//  Copyright © 2563 KhunNirantree Parurat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var answer = 0
    var hp = 0

    @IBOutlet weak var hpLable: UILabel!
    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var answerLable: UILabel!
    @IBAction func submitButton(_ sender: Any) {
        
        let usersGuess = Int(numberInput.text!)
        
        if(usersGuess != nil) {
            if(usersGuess! > answer) {
                answerLable.text = "ใกล้ถูกแล้ว แต่เยอะเกินไป"
                updateHP(HP: hp - 10)
            }
            else if(usersGuess! < answer) {
                answerLable.text = "ใกล้ถูกแล้ว แต่น้อยเกินไป"
                updateHP(HP: hp - 10)
            }
            else {
                answerLable.text = "ถูกต้อง เก่งจัง"
                let alert = UIAlertController(title: "จบเกม", message: "คุณทายถูก เก่งมาก!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                updateHP(HP: 100)
                resetGame()
            }
            
            if(hp <= 0) {
                answerLable.text = "จบเกม"
                let alert = UIAlertController(title: "จบเกม", message: "กระจอกปลาหางนกยูง!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                updateHP(HP: 100)
                resetGame()
            }
        }
        else {
            answerLable.text = "กรุณากรอกตัวเลขเท่านั้น"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetGame()
        updateHP()
    }
    
    func randomNumber() -> Int {
        let randomInt = Int.random(in: 1..<100)
        return randomInt
    }
    
    func resetGame() {
        answer = randomNumber()
        answerLable.text = "ทายตัวเลขระหว่าง 0 - 99"
        print("คำตอบคือ \(answer)")
    }
    
    func updateHP(HP: Int = 100) {
        hp = HP
        hpLable.text = "Your HP : \(hp)"
        print("now set HP to \(hp)!")
    }


}

