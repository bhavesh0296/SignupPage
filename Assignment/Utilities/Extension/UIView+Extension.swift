//
//  UIView+Extension.swift
//  Assignment
//
//  Created by Bhavesh on 07/01/22.
//

import UIKit

extension UIView {
    
    func roundCorner(value: CGFloat) {
        layer.cornerRadius = value
        layer.masksToBounds = true
    }
}
