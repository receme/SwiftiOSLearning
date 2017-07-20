//
//  FirebaseManager.swift
//  SwiftiOSLearning
//
//  Created by tahmid on 6/1/17.
//  Copyright © 2017 Infolytx. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class FirebaseManager : FirebaseService{
    
    init() {
        
    }
    
    func registerUser(_ userObj: User, _ callback: Callback) -> Void{
        
        Auth.auth().createUser(withEmail: userObj.email, password: userObj.password) { (user,error) in
            
            if(error == nil){
                
                callback.onUserCreateSuccess(user: userObj);
                
            }
            else{
                print(error ?? "");
                callback.onUserCreateFailure(message: (error?.localizedDescription)!);
            }
            
        };
    
    }
    
}
