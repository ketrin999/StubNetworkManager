//
//  MainTableViewCell.swift
//  StubDemo
//
//  Created by Kate  on 25.08.2024.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    let label: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.font = UIFont(name: "Futura-Bold", size: 24)
        label.textColor = .systemGray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
