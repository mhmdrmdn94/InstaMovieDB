//
//  UIView+rounded.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(withRadius cornerRadius: CGFloat,
                      borderWidth: CGFloat = 0,
                      borderColor: UIColor? = .clear) {
        layer.borderWidth   = borderWidth
        layer.borderColor   = borderColor?.cgColor
        layer.cornerRadius  = cornerRadius
        layer.masksToBounds = true
        clipsToBounds       = true
    }
}
