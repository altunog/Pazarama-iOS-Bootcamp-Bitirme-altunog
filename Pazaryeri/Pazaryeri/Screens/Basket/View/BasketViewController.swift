//
//  BasketViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 7.11.2022.
//

import UIKit

class BasketViewController: UIViewController {

	private var viewModel = BasketViewModel()
	
	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var checkoutButton: UIButton!
	@IBOutlet weak var cartTotalLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		viewModel.delegate = self
		
		let nib = UINib(nibName: "BasketTableViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: "BasketCell")
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		viewModel.fetchCartContent()
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		cartTotalLabel.text = viewModel.totalCost.currencyString
	}

	@IBAction func checkOutButtonTapped(_ sender: UIButton) {
		self.viewModel.checkout()
		dismiss(animated: true)
	}
}

extension BasketViewController: BasketViewModelDelegate {
	func didCheckoutSuccessful() {
		print("Checkout was successful.")
		self.tabBarController?.selectedIndex = 0
	}
	
	func errorDidOccur(_ error: Error) {
		print(error.localizedDescription)
	}
	
	func didFetchProductsInCart() {
		tableView.reloadData()
	}
	
	func didFetchCostByItemCount() {
		cartTotalLabel.text = viewModel.totalCost.currencyString
	}
	
	func didUpdateCartSuccessful() {
		viewModel.fetchCartContent()
//		cartTotalLabel.text = viewModel.totalCost.currencyString
	}
	
	
}

extension BasketViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

extension BasketViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRows
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as! BasketTableViewCell
		let product = viewModel.productForIndexPath(indexPath)
		
		cell.interface 		= self
		cell.pid			= product._id
		cell.productImageView.downloadImage(from: product._image)
		cell.productName 	= product._title
		cell.price			= product._price
		cell.stepperValue	= viewModel.cart?["\(product._id)"] ?? .zero
		
		return cell
	}

}

extension BasketViewController: BasketTableViewCellInterface {
	func stepperValueDidChange(_ pid: Int, _ stepper: UIStepper) {
		if stepper.value == .zero {
			let indexPath = viewModel.getProductIndexPath(by: pid)
			viewModel.removeProduct(at: indexPath.row)
			self.tableView.deleteRows(at: [indexPath], with: .automatic)
		}
		viewModel.updateCart(withProductId: pid, quantity: Int(stepper.value))
	}
}
