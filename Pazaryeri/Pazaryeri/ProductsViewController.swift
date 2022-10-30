//
//  ProductsViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 27.10.2022.
//

import UIKit

class ProductsViewController: UIViewController {

	private var scrollView: UIScrollView!
	private var stackView: UIStackView!
	
	private var mensClothingSectionView: PYSectionView!
	private var womensClothingSectionView: PYSectionView!
	private var electronicsSectionView: PYSectionView!
	private var jewelerySectionView: PYSectionView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		configureViewController()
		configureScrollView()
		configureStackView()
		
		configureMensClothingSectionView()
		configureWomensClothingSectionView()
		configureElectronicsSectionView()
		configureJewelerySectionView()
    }
	
	private func configureViewController() {
		title = "Products"
		view.backgroundColor = .white
	}

}

// MARK: SECTION VIEWS
extension ProductsViewController {
	private func configureMensClothingSectionView() {
		mensClothingSectionView = PYSectionView(containerStackView: stackView, title: "Men's Clothing")
		mensClothingSectionView.collectionView.delegate = self
		mensClothingSectionView.collectionView.dataSource = self
	}
	
	private func configureWomensClothingSectionView() {
		womensClothingSectionView = PYSectionView(containerStackView: stackView, title: "Women's Clothing")
		womensClothingSectionView.collectionView.delegate = self
		womensClothingSectionView.collectionView.dataSource = self
	}
	
	private func configureElectronicsSectionView() {
		electronicsSectionView = PYSectionView(containerStackView: stackView, title: "Electronics")
		electronicsSectionView.collectionView.delegate = self
		electronicsSectionView.collectionView.dataSource = self
	}
	
	private func configureJewelerySectionView() {
		jewelerySectionView = PYSectionView(containerStackView: stackView, title: "Jewelery")
		jewelerySectionView.collectionView.delegate = self
		jewelerySectionView.collectionView.dataSource = self
	}
}

// MARK: configureScrollView, configureStackView
extension ProductsViewController {
	private func configureScrollView() {
		scrollView = UIScrollView(frame: .zero)
		view.addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.showsVerticalScrollIndicator = false
		scrollView.pinToEdges(of: view)
	}
	
	private func configureStackView() {
		stackView = UIStackView()
		scrollView.addSubview(stackView)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.isLayoutMarginsRelativeArrangement = true
		
		let padding: CGFloat = 10
		stackView.layoutMargins = UIEdgeInsets(top: 2*padding, left: padding, bottom: 2*padding, right: padding)
		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		stackView.spacing = 4*padding
		
		stackView.pinToEdges(of: scrollView)
		stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
	}
}

extension ProductsViewController: UICollectionViewDelegate {

}

extension ProductsViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseID, for: indexPath) as! ProductCell

		return cell
	}
}
