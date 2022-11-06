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
	var product: Product
	
	// MARK: UI Elements
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
		
		configure()
		configureUI()
		tabBarController?.tabBar.isHidden = true
    }
	
	private func configure() {
		imageView.downloadImage(from: product._image)
		productTitle.text 		= product._title
		ratingLabel.text 		= "\(product._rate)"
		ratingCount.text 		= "\(product._rateCount) ratings"
		categoryLabel.text 		= product._category
		descriptionLabel.text	= product._desc
		priceLabel.text			= product._price.currencyString
	}
	
	private func configureUI() {
		ratingStackView.layer.cornerRadius 		= 3
		categoryStackView.layer.cornerRadius 	= 3
		addCartButton.layer.cornerRadius 		= 8
		stepper.layer.cornerRadius				= 10
		stepper.layer.borderColor				= Colors.primary?.cgColor
		stepper.layer.borderWidth				= 1
	}

	func updateStepperLabel() {
		stepperLabel.text = "\(Int(stepper.value))"
	}
	
	func toggleButtons() {
		addCartButton.isHidden 	= !addCartButton.isHidden
		stepper.isHidden 		= !stepper.isHidden
		stepperLabel.isHidden 	= !stepperLabel.isHidden
	}
	
	@IBAction func addCartButtonTapped(_ button: UIButton) {
		
		// TODO: firebase update user cart
		
		// TODO: update cart barbutton
		
		stepper.value += 1
		updateStepperLabel()
		toggleButtons()
	}
	
	@IBAction func stepperValueChanged(_ stepper: UIStepper) {
		// TODO: firebase update user cart
		updateStepperLabel()
		if stepper.value == .zero {
			toggleButtons()
		}
	}
}
