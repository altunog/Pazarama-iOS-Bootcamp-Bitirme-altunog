//
//  PYMainTabBarController.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 27.10.2022.
//

import UIKit

final class PYMainTabBarController: UITabBarController {

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
		tabBar.tintColor = UIColor(named: "AccentColor")
		tabBar.backgroundColor = .white
	}
	
	private func createProductsNC() -> UINavigationController {
		let productsNC = UINavigationController(rootViewController: ProductsViewController())
		productsNC.tabBarItem = UITabBarItem(title: "Products",
											 image: ImageHelper.product,
											 selectedImage: ImageHelper.productFill)
		return productsNC
	}
	
	private func createSearchNC() -> UINavigationController {
		let searchNC = UINavigationController(rootViewController: SearchViewController())
		searchNC.tabBarItem = UITabBarItem(title: "Search",
											 image: ImageHelper.search,
											 selectedImage: ImageHelper.searchFill)
		return searchNC
	}
	
	private func createProfileNC() -> UINavigationController {
		let profileNC = UINavigationController(rootViewController: ProfileViewController())
		profileNC.tabBarItem = UITabBarItem(title: "Profile",
											image: ImageHelper.person,
											selectedImage: ImageHelper.personFill)
		return profileNC
	}
    
}
