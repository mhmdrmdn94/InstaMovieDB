//
//  CustomLoadingFooter.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class CustomLoadingFooter: UIView {
    
    @IBOutlet fileprivate var contentView: UIView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    private func initView() {
        contentView = loadFromNib(named: CustomLoadingFooter.nibName)!
        addSubview(contentView)
        pinItemToEdges(item: contentView)
    }
    

}
