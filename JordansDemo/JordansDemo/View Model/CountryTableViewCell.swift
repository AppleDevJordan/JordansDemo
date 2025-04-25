//
//  CountriesViewController.swift
//  JordansDemo
//
//  Created by Jordan McKnight on 4/25/25.
//


import UIKit

class CountryTableViewCell: UITableViewCell {
    private let nameAndRegionLabel = UILabel()
    private let codeLabel = UILabel()
    private let capitalLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        // Configure labels
        nameAndRegionLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        codeLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        capitalLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)

        nameAndRegionLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false

        // Add labels to the content view
        contentView.addSubview(nameAndRegionLabel)
        contentView.addSubview(codeLabel)
        contentView.addSubview(capitalLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Name and region label at the top-left
            nameAndRegionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameAndRegionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            // Code label aligned to the top-right
            codeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            codeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            // Capital label below name and region
            capitalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            capitalLabel.topAnchor.constraint(equalTo: nameAndRegionLabel.bottomAnchor, constant: 4),
            capitalLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            capitalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    func configure(with viewModel: CountryViewModel) {
        nameAndRegionLabel.text = viewModel.nameAndRegion
        codeLabel.text = viewModel.code
        capitalLabel.text = viewModel.capital
    }
}
