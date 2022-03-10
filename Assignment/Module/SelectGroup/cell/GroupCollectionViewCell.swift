//
//  GroupCollectionViewCell.swift
//  Assignment
//
//  Created by Bhavesh on 06/01/22.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var roundContainer: UIView!
    
    var index: Int = 0
    var tapClosure: ((Int) -> Void)?
    
    
    func configure(with text: String, isSelected: Bool, index: Int) {
        label.text = text
        roundContainer.roundCorner(value: 8)
        self.index = index
        
        if isSelected {
            label.textColor = .white
            roundContainer.backgroundColor = UIColor(named: "colorBlue") ?? .blue
        } else {
            label.textColor = .black
            roundContainer.backgroundColor = UIColor(named: "colorLightGrayBackground") ?? .lightGray
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        roundContainer.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        tapClosure?(index)
    }
}
