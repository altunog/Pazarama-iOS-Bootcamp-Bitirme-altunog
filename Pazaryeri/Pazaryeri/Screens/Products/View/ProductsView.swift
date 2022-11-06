//
//  ProductsView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 5.11.2022.
//

import UIKit

protocol ProductsViewInterface: AnyObject {
	func productsView(_ view: ProductsView, didTapCartButton: PYCartButton)
		
}

class ProductsView: UIView {
	
	weak var interface: ProductsViewInterface?
	
	var scrollView: UIScrollView!
	var stackView: UIStackView!
	var cartButton: PYCartButton!
	var cartBarButton: UIBarButtonItem!
	var cartButtonWidthConstraint: NSLayoutConstraint?
	
	var mensClothingSectionView: PYSectionView!
	var womensClothingSectionView: PYSectionView!
	var electronicsSectionView: PYSectionView!
	var jewelerySectionView: PYSectionView!
	var price = Double()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .white
		configureCartButton()
		configureScrollView()
		configureStackView()
		
		configureMensClothingSectionView()
		configureWomensClothingSectionView()
		configureElectronicsSectionView()
		configureJewelerySectionView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureCartButton() {
		cartButton = PYCartButton(color: Colors.secondary,
									  image: Images.cart,
									  title: price.currencyString)
		cartButton.updateInsets(considering: price)
		// TODO: Add action to button
//		cartButton.addTarget(self, action: #selector(updateCartCost), for: .touchUpInside)
		
		cartBarButton = UIBarButtonItem(customView: cartButton)

		if price == .zero {
			cartButtonWidthConstraint = cartButton.collapse()
		} else {
			cartButtonWidthConstraint = cartButton.expand(considering: price)
		}
		cartButtonWidthConstraint?.isActive = true
	}

}

// MARK: Configure Scroll View and Stack View
extension ProductsView {
	private func configureScrollView() {
		scrollView = UIScrollView(frame: .zero)
		addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.showsVerticalScrollIndicator = false
		scrollView.pinToEdges(of: self)
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

// MARK: Configure Section Views
extension ProductsView {
	private func configureMensClothingSectionView() {
		mensClothingSectionView = PYSectionView(containerStackView: stackView, title: "Men's Clothing")
	}
	
	private func configureWomensClothingSectionView() {
		womensClothingSectionView = PYSectionView(containerStackView: stackView, title: "Women's Clothing")
	}
	
	private func configureElectronicsSectionView() {
		electronicsSectionView = PYSectionView(containerStackView: stackView, title: "Electronics")
	}
	
	private func configureJewelerySectionView() {
		jewelerySectionView = PYSectionView(containerStackView: stackView, title: "Jewelery")
	}
}
