//
//  OnboardingView.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 6.11.2022.
//

import UIKit

class OnboardingView: UIView {

	var image: UIImage? {
		didSet {
			imageView.image = image
		}
	}
	
	var text: String? {
		didSet {
			label.text = text
		}
	}
	
	@IBOutlet private var contentView: UIView!
	@IBOutlet private weak var imageView: UIImageView!
	@IBOutlet private weak var label: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		configure()
	}
	
	private func configure() {
		Bundle.main.loadNibNamed("OnboardingView", owner: self)
		addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
	}
	
}
