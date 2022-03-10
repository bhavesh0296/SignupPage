//
//  RoundButton.swift
//  RoundButtonsTutorial
//
//  Created by Luke Lapresi on 10/2/17.
//  Copyright © 2017 Luke Lapresi. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCR(_value: cornerRadius)
        }
    }
    
    func refreshCR(_value: CGFloat) {
        layer.cornerRadius = _value
    }
    
    
    override init(frame: CGRect) {
        print("init(frame:)")
        super.init(frame: frame);
        
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        print("prepareForInterfaceBuilder()")
        sharedInit()
    }
    
    func sharedInit() {
        refreshCR(_value: cornerRadius)
    }
}

