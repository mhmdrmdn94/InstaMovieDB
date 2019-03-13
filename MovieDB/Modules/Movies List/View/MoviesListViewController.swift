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
        initNavbar()
        presenter?.loadMovies()
    }
    
    private func setupView() {
        navigationItem.title = "MoviesDB"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.backgroundColor = InstaMovieColor.secondry.value
    }
}

fileprivate extension MoviesListViewController {
    func initNavbar() {
        let createMovieButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createMovieButttonTapped(sender:)))
        navigationItem.rightBarButtonItem = createMovieButton
    }
    
    @objc func createMovieButttonTapped(sender: UIBarButtonItem) {
        presenter?.openCreateMovieViewController()
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
        return presenter?.getNumberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfRows(atSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = presenter?.getMovieViewModelAt(indexPath),
            let cell  = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTableViewCell.self)) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionType = MoviesSectionType(rawValue: section) else { return nil }
        return sectionType.sectionTitle
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isLoadMoreIndexPath(indexPath) {
            presenter?.loadMoreMovies()
        }
    }
    
    private func isLoadMoreIndexPath(_ indexPath: IndexPath) -> Bool {
        let hasNextPage = presenter?.getHasMorePages() ?? false
        if !hasNextPage {
            return false
        }
        
        let totalNumberOfRows = presenter?.getNumberOfRows(atSection: MoviesSectionType.allMovies.rawValue) ?? 0
        let currentRowIndex = indexPath.row
        if totalNumberOfRows == 0 || ((totalNumberOfRows - 1) > currentRowIndex) {
            return false
        }
        
        return true
    }
}

extension MoviesListViewController: MoviesListViewProtocol {
   
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func reloadCellAt(indexPath: IndexPath) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func showFooterLoaderView() {
        DispatchQueue.main.async { [weak self] in
            let footerView = CustomLoadingFooter(frame: CGRect(x: 0, y: 0, width: self?.tableView.frame.width ?? 100, height: 30))
            self?.tableView.tableFooterView = footerView
        }
    }
    
    func hideFooterLoaderView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.tableFooterView = nil
        }
    }
    
    func showEmptyState() {
        DispatchQueue.main.async { [weak self] in
            let emptyView = CustomEmptyState()
            self?.tableView.backgroundView = emptyView
        }
    }
    
    func hideEmptyState() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.backgroundView = nil
        }
    }
    
    func showLoaderState() {
        DispatchQueue.main.async { [weak self] in
            let loadingView = CustomLoadingView()
            self?.tableView.backgroundView = loadingView
        }
    }
    
    func hideLoaderState() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.backgroundView = nil
        }
    }
    
    func showErrorMessage(_ message: String) {
        Alert.show(message: message)
    }
}
