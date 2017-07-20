//
//  HomViewController.swift
//  SwiftiOSLearning
//
//  Created by tahmid on 7/20/17.
//  Copyright © 2017 Infolytx. All rights reserved.
//

import UIKit

class HomViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    
    var user:User? = nil;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaults.standard.set(true, forKey: "logged_in");
        UserDefaults.standard.synchronize()
        
        
        if(user==nil){
            user?.name = UserDefaults.standard.object(forKey: "name") as! String
            user?.email = UserDefaults.standard.object(forKey: "name") as! String
        }
        
        nameLabel.text = user?.name;
        emailLabel.text = user?.email;
        
    }
    
    @IBAction func logoutBtnClicked(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "logged_in");
        UserDefaults.standard.set("", forKey: "name");
        UserDefaults.standard.set("", forKey: "email");
        UserDefaults.standard.synchronize();
        
//        let loginviewcontroller = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//        navigationController?.setViewControllers([loginviewcontroller], animated: true)
        
        let viewcontroller = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController;
        navigationController?.setViewControllers([viewcontroller], animated: true);

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
