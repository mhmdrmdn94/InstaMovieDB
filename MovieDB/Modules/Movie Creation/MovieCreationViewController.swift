//
//  MovieCreationViewController.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

protocol MovieCreationDelegate: class {
    func didCreateNewMovie(_ movie: Movie)
}

class MovieCreationViewController: BaseViewController {

    @IBOutlet fileprivate weak var titleTextField: UITextField!
    @IBOutlet fileprivate weak var pickDateButton: UIButton!
    @IBOutlet fileprivate weak var overviewTextView: UITextView!
    @IBOutlet fileprivate weak var pickPosterButton: UIButton!
    @IBOutlet fileprivate weak var createButton: UIButton!
    
    weak var delegate: MovieCreationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setupView() {
        
    }
    
    @IBAction func pickDateButtonTapped(_ sender: UIButton) {
        //TODO: open date picker
    }
    
    @IBAction func pickPosterButtonTapped(_ sender: UIButton) {
        //TODO: open gallery
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        let newMovie = self.createMovie()
        delegate?.didCreateNewMovie(newMovie)
    }
    
    func createMovie() -> Movie {
        let  movie = Movie(movieId: "", title: nil, overview: nil, posterUrlString: nil, releaseDate: nil)
        return movie
        
    }
    
    
}
