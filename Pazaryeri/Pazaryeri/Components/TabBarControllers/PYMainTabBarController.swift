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
		let productsVC = ProductsViewController()
		productsVC.title = "Products"
		productsVC.tabBarItem = UITabBarItem(title: "Products",
											 image: Symbols.house,
											 selectedImage: Symbols.houseFill)
		return UINavigationController(rootViewController: productsVC)
	}
	
	private func createSearchNC() -> UINavigationController {
		let searchVC = SearchViewController()
		searchVC.tabBarItem = UITabBarItem(title: "Search",
											 image: Symbols.search,
											 selectedImage: Symbols.searchFill)
		return UINavigationController(rootViewController: searchVC)
	}
	
	private func createProfileNC() -> UINavigationController {
		let profileVC = ProfileViewController()
		profileVC.tabBarItem = UITabBarItem(title: "Profile",
											image: Symbols.person,
											selectedImage: Symbols.personFill)
		return UINavigationController(rootViewController: profileVC)
	}
    
}
