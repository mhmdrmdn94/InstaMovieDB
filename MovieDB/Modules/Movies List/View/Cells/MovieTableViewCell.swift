//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var containerView: UIView!
    @IBOutlet fileprivate weak var avatarActivityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var avatarImageView: InstaImageView!
    @IBOutlet fileprivate weak var releaseDateLabel: UILabel!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var overviewLabel: UILabel!
    
    var viewModel: MovieViewModel? {
        didSet {
            if let viewModel = viewModel {
                self.configure(viewModel: viewModel)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        avatarActivityIndicator.isHidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
        avatarImageView.image = nil
    }
    
    func setupView() {
        containerView.roundCorners(withRadius: 5)
        avatarImageView.roundCorners(withRadius: 5)
        titleLabel.textColor = InstaMovieColor.primary.value
        overviewLabel.textColor = InstaMovieColor.primary.value
    }
    
    private func configure(viewModel: MovieViewModel) {
       if let imageUrl = URL(string: viewModel.posterImageUrlString ?? "") {
            avatarImageView.setImage(withUrl: imageUrl)
        }
        self.releaseDateLabel.text = viewModel.dateString
        self.titleLabel.text = viewModel.title
        self.overviewLabel.text = viewModel.overview
    }
    
}
