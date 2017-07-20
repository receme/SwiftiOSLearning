//
//  FirebaseService.swift
//  SwiftiOSLearning
//
//  Created by tahmid on 6/1/17.
//  Copyright © 2017 Infolytx. All rights reserved.
//

import Foundation

protocol FirebaseService{
    
    func registerUser(_ user:User,_ callback:Callback) ->Void
    
}

protocol Callback {
    func onUserCreateSuccess(user:User);
    func onUserCreateFailure(message:String);
}
