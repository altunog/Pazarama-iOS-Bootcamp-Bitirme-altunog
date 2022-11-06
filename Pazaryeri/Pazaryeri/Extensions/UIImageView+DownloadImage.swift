//
//  UIImageView+DownloadImage.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 6.11.2022.
//

import UIKit

extension UIImageView {
	
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
