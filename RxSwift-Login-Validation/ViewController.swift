//
//  ViewController.swift
//  RxSwift-Login-Validation
//
//  Created by Nipuna's MacMini on 7/12/17.
//  Copyright © 2017 Nipuna H Herath. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var validitylabel: UILabel!
    @IBOutlet weak var loginbutton: UIButton!

    var loginViewModel = LoginViewModel()
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = username.rx.text.map{ $0 ?? "" }.bind(to: loginViewModel.username)
        _ = password.rx.text.map{ $0 ?? "" }.bind(to: loginViewModel.password)
        
        _ = loginViewModel.isValid.bind(to: loginbutton.rx.isEnabled)
        
        _ = loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.validitylabel.text = isValid ? "Valid" : "Form is Invalid"
            self.validitylabel.textColor = isValid ? UIColor.green : UIColor.red
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

