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
		flowLayout.minimumLineSpacing = 15
		
		let width = UIScreen.main.bounds.width
		let itemWidth = width / 2.5 - 15
		
		flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 90)
		flowLayout.scrollDirection = .horizontal
	
		return flowLayout
	}
	
}
