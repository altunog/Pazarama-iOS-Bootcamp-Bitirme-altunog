//
//  ProductCell.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 28.10.2022.
//

import UIKit
import PazaryeriAPI

final class ProductCell: UICollectionViewCell {
	// MARK: Cell ID
	static let reuseID = "ProductCell"
	
	// MARK: UI Elements
	let nameLabel = PYSecondaryTitleLabel(textAlignment: .left, fontSize: 14)
	let productImageView = PYProductImageView(frame: .zero)
	let priceLabel = PYTitleLabel(textAlignment: .left, fontSize: 18)
	
	// MARK: Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: Configuration Methods
	private func configure() {
		contentView.addSubview(nameLabel)
		contentView.addSubview(productImageView)
		contentView.addSubview(priceLabel)

		let padding: CGFloat = 4
		
		priceLabel.textColor = Colors.secondary
		NSLayoutConstraint.activate([
			productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
			productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor),
			
			priceLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 2*padding),
			priceLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
			
			nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 2*padding),
			nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2*padding),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2*padding)
		])
	}
	
	func set(product: Product) {
		nameLabel.text = product.title
		priceLabel.text = product.price?.currencyString
		
		guard let imageUrlString = product.image else { return }
		productImageView.downloadImage(from: imageUrlString)
	}
}
