//
//  ViewController.swift
//  AdopshunSegment
//
//  Created by Matrix Marketers on 30/11/23.
//

import UIKit
import AdopshunSDK

var selectedUserId = ""

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    var emailArray = ["iosuser@adopshun.com", "iosuser2@adopshun.com", "iosdefaultuser@adopshun.com"]
    var userIDArray = ["101", "102", "103"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        emailTxtFld.text = "iosdefaultuser@adopshun.com"
        passwordTxtFld.text = "adopshun@123"
//        ScreenDataGetter.shared.showOnboarding(userID: "")
        // Do any additional setup after loading the view.
    }


    @IBAction func loginAction(_ sender: UIButton) {
        validation()
    }
    
    //MARK: Validations for login fields
    func validation(){
        guard let second = emailTxtFld.text, second != "" else {
            self.showAlert(title: "Alert", message: "Please enter email.")
            return
        }
        
        guard let forth = passwordTxtFld.text, forth != "" else {
            self.showAlert(title: "Alert", message: "Please enter password.")
            return
        }
        
        guard let validEmail = emailTxtFld.text, emailArray.contains(validEmail) else {
            self.showAlert(title: "Alert", message: "Please enter valid email.")
            return
        }
        
        guard let validPassword = passwordTxtFld.text, validPassword == "adopshun@123" else {
            self.showAlert(title: "Alert", message: "Please enter valid password.")
            return
        }
        
        for i in 0..<emailArray.count{
            if validEmail == emailArray[i] {
                selectedUserId = userIDArray[i]
                print("selectedUserId...",selectedUserId)
            }
        }
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ItemListControl") as? ItemListControl
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
}

