//
//  SignupViewController.swift
//  SwiftiOSLearning
//
//  Created by tahmid on 6/1/17.
//  Copyright © 2017 Infolytx. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, SignupView {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var okBtn: UIButton!
    
    private var presenter:SignupViewPresenter!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = SignupViewPresenter(signupView: self,firebaseService: FirebaseManager());
        presenter.intializeView();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func okBtnClicked(_ sender: UIButton) {
        
        let userInfo = User(name: nameTF.text!,email: emailTF.text!,password: passwordTF.text!,confirmPassword: confirmPasswordTF.text!);
        
        presenter.signupUser(user: userInfo);
    }
    
    
    func showErrorMessage(message: String) {
        print(message)
    }
    
    func onSignupComplete(user:User) {
        
        print(user);
        print("signup complete");
        
        UserDefaults.standard.set(user.name, forKey: "user");
        UserDefaults.standard.set(user.email, forKey: "email");
        UserDefaults.standard.synchronize()
        
        let homviewcontroller = storyboard?.instantiateViewController(withIdentifier: "HomViewController") as! HomViewController
        homviewcontroller.user = user;
        navigationController?.setViewControllers([homviewcontroller], animated: true)
        
        
    }
    
    func onSignupFailure() {
        print("signup was not completed");
    }
    

}
