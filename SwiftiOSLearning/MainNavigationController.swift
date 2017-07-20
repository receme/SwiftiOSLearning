//
//  MainNavigationController.swift
//  SwiftiOSLearning
//
//  Created by tahmid on 7/20/17.
//  Copyright © 2017 Infolytx. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let isLoggedIn = UserDefaults.standard.object(forKey: "logged_in") as! Bool
        
        print(isLoggedIn)
        
        if(isLoggedIn){
            let viewController = storyboard?.instantiateViewController(withIdentifier: "HomViewController") as! HomViewController;
            navigationController?.setViewControllers([viewController], animated: false)
        }
        else{
            let signupviewcontroller = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController;
            navigationController?.setViewControllers([signupviewcontroller], animated: false)
        }
        
    }


}
