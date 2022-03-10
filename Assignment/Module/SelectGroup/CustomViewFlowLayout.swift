//
//  CustomViewFlowLayout.swift
//  Assignment
//
//  Created by Bhavesh on 06/01/22.
//

import UIKit

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    let itemSpacing: CGFloat = 3.0

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        let attriuteElementsInRect = super.layoutAttributesForElements(in: rect)
        var newAttributeForElement: Array<UICollectionViewLayoutAttributes> = []
        var leftMargin = self.sectionInset.left
        for tempAttribute in attriuteElementsInRect! {
            let attribute = tempAttribute
            if attribute.frame.origin.x == self.sectionInset.left {
                leftMargin = self.sectionInset.left
            }
            else {
                var newLeftAlignedFrame = attribute.frame
                newLeftAlignedFrame.origin.x = leftMargin
                attribute.frame = newLeftAlignedFrame
            }
            leftMargin += attribute.frame.size.width + itemSpacing
            newAttributeForElement.append(attribute)
        }
        return newAttributeForElement
    }
}
