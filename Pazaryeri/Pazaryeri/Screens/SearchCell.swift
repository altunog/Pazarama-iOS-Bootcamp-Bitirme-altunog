//
//  SearchCell.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 7.11.2022.
//

import UIKit
import PazaryeriAPI

final class SearchCell: UICollectionViewCell {
	static let identifier = "SearchCell"
	
	var product: Product?
	
	private lazy var gradientLayer: CAGradientLayer = {
		let layer = CAGradientLayer()
		layer.startPoint = CGPoint(x: 0.5, y: 0.0)
		layer.endPoint = CGPoint(x: 0.5, y: 1.0)
		layer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
		layer.locations = [0.0, 1.0]
		return layer
	}()
	
	private(set) lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.layer.cornerRadius = 8.0
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.clipsToBounds = true
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 11.0)
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = .zero
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
//		imageView.frame = CGRect(x: 0,
//								 y: 0,
//								 width: contentView.frame.size.width,
//								 height: contentView.frame.size.height)
		gradientLayer.frame = bounds
	}

	private func configure() {
		addSubview(imageView)
		NSLayoutConstraint.activate([
			imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			imageView.topAnchor.constraint(equalTo: self.topAnchor),
			imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
		
		imageView.addSubview(titleLabel)
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16.0),
			titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16.0),
			titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8.0)
		])
		
		imageView.layer.insertSublayer(gradientLayer, at: .zero)
		
	}
	
}

