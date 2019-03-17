//
//  UIView+nib.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

extension UIView {
    static var nibName: String {
        return String(describing: self)
    }
    
    @discardableResult
    func loadFromNib(named: String,
                     owner: UIView? = nil,
                     options: [AnyHashable : Any]? = nil) -> UIView? {
        let nibOwner    = owner ?? self
        let bundle      = Bundle(for: type(of: self))
        let nib         = UINib(nibName: named, bundle: bundle)
        return nib.instantiate(withOwner: nibOwner, options: options as? [UINib.OptionsKey : Any]).first as? UIView
    }
}
