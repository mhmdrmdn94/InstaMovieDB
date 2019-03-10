//
//  UIView+Constraints.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import Foundation


import UIKit

extension UIView {
    func activateLayoutAttributes(_ attributes: [NSLayoutConstraint.Attribute],
                                  for item: UIView,
                                  constants: [CGFloat] = [0, 0, 0, 0]) {
        var i = -1
        NSLayoutConstraint.activate(attributes.map {
            i += 1
            return NSLayoutConstraint(item: item, attribute: $0, relatedBy: .equal, toItem: self, attribute: $0, multiplier: 1, constant: constants[i])
        })
    }
    
    func pinItemToEdges(item: UIView,
                        constants: [CGFloat] = [0, 0, 0 ,0]) {
        item.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSLayoutConstraint.Attribute] = [.top, .trailing, .bottom, .leading]
        activateLayoutAttributes(attributes, for: item, constants: constants)
    }
    
}
