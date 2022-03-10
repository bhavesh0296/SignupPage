//
//  ViewController.swift
//  Assignment
//
//  Created by Bhavesh on 06/01/22.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var loginInputField: SKFloatingTextField!
    @IBOutlet weak var containerRoundView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialViewSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        containerRoundView.roundCorner(value: 18)
    }
    
    private func initialViewSetup() {
        loginInputField.keyBoardType = .default
        loginInputField.floatingLabelText = "Enter Mobile Number/Email"
        loginInputField.placeholderColor = UIColor(red: 69/255, green: 79/255, blue: 99/255, alpha: 0.5)
        loginInputField.placeholder = "Enter Mobile Number/Email"
        loginInputField.floatingLabelColor = UIColor(red: 69/255, green: 79/255, blue: 99/255, alpha: 0.5)
        
        loginInputField.setRoundTFUI()
        loginInputField.activeBorderColor = UIColor.black
        
    }
    
    @IBAction func continueClicked(_ sender: UIButton) {
        navigateToLoginOTP()
        
    }
    
    
    fileprivate func navigateToLoginOTP() {
        let vc = ViewControllerAccessors.getViewController(LoginOTPViewController.self,
                                                           storyboard: .Main)
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

