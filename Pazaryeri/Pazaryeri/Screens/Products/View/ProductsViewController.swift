//
//  ProductsViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 27.10.2022.
//

import UIKit
import PazaryeriAPI

final class ProductsViewController: UIViewController {

	// MARK: Properties
	private let viewModel: ProductsViewModel
	private let productsView = ProductsView()
	
	// MARK: Init
	init(viewModel: ProductsViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Life cycle
	override func viewDidLoad() {
        super.viewDidLoad()
		configureViewController()
		setupDelegates()
		viewModel.fetchProducts()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		viewModel.fetchCartContent()
	}
	
	// MARK: Configurations
	private func configureViewController() {
		view 	= productsView
		title 	= "Products"
		view.backgroundColor = .white
		navigationItem.rightBarButtonItem = productsView.cartBarButton
	}
	
	private func setupDelegates() {
		productsView.interface	= self
		viewModel.delegate		= self
		productsView.mensClothingSectionView.collectionView.delegate 		= self
		productsView.mensClothingSectionView.collectionView.dataSource 		= self
		productsView.womensClothingSectionView.collectionView.delegate 		= self
		productsView.womensClothingSectionView.collectionView.dataSource 	= self
		productsView.electronicsSectionView.collectionView.delegate 		= self
		productsView.electronicsSectionView.collectionView.dataSource 		= self
		productsView.jewelerySectionView.collectionView.delegate 			= self
		productsView.jewelerySectionView.collectionView.dataSource 			= self
	}
	
	func updateBarButton() {
		productsView.cartButtonWidthConstraint?.isActive = false

		if viewModel.cartCost == .zero {
			productsView.cartButtonWidthConstraint = productsView.cartButton.collapse(to: 25)
		} else {
			productsView.cartButtonWidthConstraint = productsView.cartButton.expand(considering: viewModel.cartCost)
			productsView.cartButton.setTitle(viewModel.cartCost.currencyString, for: .normal)
		}
		
		productsView.cartButtonWidthConstraint?.isActive = true
	}
	
}

// MARK: ProductsViewInterface
extension ProductsViewController: ProductsViewInterface {
	func productsView(_ view: ProductsView, didTapCartButton: PYCartButton) {
		print("Cart tapped")
		let basketVC = BasketViewController()
		present(basketVC, animated: true)
	}
}

// MARK: ProductsViewModelDelegate
extension ProductsViewController: ProductsViewModelDelegate {
	func didFetchCartCost() {
		updateBarButton()
	}
	
	func errorDidOccur(_ error: Error) {
		print(error.localizedDescription)
	}
	
	func didFetchProducts() {
		productsView.mensClothingSectionView.collectionView.reloadData()
		productsView.womensClothingSectionView.collectionView.reloadData()
		productsView.electronicsSectionView.collectionView.reloadData()
		productsView.jewelerySectionView.collectionView.reloadData()
	}
	
	func didFetchSingleProduct(_ product: Product) {
		let detailVC = ProductDetailViewController(product: product)
		navigationController?.pushViewController(detailVC, animated: true)
	}
}

// MARK: UICollectionViewDelegate
extension ProductsViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(indexPath)
		
		switch collectionView {
		
		case productsView.mensClothingSectionView.collectionView:
			if let productId = viewModel.getProduct(for: productsView.mensClothingSectionView, at: indexPath)?._id {
				viewModel.fetchSingleProduct(withId: productId)
			}
		case productsView.womensClothingSectionView.collectionView:
			if let productId = viewModel.getProduct(for: productsView.womensClothingSectionView, at: indexPath)?._id {
				viewModel.fetchSingleProduct(withId: productId)
			}
		case productsView.electronicsSectionView.collectionView:
			if let productId = viewModel.getProduct(for: productsView.electronicsSectionView, at: indexPath)?._id {
				viewModel.fetchSingleProduct(withId: productId)
			}
			
		case productsView.jewelerySectionView.collectionView:
			if let productId = viewModel.getProduct(for: productsView.jewelerySectionView, at: indexPath)?._id {
				viewModel.fetchSingleProduct(withId: productId)
			}
		default:
			print("Out of index")
		}
	}
}

// MARK: UICollectionViewDataSource
extension ProductsViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		switch collectionView {
		
		case productsView.mensClothingSectionView.collectionView:
			return viewModel.getNumberOfProducts(for: productsView.mensClothingSectionView)
		
		case productsView.womensClothingSectionView.collectionView:
			return viewModel.getNumberOfProducts(for: productsView.womensClothingSectionView)
		
		case productsView.electronicsSectionView.collectionView:
			return viewModel.getNumberOfProducts(for: productsView.electronicsSectionView)
		
		case productsView.jewelerySectionView.collectionView:
			return viewModel.getNumberOfProducts(for: productsView.jewelerySectionView)
		
		default:
			return .zero
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseID, for: indexPath) as! ProductCell
		
		switch collectionView {

		case productsView.mensClothingSectionView.collectionView:
			if let product = viewModel.getProduct(for: productsView.mensClothingSectionView, at: indexPath) {
				cell.set(product: product)
			}
			return cell
			
		case productsView.womensClothingSectionView.collectionView:
			if let product = viewModel.getProduct(for: productsView.womensClothingSectionView, at: indexPath) {
				cell.set(product: product)
			}
			return cell
			
		case productsView.electronicsSectionView.collectionView:
			if let product = viewModel.getProduct(for: productsView.electronicsSectionView, at: indexPath) {
				cell.set(product: product)
			}
			return cell
			
		case productsView.jewelerySectionView.collectionView:
			if let product = viewModel.getProduct(for: productsView.jewelerySectionView, at: indexPath) {
				cell.set(product: product)
			}
			return cell
			
		default:
			return cell
		}
	}
}
