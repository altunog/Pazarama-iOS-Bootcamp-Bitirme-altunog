//
//  ProductCell.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 28.10.2022.
//

import UIKit

class ProductCell: UICollectionViewCell {
	
	static let reuseID = "ProductCell"
	private let productLabel = PYSecondaryTitleLabel(textAlignment: .left, fontSize: 14)
	private let productImageView = PYProductImageView(frame: .zero)
	private let addToCartButton = PYButton(kind: .tinted, color: Colors.primary, title: "SEPETE EKLE")
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		contentView.addSubview(productLabel)
		contentView.addSubview(productImageView)
		contentView.addSubview(addToCartButton)

		let padding: CGFloat = 4
		productLabel.text = "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops Backpack"
		NSLayoutConstraint.activate([
			productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
			productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor),
			
			productLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 3*padding),
			productLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2*padding),
			productLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2*padding),
			
			addToCartButton.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 5*padding),
			addToCartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1*padding),
			addToCartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1*padding),
			addToCartButton.heightAnchor.constraint(equalToConstant: 44)
		])
	}
}
