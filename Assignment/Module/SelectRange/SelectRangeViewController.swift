//
//  SelectRangeViewController.swift
//  Assignment
//
//  Created by Bhavesh on 06/01/22.
//

import UIKit

class SelectRangeViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitClicked(_ sender: UIButton) {
        navigateToSelectGroup()
    }
    
    fileprivate func navigateToSelectGroup() {
        let vc = ViewControllerAccessors.getViewController(SelectGroupViewController.self,
                                                           storyboard: .Main)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
