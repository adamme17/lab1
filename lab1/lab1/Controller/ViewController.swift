//
//  ViewController.swift
//  lab1
//
//  Created by Adam Bokun on 23.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var someList = [Events]()
    
    let eventsManager = EventsManager()
    
    var pageId = 1
    
    func loadEventsPage (pageId: Int) {
        eventsManager.getEvents(pageId: pageId) { result in
            switch result {
            case .success(let events):
                for event in events {
                    self.someList.append(event)
                    //self.someList.append(event.actor.login)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
       loadEventsPage(pageId: pageId)
    }
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        tableView.dataSource = self
        tableView.delegate = self
        
        //NetworkManager.shared.
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cellId")
        
        setupView()
    }

//    let anonymousFunction = {}
    
    // MARK: - Setup View
    
    func setupView() {
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return someList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let name = someList[indexPath.row]
        
        guard let customCell = cell as? CustomCell else {
            return cell
        } 
        
        customCell.nameLabel.text = name.actor.login
        customCell.typeLabel.text = name.type
        customCell.dateLabel.text = name.created_at
        if let url = URL(string: name.actor.avatar_url) {
            customCell.imageIV.loadImage(from: url)
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= someList.count - 1 || indexPath.row >= someList.endIndex {
            loadEventsPage(pageId: pageId + 1)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = self.someList[indexPath.row]
        let eventDetailVC = DetailViewController()
        eventDetailVC.event = event
        self.present(eventDetailVC, animated: true)
    }
}


