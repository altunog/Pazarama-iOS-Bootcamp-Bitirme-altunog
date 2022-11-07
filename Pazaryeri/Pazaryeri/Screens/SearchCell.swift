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
	
	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = Images.placeholder
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
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
		imageView.frame = CGRect(x: 0,
								 y: 0,
								 width: contentView.frame.size.width,
								 height: contentView.frame.size.height)
	}

	private func configure() {
		contentView.addSubview(imageView)
	}
	
}

