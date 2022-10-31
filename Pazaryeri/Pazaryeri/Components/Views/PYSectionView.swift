//
//  PYSectionView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 29.10.2022.
//

import UIKit

class PYSectionView: UIStackView {

	private var containerStackView: UIStackView!
	private var titleLabel: PYTitleLabel!
	var collectionView: UICollectionView!
	private var title: String!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience init(containerStackView: UIStackView, title: String) {
		self.init(frame: .zero)
		self.containerStackView = containerStackView
		self.title = title
		
		configureSectionView()
		configureTitle()
		configureCollectionView()
	}
	
	private func configureSectionView() {
		// add the section to container stack view
		containerStackView.addArrangedSubview(self)
		
		translatesAutoresizingMaskIntoConstraints = false
//		backgroundColor = .blue
		axis = .vertical
		distribution = .fill
		spacing = 5
	}
	
	private func configureTitle() {
		titleLabel = PYTitleLabel(textAlignment: .left, fontSize: 22)
		addArrangedSubview(titleLabel)
		titleLabel.text = title
	}
	
	private func configureCollectionView() {
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createFlowLayout())
		addArrangedSubview(collectionView)
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = .white
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseID)
		
		collectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
	}
}
