//
//  CalculatorViewController.swift
//  RxSwift-Login-Validation
//
//  Created by Nipuna's MacMini on 7/12/17.
//  Copyright © 2017 Nipuna H Herath. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var tfNumber1: UITextField!
    @IBOutlet weak var tfNumber2: UITextField!
    @IBOutlet weak var lblOperator: UILabel!
    @IBOutlet weak var lblSum: UILabel!
    
    

    var calculatorViewModel = CalculatorViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /** 
         * Bind the textbox text to the relevent variable in the ViewModal.
         * You can do any changes to the value by using the map{ } function.
         * $0 is the raw value of the text that you enter into the textfield
         * { Double($0!) ?? 0.0 } will check if the entered text is a double value. 
         * If the entered value is not a double value, 0.0 will be passed into the calculation.
         * If left side of ?? is null, right side value will be assigned.
         */
        _ = tfNumber1.rx.text.map{ Double($0!) ?? 0.0 }.bind(to: calculatorViewModel.number1)
        _ = tfNumber2.rx.text.map{ Double($0!) ?? 0.0 }.bind(to: calculatorViewModel.number2)
        
        /**
         * Bind the ViewModal's function's return values to UILabels.
         * calculatorViewModel.changeOperator will return a string according to the button you press(+ , - , * , /).
         * calculatorViewModel.calcAnswer will return the calculated answer.
         */
        _ = calculatorViewModel.changeOperator.bind(to: lblOperator.rx.text)
        _ = calculatorViewModel.calcAnswer.map{ "\($0)" }.bind(to: lblSum.rx.text)
    }

    /**
     * Calculator operator button click event. I have given each button a tag using the UI builder.
     * Send the button tag to viewmodal.
     */
    @IBAction func changeop(_ sender: UIButton) {
        calculatorViewModel.changeOperator(buttonId: sender.tag)
    }
}
