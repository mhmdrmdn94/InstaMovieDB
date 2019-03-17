//
//  MovieCreationViewController.swift
//  MovieDB
//
//  Created by Mo-Ramadan Abdelhafez on 3/11/19.
//  Copyright © 2019 Mo-Ramadan Abdelhafez. All rights reserved.
//

import UIKit

enum ImagePickerType {
    case camera, gallery
}

protocol MovieCreationDelegate: class {
    func didCreateNewMovie(_ movie: Movie)
}

class MovieCreationViewController: BaseViewController {

    @IBOutlet fileprivate weak var titleTextField: UITextField!
    @IBOutlet fileprivate weak var dateTextField: UITextField!
    @IBOutlet fileprivate weak var overviewTextView: UITextView!
    @IBOutlet fileprivate weak var pickPosterButton: UIButton!
    @IBOutlet fileprivate weak var posterTextField: UITextField!
    @IBOutlet fileprivate weak var createButton: UIButton!
    
    weak var delegate: MovieCreationDelegate?
    
    fileprivate var imagePickerController: UIImagePickerController?
    fileprivate var datePicker: UIDatePicker?
    fileprivate var selectedImage: UIImage?
    fileprivate var selectedDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDatePicker()
    }

    func setupView() {
        navigationItem.title = "Create Movie"
        overviewTextView.roundCorners(withRadius: 5, borderWidth: 0.5, borderColor: .lightGray)
        createButton.backgroundColor = InstaMovieColor.primary.value
        createButton.roundCorners(withRadius: 5)
    }
    
    @IBAction func pickPosterButtonTapped(_ sender: UIButton) {
        self.showImageDataSourceAlert()
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        let newMovie = self.createMovie()
        delegate?.didCreateNewMovie(newMovie)
        navigationController?.popViewController(animated: true)
    }
    
    func createMovie() -> Movie {
        let movieId = 1     //constant because movieId it is useless
        let title = titleTextField.text
        let overview = overviewTextView.text
        let posterImage = selectedImage
        let releaseDate = selectedDate
        let  movie = Movie(movieId: movieId, title: title, overview: overview, posterPath: nil, posterImage: posterImage, releaseDate: releaseDate)
        return movie
        
    }
}

fileprivate extension MovieCreationViewController {
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTappedInDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelTappedInDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker
    }
    
    @objc func doneTappedInDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        dateTextField.text = formatter.string(from: datePicker?.date ?? Date())
        selectedDate = datePicker?.date
        view.endEditing(true)
    }
    
    @objc func cancelTappedInDatePicker() {
        view.endEditing(true)
    }
}

fileprivate extension MovieCreationViewController {
    func showImageDataSourceAlert() {
        let alert = UIAlertController(title: "Choose image data-source",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.openImagePicker(type: .camera)
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.openImagePicker(type: .gallery)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func openImagePicker(type: ImagePickerType) {
        imagePickerController = UIImagePickerController()
        imagePickerController?.delegate = self
        imagePickerController?.allowsEditing = false
        
        switch type {
        case .camera:
            imagePickerController?.sourceType = .camera
            imagePickerController?.cameraCaptureMode = .photo
            
        case .gallery:
            imagePickerController?.sourceType = .photoLibrary
        }
        
        if let picker = imagePickerController {
            present(picker, animated: true, completion: nil)
        }
    }
}

extension MovieCreationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.selectedImage = image
        }
        
        if let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            self.posterTextField.text = imageURL.lastPathComponent
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Picker cancelled ..")
    }
}
