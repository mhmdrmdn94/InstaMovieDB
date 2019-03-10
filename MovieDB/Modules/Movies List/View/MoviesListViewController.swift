//
//  MoviesListViewController.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class MoviesListViewController: BaseViewController {

    var presenter: MoviesListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MoviesListViewController: MoviesListViewProtocol {
   
    func reloadData() {
        //TODO: reload table-view
    }
    
    func reloadCellAt(indexPath: IndexPath) {
        //TODO: reload cell at
    }
    
    func showFooterLoaderView() {
        //TODO: show footer loader
    }
    
    func hideFooterLoaderView() {
        //TODO: hide footer loader
    }
    
    
    func showEmptyState() {
        //TODO: show empty state for no movies
    }
    
    func hideEmptyState() {
        //TODO: hide empty state for no movies
    }
    
    func showLoaderState() {
        //TODO: show loading state
    }
    
    func hideLoaderState() {
        //TODO: hide loading state
    }
    
    func showErrorMessage(_ message: String) {
        Alert.show(message: message)
    }
}
