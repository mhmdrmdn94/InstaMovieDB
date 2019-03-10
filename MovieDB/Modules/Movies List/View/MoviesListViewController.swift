//
//  MoviesListViewController.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/10/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

class MoviesListViewController: BaseViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!
    
    var presenter: MoviesListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        presenter?.loadMovies()
    }
    
    private func setupView() {
        //TODO: setup colors and navbar title ;;; make it largeTitle
    }
}

extension MoviesListViewController {
    
    var cells: [UITableViewCell.Type] {
        return [MovieTableViewCell.self]
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        registerCells()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func registerCells() {
        cells.forEach { cellClassName in
            let cellName = String(describing: cellClassName)
            let nib = UINib(nibName: cellName, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: cellName)
        }
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        //TODO: later an enum to represent allMovies and myMovies sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: get this from interactor according to your data source
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTableViewCell.self)) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        return cell
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
        let emptyView = CustomEmptyState()
        tableView.backgroundView = emptyView
    }
    
    func hideEmptyState() {
        tableView.backgroundView = nil
    }
    
    func showLoaderState() {
        let loadingView = CustomLoadingView()
        tableView.backgroundView = loadingView
    }
    
    func hideLoaderState() {
         tableView.backgroundView = nil
    }
    
    func showErrorMessage(_ message: String) {
        Alert.show(message: message)
    }
}
