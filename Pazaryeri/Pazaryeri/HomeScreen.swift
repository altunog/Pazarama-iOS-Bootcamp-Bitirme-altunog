//
//  HomeScreen.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 27.10.2022.
//

import UIKit

final class HomeScreen: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		setupHomeScreen()
    }
	
	private func setupHomeScreen() {
		let vcs = setupViewControllers()
		setViewControllers(vcs, animated: true)
		tabBar.itemPositioning = .centered
		tabBar.tintColor = UIColor(named: "AccentColor")
		tabBar.backgroundColor = .gray.withAlphaComponent(0.5)
	}
    
	private func setupViewControllers() -> [UINavigationController] {
		let productsVC = UINavigationController(rootViewController: ProductsViewController())
		let searchVC = UINavigationController(rootViewController: SearchViewController())
		let profileVC = UINavigationController(rootViewController: ProfileViewController())
		
		productsVC.tabBarItem = UITabBarItem(title: "Products",
											 image: ImageHelper.product,
											 selectedImage: ImageHelper.productFill)
		
		searchVC.tabBarItem = UITabBarItem(title: "Search",
											 image: ImageHelper.search,
											 selectedImage: ImageHelper.searchFill)
		
		profileVC.tabBarItem = UITabBarItem(title: "Profile",
											image: ImageHelper.person,
											selectedImage: ImageHelper.personFill)
		
		return [productsVC, searchVC, profileVC]
	}


}
