//
//  AppDelegate.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 25.10.2022.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		setupWindow()
		
		FirebaseApp.configure()
		
		return true
	}

	private func setupWindow() {
		// Override point for customization after application launch.
		let window = UIWindow(frame: UIScreen.main.bounds)
//		let tabBar = PYMainTabBarController()
		let authVC = UINavigationController(rootViewController: SignInViewController())
		window.rootViewController = authVC
		window.makeKeyAndVisible()
		self.window = window
	}
}

