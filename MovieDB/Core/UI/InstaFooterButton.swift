//
//  InstaFooterButton.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/17/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

@IBDesignable class InstaFooterButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundCorners(withRadius: 5)
        self.backgroundColor = InstaMovieColor.primary.value
        self.setTitleColor(InstaMovieColor.secondry.value, for: .normal)
    }
    
}
