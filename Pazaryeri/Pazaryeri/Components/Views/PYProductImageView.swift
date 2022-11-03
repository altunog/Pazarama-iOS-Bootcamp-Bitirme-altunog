//
//  PYProductImageView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 29.10.2022.
//

import UIKit

class PYProductImageView: UIImageView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		layer.cornerRadius = 8
		layer.borderColor = UIColor.lightGray.cgColor
		layer.borderWidth = 0.5
		contentMode = .scaleToFill
		clipsToBounds = true
		image = Images.placeholder
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	func downloadImage(from urlString: String) {
		guard let url = URL(string: urlString) else { return }
		
		let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
			guard let self else { return }
			guard let data else { return }
			
			guard let image = UIImage(data: data) else { return }
			DispatchQueue.main.async {
				self.image = image
			}
		}
		task.resume()
	}
}
