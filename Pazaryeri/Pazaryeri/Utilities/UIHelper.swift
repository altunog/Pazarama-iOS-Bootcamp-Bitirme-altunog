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
	
	static func createTwoColumnFlowLayout() -> UICollectionViewFlowLayout {

		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.scrollDirection = .vertical
		
		flowLayout.minimumLineSpacing = 4
		flowLayout.minimumInteritemSpacing = 0
		
		let width = UIScreen.main.bounds.width
		
		flowLayout.itemSize = CGSize(
			width: (width / 2) - 2,
			height: (width / 2) - 2
		)
		return flowLayout
	}

}
