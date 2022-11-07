//
//  AppDelegate.swift
//  Pazaryeri
//
//  Created by Oğuz Kaan Altun on 25.10.2022.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		FirebaseApp.configure()
		_ = Firestore.firestore()
		
		_ = Auth.auth().addStateDidChangeListener { auth, user in
			
			if user != nil {
				self.setupHomeWindow()
			} else {
				self.setupAuthWindow()
			}
		}
		
		
		
		return true
	}
	
	private func setupHomeWindow() {
		let window = UIWindow(frame: UIScreen.main.bounds)
		let tabBar = PYMainTabBarController()
		window.rootViewController = tabBar
		window.makeKeyAndVisible()
		self.window = window
	}

	private func setupAuthWindow() {
		let window = UIWindow(frame: UIScreen.main.bounds)
		
		if UserDefaults.standard.bool(forKey: "notFirstTime") {
			UserDefaults.standard.set(true, forKey: "notFirstTime")
			let onboard = UINavigationController(rootViewController: OnboardingViewController())
			window.rootViewController = onboard
		} else {
			let authVC = UINavigationController(rootViewController: SignInViewController())
			authVC.navigationBar.tintColor = .black
			window.rootViewController = authVC
		}
		window.makeKeyAndVisible()
		self.window = window
	}
}

