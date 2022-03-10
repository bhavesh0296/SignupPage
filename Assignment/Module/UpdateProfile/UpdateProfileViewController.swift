//
//  UpdateProfileViewController.swift
//  Assignment
//
//  Created by Bhavesh on 06/01/22.
//

import UIKit


class UpdateProfileViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: SKFloatingTextField!
    @IBOutlet weak var lastNameTextField: SKFloatingTextField!
    @IBOutlet weak var dateOfBirthTextField: SKFloatingTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func initialViewSetup() {
        firstNameTextField.keyBoardType = .default
        firstNameTextField.floatingLabelText = "First Name"
        firstNameTextField.placeholder = "First Name"
        firstNameTextField.floatingLabelColor = UIColor(red: 69/255, green: 79/255, blue: 99/255, alpha: 1.0)
        firstNameTextField.setRoundTFUI()
        firstNameTextField.activeBorderColor = UIColor.black
        
        lastNameTextField.keyBoardType = .default
        lastNameTextField.floatingLabelText = "Last Name"
        lastNameTextField.placeholder = "Last Name"
        lastNameTextField.floatingLabelColor = UIColor(red: 69/255, green: 79/255, blue: 99/255, alpha: 1.0)
        lastNameTextField.setRoundTFUI()
        lastNameTextField.activeBorderColor = UIColor.black
        
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        dateOfBirthTextField.keyBoardType = .default
        dateOfBirthTextField.floatingLabelText = "Date of Birth"
        dateOfBirthTextField.placeholder = "Date of Birth"
        dateOfBirthTextField.floatingLabelColor = UIColor(red: 69/255, green: 79/255, blue: 99/255, alpha: 1.0)
        dateOfBirthTextField.setRoundTFUI()
        dateOfBirthTextField.activeBorderColor = UIColor.black
        dateOfBirthTextField.inputView = datePickerView
        if let calenderImage = UIImage(named: "calendar") {
            dateOfBirthTextField.setRightView(image: calenderImage,
                                              tintColor: .black,
                                              action: nil)
        }
        datePickerView.addTarget(self,
                                 action: #selector(handleDatePicker(sender:)),
                                 for: .valueChanged)
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateOfBirthTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitClicked(_ sender: UIButton) {
        navigateToSelectRange()
    }
    
    fileprivate func navigateToSelectRange() {
        let vc = ViewControllerAccessors.getViewController(SelectRangeViewController.self,
                                                           storyboard: .Main)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
