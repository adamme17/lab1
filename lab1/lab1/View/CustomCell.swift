//
//  CustomCell.swift
//  lab1
//
//  Created by Adam Bokun on 26.10.21.
//

import UIKit

class CustomCell: UITableViewCell {
    var safeArea: UILayoutGuide!
    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let typeLabel = UILabel()
    let dateLabel = UILabel()
//    let dateFormatter: DateFormatter = {
//       let dateforamtter = DateFormatter()
//        dateforamtter.dateFormat = "MM/dd/yyyy"
//        return dateforamtter
//    }()
//
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    func setupView() {
        safeArea = layoutMarginsGuide
        setupImageView()
        setupNameLabel()
        setupTypeLabel()
        setupDateLabel()
    }
    
    func setupImageView() {
        addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //imageIV.backgroundColor = .red
    }
    
    func setupNameLabel() {
        addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
    }
    
    func setupTypeLabel() {
        addSubview(typeLabel)
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        typeLabel.font = UIFont(name: "Verdana", size: 14)
    }
    
    func setupDateLabel() {
        addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 10).isActive = true
        dateLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor).isActive = true
        
        dateLabel.font = UIFont(name: "Verdana", size: 14)
    }
    
    func formatDate(date: String) -> String {
        let ISOdateFormatter = DateFormatter()
        ISOdateFormatter.locale = Locale(identifier: "en_US_POSIX")
        ISOdateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd.MM.yy"
        
        guard let date = ISOdateFormatter.date(from: date) else {
            return date }
        return dateFormatter.string(from: date)
    }
}
