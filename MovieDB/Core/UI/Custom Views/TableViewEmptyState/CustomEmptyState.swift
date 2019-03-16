//
//  CustomEmptyState.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

enum InstaEmptyStateType {
    case noResultsFound
    case noInternetConnection
    case somethingWentWrong
    
    var title: String {
        switch self {
        case .noResultsFound:
            return "No movies found!"
        case .noInternetConnection:
            return "Internet connection seems to be offline!"
        case .somethingWentWrong:
            return "Ops! Something went wrong!"
        }
    }
    
    var avatar: UIImage {
        //TODO: get more realistic icons for a better ui appearance
        return #imageLiteral(resourceName: "noresults")
    }
}


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
    
    func configure(type: InstaEmptyStateType) {
        titleLabel.text = type.title
        avatarImageView.image = type.avatar
    }
    
}
