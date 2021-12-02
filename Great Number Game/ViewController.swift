//
//  ViewController.swift
//  Great Number Game
//
//  Created by administrator on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {

    
    var number: Int = 0
    @IBOutlet weak var inputNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputNumber.keyboardType = UIKeyboardType.numberPad
        updateRandomNumber()
        print (number)
    }

    
    @IBAction func submitButton(_ sender: UIButton) {
        let input = inputNumber.text!
        if input.isEmpty {
            showAlertOfEmptyField()
        }else{
            if Int(input) == number {
                showSuccessfulAlert()
            }else{
                showFailureAlert()
            }
        }
    }
    
    private func updateRandomNumber() {
        number =  Int.random(in: 1...100)
    }
    
    
    private func showAlertOfEmptyField(){
        
        // create alert
        let alert = UIAlertController(title: "Empty Input", message: "Please Enter a Number Before Submit", preferredStyle: UIAlertController.Style.alert)
        
        //add action
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion:  nil)
    }
    
    private func showSuccessfulAlert(){
        
        let alert = UIAlertController(title: "You Win", message: "\(number) was correct", preferredStyle: UIAlertController.Style.alert)
        
        // change background color
        alert.view.subviews.first?.subviews.first?.backgroundColor = UIColor.green
        
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: {
            action in
            self.updateRandomNumber()
            self.inputNumber.text = ""
        }))
        
        self.present(alert, animated: true, completion: nil)
                        
    }
    
    private func showFailureAlert(){
        
        let alert = UIAlertController(title: "incorrect", message: "\(inputNumber.text!) is not correct", preferredStyle: UIAlertController.Style.alert)
        
        alert.view.subviews.first?.subviews.first?.backgroundColor = UIColor.red

        alert.addAction(UIAlertAction(title: "Guess Again", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
                        
    }
}

