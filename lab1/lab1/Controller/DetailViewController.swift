//
//  DetailViewController.swift
//  lab1
//
//  Created by Adam Bokun on 26.10.21.
//

import UIKit

class DetailViewController: UIViewController {
    var event: Events?
    
    var safeArea: UILayoutGuide!
    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let repoLabel = UILabel()
//    let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        setupImage()
        setupData()
        setupName()
        setupRepo()
//        setupDismissButton()
    }
    
    func setupImage() {
        view.addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.contentMode = .scaleAspectFit
        imageIV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageIV.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        imageIV.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: 0.5).isActive = true
        imageIV.heightAnchor.constraint(equalTo: imageIV.widthAnchor).isActive = true
    }
    
    func setupName() {
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: imageIV.bottomAnchor, constant: 10).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        nameLabel.textColor = .black
    }
    
    func setupRepo() {
        view.addSubview(repoLabel)
        
        repoLabel.translatesAutoresizingMaskIntoConstraints = false
        repoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        repoLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        repoLabel.textColor = .black
    }
    
//    func setupDismissButton() {
//        view.addSubview(dismissButton)
//
//        dismissButton.translatesAutoresizingMaskIntoConstraints = false
//        dismissButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50).isActive = true
//        dismissButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
//
//        dismissButton.setTitle("Dismiss", for: .normal)
//        self.dismiss(animated: true, completion: nil)
//    }
    
    func setupData() {
        if let event = event,
           let url = URL(string: event.actor.avatar_url)
        {
            imageIV.loadImage(from: url)
            nameLabel.text = "Author: " + event.actor.login
            repoLabel.text = "Repository: " + event.repo.name
        }
    }
}
