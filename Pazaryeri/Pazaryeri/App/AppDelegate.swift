//
//  AppDelegate.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 25.10.2022.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		FirebaseApp.configure()
		let _ = Firestore.firestore()
		
		setupWindow()
		
		return true
	}

	private func setupWindow() {
		// Override point for customization after application launch.
		let window = UIWindow(frame: UIScreen.main.bounds)
//		let tabBar = PYMainTabBarController()
		let authVC = UINavigationController(rootViewController: SignInViewController())
		authVC.navigationBar.tintColor = .black
		let onboard = UINavigationController(rootViewController: OnboardingViewController())
		window.rootViewController = onboard
		window.makeKeyAndVisible()
		self.window = window
	}
}

