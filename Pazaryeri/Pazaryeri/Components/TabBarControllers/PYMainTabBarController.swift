//
//  PYMainTabBarController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 27.10.2022.
//

import UIKit

final class PYMainTabBarController: UITabBarController {

//	var cartButton: PYCartButton!
//	var cartBarButton: UIBarButtonItem!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupTabBar()
		configureTabBar()
    }
	
	private func setupTabBar() {
		let vcs = [createProductsNC(), createSearchNC(), createProfileNC()]
		setViewControllers(vcs, animated: true)
	}
	
	private func configureTabBar() {
		tabBar.itemPositioning = .centered
		tabBar.tintColor = Colors.primary
	}
	
	private func createProductsNC() -> UINavigationController {
		let viewModel = ProductsViewModel()
		let productsVC = ProductsViewController(viewModel: viewModel)
		productsVC.title = "Products"
		productsVC.tabBarItem = UITabBarItem(title: nil,
											 image: Symbols.house,
											 selectedImage: Symbols.houseFill)
		productsVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
		return UINavigationController(rootViewController: productsVC)
	}
	
	private func createSearchNC() -> UINavigationController {
		let searchVC = SearchViewController()
		searchVC.title = "Search"
		searchVC.tabBarItem = UITabBarItem(title: nil,
											 image: Symbols.search,
											 selectedImage: Symbols.searchFill)
		searchVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
		return UINavigationController(rootViewController: searchVC)
	}
	
	private func createProfileNC() -> UINavigationController {
		let profileVC = ProfileViewController()
		profileVC.title = "Profile"
		profileVC.tabBarItem = UITabBarItem(title: nil,
											image: Symbols.person,
											selectedImage: Symbols.personFill)
		profileVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
		return UINavigationController(rootViewController: profileVC)
	}
    
}
