//
//  OnboardingViewController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 6.11.2022.
//

import UIKit

class OnboardingViewController: UIViewController {

	private let pageWidth: CGFloat = UIScreen.main.bounds.width
	
	@IBOutlet weak var skipButton: UIButton!
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var contentView: UIView!
	@IBOutlet weak var prevButton: UIButton!
	@IBOutlet weak var nextButton: UIButton!
	@IBOutlet weak var pageControl: UIPageControl!
	@IBOutlet weak var letsStartButton: UIButton!
	
	var currentPageNumber: Int = .zero {
		didSet {
			if currentPageNumber == onboardingViews.count - 1 {
				nextButton.isHidden 		= true
				prevButton.isHidden 		= true
				pageControl.isHidden 		= true
				skipButton.isHidden			= true
				letsStartButton.isHidden 	= false
			} else {
				nextButton.isHidden 		= false
				prevButton.isHidden 		= false
				pageControl.isHidden 		= false
				skipButton.isHidden			= false
				letsStartButton.isHidden 	= true
			}
			
			if currentPageNumber == .zero || currentPageNumber == onboardingViews.count - 1 {
				prevButton.isHidden = true
			} else {
				prevButton.isHidden = false
			}
			
			pageControl.currentPage = currentPageNumber
			updateScrollViewContentOffset(with: currentPageNumber)
		}
	}
	
	var onboardingViews = [OnboardingView]() {
		didSet {
			let numberOfPages = onboardingViews.count

			scrollView.contentSize.width = CGFloat(numberOfPages) * pageWidth
			
			pageControl.numberOfPages = numberOfPages
			
			guard let onboardingView = onboardingViews.last else {
				fatalError("OnboardingView not found.")
			}
			contentView.addSubview(onboardingView)
			onboardingView.translatesAutoresizingMaskIntoConstraints = false
			
			if numberOfPages == 1 {
				NSLayoutConstraint.activate([
					onboardingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
					onboardingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
					onboardingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
					onboardingView.widthAnchor.constraint(equalToConstant: pageWidth)
				])
			} else if numberOfPages == 2{
				NSLayoutConstraint.activate([
					onboardingView.leadingAnchor.constraint(equalTo: onboardingViews[0].trailingAnchor),
					onboardingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
					onboardingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
					onboardingView.widthAnchor.constraint(equalToConstant: pageWidth)
				])
			} else {
				NSLayoutConstraint.activate([
					onboardingView.leadingAnchor.constraint(equalTo: onboardingViews[1].trailingAnchor),
					onboardingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
					onboardingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
					onboardingView.widthAnchor.constraint(equalToConstant: pageWidth),
					onboardingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
				])
			}
			
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.setNavigationBarHidden(true, animated: false)
		
		scrollView.delegate = self
		
		let firstPage = OnboardingView()
		firstPage.image = Images.art1
		firstPage.text = "Purchase online"
		onboardingViews.append(firstPage)
		
		let secondPage = OnboardingView()
		secondPage.image = Images.art2
		secondPage.text = "Easy payment"
		onboardingViews.append(secondPage)
		
		let thirdPage = OnboardingView()
		thirdPage.image = Images.art3
		thirdPage.text = "Express delivery"
		onboardingViews.append(thirdPage)
	}

	@IBAction func nextButtonTapped(_ sender: UIButton) {
		print("next")
		if currentPageNumber < onboardingViews.count - 1 {
			currentPageNumber += 1
		}
	}
	
	@IBAction func prevButtonTapped(_ sender: UIButton) {
		print("prev")
		if currentPageNumber > 0 {
			currentPageNumber -= 1
		}
	}
	
	@IBAction func skipButtonTapped(_ sender: UIButton) {
		print("skip")
		goToAuth()
	}
	
	@IBAction func letsStartButtonTapped(_ sender: UIButton) {
		goToAuth()
	}
	
	private func updateScrollViewContentOffset(with pageNumber: Int) {
		let contentOffset = CGPoint(x: pageWidth * CGFloat(pageNumber), y: .zero)
		scrollView.setContentOffset(contentOffset, animated: true)
	}
	
	private func goToAuth() {
		navigationController?.pushViewController(SignInViewController(), animated: true)
	}
}

// MARK: UIScrollViewDelegate
extension OnboardingViewController: UIScrollViewDelegate {
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		let currentPage = Int(scrollView.contentOffset.x / pageWidth)
		currentPageNumber = currentPage
	}
}
