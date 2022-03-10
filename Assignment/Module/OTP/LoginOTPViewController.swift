//
//  LoginOTPViewController.swift
//  Assignment
//
//  Created by Bhavesh on 06/01/22.
//

import UIKit

class LoginOTPViewController: UIViewController {
    
    @IBOutlet weak var otpContainerView: UIView!
    let otpStackView = OTPStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func initialViewSetup() {
        let otpStackView = OTPStackView()
        otpContainerView.addSubview(otpStackView)
        otpStackView.delegate = self
        otpStackView.heightAnchor.constraint(equalTo: otpContainerView.heightAnchor).isActive = true
        otpStackView.centerXAnchor.constraint(equalTo: otpContainerView.centerXAnchor).isActive = true
        otpStackView.centerYAnchor.constraint(equalTo: otpContainerView.centerYAnchor).isActive = true
    }
    

    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func verifyClicked(_ sender: UIButton) {
        print("Entered OTP is \(otpStackView.getOTP())")
        navigateToUpdateProfile()
    }
    
    
    fileprivate func navigateToUpdateProfile() {
        let vc = ViewControllerAccessors.getViewController(UpdateProfileViewController.self,
                                                           storyboard: .Main)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension LoginOTPViewController: OTPDelegate {
    
    func didChangeValidity(isValid: Bool) {
        /// code when checking for OTP validity
    }
    
}
