//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var avatarImageView: UIImageView!
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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }
    
    func setupView() {
        //TODO: setup rounded views and colors
    }
    
    private func configure(viewModel: MovieViewModel) {
        self.avatarImageView.image = viewModel.posterImage
        self.releaseDateLabel.text = viewModel.dateString
        self.titleLabel.text = viewModel.title
        self.overviewLabel.text = viewModel.overview
    }
    
}
