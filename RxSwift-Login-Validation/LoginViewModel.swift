//
//  LoginViewModel.swift
//  RxSwift-Login-Validation
//
//  Created by Nipuna's MacMini on 7/12/17.
//  Copyright © 2017 Nipuna H Herath. All rights reserved.
//

import Foundation
import RxSwift
struct LoginViewModel {
    var username = Variable<String>("")
    var password = Variable<String>("")
    
    var isValid: Observable<Bool>{
        return Observable.combineLatest(username.asObservable(),password.asObservable()){ email,password in
            email.characters.count >= 3 && password.characters.count >= 3
        }
    }
    
    func loginPressed() {
        print("Login pressed")
    }
    
}
