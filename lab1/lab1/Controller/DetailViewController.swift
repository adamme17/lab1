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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        if let event = event {
            detailView = DetailView(event: event)
            setupUI()
        }
    }
    
    func setupUI() {
        guard let detailView = detailView else { return }
        view.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        detailView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}
