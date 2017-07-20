//
//  SignupView.swift
//  SwiftiOSLearning
//
//  Created by tahmid on 6/1/17.
//  Copyright © 2017 Infolytx. All rights reserved.
//

import Foundation


protocol SignupView:NSObjectProtocol {
    
    func showErrorMessage(message:String);
    func onSignupComplete(user:User);
    func onSignupFailure();
}
