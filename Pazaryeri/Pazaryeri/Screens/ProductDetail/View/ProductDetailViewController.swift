//
//  ProductDetailViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 6.11.2022.
//

import UIKit
import PazaryeriAPI

class ProductDetailViewController: UIViewController {

	// MARK: Properties
	let viewModel = ProductDetailViewModel()
	var product: Product
	
	// MARK: UI Elements
	var cartButton: PYCartButton!
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var productTitle: UILabel!
	@IBOutlet weak var ratingStackView: UIStackView!
	@IBOutlet weak var categoryStackView: UIStackView!
	@IBOutlet weak var DescriptionStackView: UIStackView!
	
	@IBOutlet weak var ratingLabel: UILabel!
	@IBOutlet weak var ratingCount: UILabel!
	@IBOutlet weak var categoryLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var addCartButton: UIButton!

	@IBOutlet weak var stepper: UIStepper!
	@IBOutlet weak var stepperLabel: UILabel!
	@IBOutlet weak var bottomView: UIView!
	
	// MARK: Init
	init(product: Product) {
		self.product = product
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Lifecycle
	override func viewDidLoad() {
        super.viewDidLoad()
		
		configureViewController()
		configureLabels()
		configureUI()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		viewModel.fetchCartCost()
	}
	
	// MARK: Configurations
	private func configureViewController() {
		viewModel.delegate = self
		title = "Product Detail"
		tabBarController?.tabBar.isHidden = true
	}
	
	private func configureLabels() {
		imageView.downloadImage(from: product._image)
		productTitle.text 		= product._title
		ratingLabel.text 		= "\(product._rate)"
		ratingCount.text 		= "\(product._rateCount) ratings"
		categoryLabel.text 		= product._category
		descriptionLabel.text	= product._desc
		priceLabel.text			= product._price.currencyString
	}
	
	private func configureUI() {
		ratingStackView.layer.cornerRadius 		= 10
		categoryStackView.layer.cornerRadius 	= 10
		addCartButton.layer.cornerRadius 		= 10
		stepper.layer.cornerRadius				= 10
		stepper.layer.borderColor				= Colors.primary?.cgColor
		stepper.layer.borderWidth				= 1
		bottomView.layer.cornerRadius			= 10
		bottomView.layer.borderColor			= Colors.primary?.cgColor
		bottomView.layer.borderWidth			= 0.5
	}
	
//	func configureCartButton() {
//		cartButton = PYCartButton(color: Colors.secondary,
//									  image: Images.cart,
//									  title: price.currencyString)
//		cartButton.updateInsets(considering: price)
//		// TODO: Add action to button
////		cartButton.addTarget(self, action: #selector(updateCartCost), for: .touchUpInside)
//
//		cartBarButton = UIBarButtonItem(customView: cartButton)
//
//		if price == .zero {
//			cartButtonWidthConstraint = cartButton.collapse()
//		} else {
//			cartButtonWidthConstraint = cartButton.expand(considering: price)
//		}
//		cartButtonWidthConstraint?.isActive = true
//	}

	func updateStepperLabel() {
		stepperLabel.text = "\(Int(stepper.value))"
	}
	
	func toggleButtons() {
		addCartButton.isHidden 	= !addCartButton.isHidden
		stepper.isHidden 		= !stepper.isHidden
		stepperLabel.isHidden 	= !stepperLabel.isHidden
	}
	
	// MARK: Actions
	@IBAction func addCartButtonTapped(_ button: UIButton) {
		
		// TODO: firebase update user cart
		viewModel.updateCart(withProduct: product, quantity: 1)
		
		// TODO: update cart barbutton
		stepper.value += 1
		updateStepperLabel()
		toggleButtons()
	}
	
	@IBAction func stepperValueChanged(_ stepper: UIStepper) {
		// TODO: firebase update user cart
		updateStepperLabel()
		viewModel.updateCart(withProduct: product, quantity: Int(stepper.value))
		if stepper.value == .zero {
			toggleButtons()
		}
	}
}

extension ProductDetailViewController: ProductDetailViewModelDelegate {
	func didUpdateCartSuccesful() {
		print("Successful updating.")
	}
	
	func didFetchCartCost() {
		print(viewModel.cartCost)
	}
	
	func errorDidOccur(_ error: Error) {
		print(error.localizedDescription)
	}
}