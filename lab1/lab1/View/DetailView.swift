//
//  DetailView.swift
//  lab1
//
//  Created by Adam Bokun on 28.10.21.
//

import Foundation
import UIKit

final class DetailView: UIView {
    
    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let repoLabel = UILabel()

    init(event: Events) {
        super.init(frame: .zero)
        setupUI()
        setupData(event: event)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        setupImage()
//        setupData()
        setupName()
        setupRepo()
    }

    func setupImage() {
        self.addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.contentMode = .scaleAspectFit
        imageIV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageIV.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        imageIV.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0.5).isActive = true
        imageIV.heightAnchor.constraint(equalTo: imageIV.widthAnchor).isActive = true
    }
    
    func setupName() {
        self.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: imageIV.bottomAnchor, constant: 10).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.textColor = .black
    }
    
    func setupRepo() {
        self.addSubview(repoLabel)
        
        repoLabel.textAlignment = .center
        repoLabel.numberOfLines = 0
        repoLabel.lineBreakMode = .byWordWrapping
        repoLabel.translatesAutoresizingMaskIntoConstraints = false
        repoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        repoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5).isActive = true
        repoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        repoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        repoLabel.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        repoLabel.textColor = .black
    }
    
//    func setupDismissButton() {
//        view.addSubview(dismissButton)
//
//        dismissButton.translatesAutoresizingMaskIntoConstraints = false
//        dismissButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
//        dismissButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//
//        dismissButton.setTitle("Dismiss", for: .normal)
//        self.dismiss(animated: true, completion: nil)
//    }
    
    func setupData(event: Events) {
        if let url = URL(string: event.actor.avatar_url) {
            imageIV.loadImage(from: url)
            nameLabel.text = "Author: " + event.actor.login
            repoLabel.text = "Repository: " + event.repo.name
        }
    }

    
}
