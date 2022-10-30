//
//  UIHelper.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 29.10.2022.
//

import UIKit

enum UIHelper {
	
	static func createFlowLayout() -> UICollectionViewFlowLayout {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.minimumLineSpacing = 20
		let width = UIScreen.main.bounds.width
		let itemWidth = width / 2.5
		
		flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 110)
		flowLayout.scrollDirection = .horizontal
	
		return flowLayout
	}
	
}
