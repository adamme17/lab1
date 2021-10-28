//
//  DetailViewController.swift
//  lab1
//
//  Created by Adam Bokun on 26.10.21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var event: Events?
    var detailView: DetailView?
    
    var safeArea: UILayoutGuide!
//    let imageIV = CustomImageView()
//    let nameLabel = UILabel()
//    let repoLabel = UILabel()
//    let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        //showError()
        if let event = event {
            detailView = DetailView(event: event)
            setupUI()
        }
//        setupDismissButton()
    }
    
    func setupUI() {
        guard let detailView = detailView else { return }
        view.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        //detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       // detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        detailView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
//        detailView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
//        detailView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
//        detailView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        detailView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        detailView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func showError() {
        
//        let alert = UIAlertController(title: "Error", message: "Missing event struct", preferredStyle: UIAlertController.Style.alert)
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { _ in
//            self.dismiss(animated: true, completion: nil)
//                }))
//        self.view.addSubview(alert.view)
//        alert.view.translatesAutoresizingMaskIntoConstraints = false
//        alert.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        alert.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        self.present(alert, animated: true, completion: nil)
//
    }
    
}
