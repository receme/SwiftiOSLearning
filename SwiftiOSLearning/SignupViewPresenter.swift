//
//  SignupViewPresenter.swift
//  SwiftiOSLearning
//
//  Created by tahmid on 6/1/17.
//  Copyright © 2017 Infolytx. All rights reserved.
//

import Foundation

class SignupViewPresenter : Callback{
    
    weak private var view:SignupView?
    private var service:FirebaseService?
    
    init(signupView : SignupView, firebaseService:FirebaseService) {
        view = signupView
        service = firebaseService
    }
    
    func intializeView() ->Void{
        
    }
    
    func signupUser(user:User) -> Void {
        
        if(self.isValidUser(user: user)){
            
            service?.registerUser(user,self);
            
        }
    }
    
    func onUserCreateSuccess(user:User) ->Void{
        
        view?.onSignupComplete(user:user);
        
    }
    
    func onUserCreateFailure(message:String) -> Void{
        
        view?.onSignupFailure();
        view?.showErrorMessage(message:message);
    }
    
    
    func isValidUser(user:User?) -> Bool{
        
        guard let user = user else {
            view?.showErrorMessage(message: "User cannot be null");
            return false;
        }
        
        let name = user.name;
        let email = user.email;
        let password = user.password;
        let confirmpassword = user.confirmPassword;
        
        if(name.isEmpty){
            view?.showErrorMessage(message: "Name cannot be empty");
            return false;
        }
        
        if(email.isEmpty){
            view?.showErrorMessage(message: "Email cannot be empty");
            return false;
        }
        
        if(password.isEmpty){
            view?.showErrorMessage(message: "Password cannot be empty");
            return false;
        }
        
        if(confirmpassword.isEmpty){
            view?.showErrorMessage(message: "Password cannot be empty");
            return false;
        }
        if(email.isValidEmail() == false){
            view?.showErrorMessage(message: "Email is not valid");
            return false;
        }
        
        
        if(password != confirmpassword){
            view?.showErrorMessage(message: "Password does not match.");
            return false;
        }
        
        
        return true;
    }
    
    
    
    
    
    
}
