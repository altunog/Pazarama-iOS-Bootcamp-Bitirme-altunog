//
//  AppDelegate.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 25.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		setupWindow()
		return true
	}

	private func setupWindow() {
		// Override point for customization after application launch.
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = PYMainTabBarController()
		window.makeKeyAndVisible()
		self.window = window
	}
}

