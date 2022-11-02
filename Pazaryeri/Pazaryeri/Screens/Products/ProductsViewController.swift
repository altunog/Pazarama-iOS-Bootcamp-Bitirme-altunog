//
//  ProductsViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 27.10.2022.
//

import UIKit

class ProductsViewController: UIViewController {

	private let viewModel: ProductsViewModel
	var price: Double = 30
	
	private var scrollView: UIScrollView!
	private var stackView: UIStackView!
	private var cartButton: PYCartButton!
	private var cartBarButton: UIBarButtonItem!
	private var cartButtonWidthConstraint: NSLayoutConstraint?

	private var mensClothingSectionView: PYSectionView!
	private var womensClothingSectionView: PYSectionView!
	private var electronicsSectionView: PYSectionView!
	private var jewelerySectionView: PYSectionView!
	
	init(viewModel: ProductsViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		viewModel.delegate = self
		viewModel.fetchProducts()
		
		configureCartButton()
		configureViewController()
		configureScrollView()
		configureStackView()
		
		configureMensClothingSectionView()
		configureWomensClothingSectionView()
		configureElectronicsSectionView()
		configureJewelerySectionView()
    }
	
	func configureCartButton() {
		cartButton = PYCartButton(color: Colors.primary,
								  image: Images.cart,
								  title: price.currencyString)

		cartButton.updateInsets(considering: price)
		cartButton.addTarget(self, action: #selector(updateCartCost), for: .touchUpInside)
		
		cartBarButton = UIBarButtonItem(customView: cartButton)

		if price == .zero {
			cartButtonWidthConstraint = cartButton.collapse()
		} else {
			cartButtonWidthConstraint = cartButton.expand(considering: price)
		}
		cartButtonWidthConstraint?.isActive = true
		
		navigationItem.rightBarButtonItem = cartBarButton
	}
	
	@objc private func updateCartCost() {
		price -= 10
		cartButtonWidthConstraint?.isActive = false
		if price == .zero {
			cartButtonWidthConstraint = cartButton.collapse()
		} else {
			cartButtonWidthConstraint = cartButton.expand(considering: price)
		}
		cartButtonWidthConstraint?.isActive = true

		self.cartButton.title = self.price.currencyString

	}
	
	private func configureViewController() {
		title = "Products"
		view.backgroundColor = .white
	}

}

// MARK: ProductsViewModelDelegate
extension ProductsViewController: ProductsViewModelDelegate {
	func didOccurError(_ error: Error) {
		print(error.localizedDescription)
	}
	
	func didFetchProducts() {
		print("Products fetched")
	}
	
	
}

// MARK: CONFIGURE SCROLL VIEW and STACK VIEW
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

// MARK: CONFIGURE SECTION VIEWS
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

// MARK: UICollectionViewDelegate
extension ProductsViewController: UICollectionViewDelegate {

}

// MARK: UICollectionViewDataSource
extension ProductsViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseID, for: indexPath) as! ProductCell

		return cell
	}
}
