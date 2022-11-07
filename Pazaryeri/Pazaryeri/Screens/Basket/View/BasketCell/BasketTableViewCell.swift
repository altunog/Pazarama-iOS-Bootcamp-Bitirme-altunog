//
//  BasketTableViewCell.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 7.11.2022.
//

import UIKit

protocol BasketTableViewCellInterface: AnyObject {
	func stepperValueDidChange(_ pid: Int, _ stepper: UIStepper)
}


class BasketTableViewCell: UITableViewCell {

	static let reuseID = "BasketCell"
	
	weak var interface: BasketTableViewCellInterface?
	
	var pid: Int?
	
	var image: UIImage? {
		didSet {
			productImageView.image = image
		}
	}
	
	var productName: String? {
		didSet {
			productTitle.text = productName
		}
	}
	
	var price: Double? {
		didSet {
			priceLabel.text = price?.currencyString
		}
	}
	
	var stepperValue: Int? {
		didSet {
			quantityLabel.text 	= "\(stepperValue ?? .zero)"
			stepper.value		= Double(stepperValue ?? .zero)
			print(stepper.value)
		}
	}
	
	@IBOutlet private(set) weak var productImageView: UIImageView!
	@IBOutlet private weak var productTitle: UILabel!
	@IBOutlet private weak var priceLabel: UILabel!
	@IBOutlet private weak var quantityLabel: UILabel!
	@IBOutlet private weak var stepper: UIStepper!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
	func updateStepperLabel() {
		quantityLabel.text = "\(Int(stepper.value))"
	}
	
	@IBAction func stepperValueChanged(_ stepper: UIStepper) {
		if let pid {
			updateStepperLabel()
			interface?.stepperValueDidChange(pid, stepper)
		}
	}
	
}
