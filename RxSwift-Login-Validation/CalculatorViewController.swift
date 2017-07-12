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
        _ = tfNumber1.rx.text.map{ Double($0!) ?? 0.0 }.bind(to: calculatorViewModel.number1)
        _ = tfNumber2.rx.text.map{ Double($0!) ?? 0.0 }.bind(to: calculatorViewModel.number2)
        
        _ = calculatorViewModel.changeOperator.bind(to: lblOperator.rx.text)
        _ = calculatorViewModel.calcAnswer.map{ "\($0)" }.bind(to: lblSum.rx.text)
    }

    @IBAction func changeop(_ sender: UIButton) {
        calculatorViewModel.changeOperator(buttonId: sender.tag)
    }
}
