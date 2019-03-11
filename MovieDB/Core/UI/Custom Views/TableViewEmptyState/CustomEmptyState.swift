//
//  CustomEmptyState.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class CustomEmptyState: UIView {

    @IBOutlet fileprivate var contentView: UIView!
    @IBOutlet fileprivate weak var avatarImageView: UIImageView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    private func initView() {
        contentView = loadFromNib(named: CustomEmptyState.nibName)!
        addSubview(contentView)
        pinItemToEdges(item: contentView)
    }
    
}
