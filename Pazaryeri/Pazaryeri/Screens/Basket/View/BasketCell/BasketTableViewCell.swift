//
//  BasketTableViewCell.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 7.11.2022.
//

import UIKit

protocol BasketTableViewCellInterface: AnyObject {
	func stepperValueDidChange(_ stepper: UIStepper)
}


class BasketTableViewCell: UITableViewCell {

	static let reuseID = "BasketCell"
	
	@IBOutlet weak var productImageView: UIImageView!
	@IBOutlet weak var productTitle: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var quantityLabel: UILabel!
	@IBOutlet weak var stepper: UIStepper!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	
	@IBAction func stepperValueChanged(_ stepper: UIStepper) {
		
	}
	
}
