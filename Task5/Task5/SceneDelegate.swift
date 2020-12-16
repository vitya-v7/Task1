//
//  SceneDelegate.swift
//  Task5
//
//  Created by Admin on 17.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
//test
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?

	static var coordinatingController = CoordinatingController()
	static var flowController = FlowController(coordinatingController: SceneDelegate.coordinatingController)
	let nc: UINavigationController = {
		UINavigationController(rootViewController: SceneDelegate.flowController.firstVC!.vc)
	}()

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		if UserDefaults.standard.value(forKey: "firstApplicationStart") == nil {
			loadDefaultCars()
			UserDefaults.standard.set(true, forKey: "firstApplicationStart")
		}
		self.window = UIWindow(windowScene: windowScene)
		self.window?.rootViewController = nc
		self.window?.makeKeyAndVisible()
	}
	
	func loadDefaultCars() {
		
		let carsService = CarService.init()
		var car = CarModel.init(model: CarModels.allCases[0], manufacturer: CarCountry.allCases[1], yearOfIssue: 2001, body: CarBodyStyle.allCases[3], carNumber: "123fads", carKey: UUID().uuidString)
		
		carsService.addCar(car: car)
		
		car = CarModel.init(model: CarModels.allCases[1], manufacturer: CarCountry.allCases[2], yearOfIssue: 2000, body: CarBodyStyle.allCases[1], carNumber: "ds fd1", carKey: UUID().uuidString)
		
		carsService.addCar(car: car)
		
		car = CarModel.init(model: CarModels.allCases[2], manufacturer: CarCountry.allCases[3], body: CarBodyStyle.allCases[0], carKey: UUID().uuidString)
		
		carsService.addCar(car: car)
		
	}
	
	func sceneDidDisconnect(_ scene: UIScene) {
		// Called as the scene is being released by the system.
		// This occurs shortly after the scene enters the background, or when its session is discarded.
		// Release any resources associated with this scene that can be re-created the next time the scene connects.
		// The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
	}
	
	func sceneDidBecomeActive(_ scene: UIScene) {
		// Called when the scene has moved from an inactive state to an active state.
		// Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
	}
	
	func sceneWillResignActive(_ scene: UIScene) {
		// Called when the scene will move from an active state to an inactive state.
		// This may occur due to temporary interruptions (ex. an incoming phone call).
	}
	
	func sceneWillEnterForeground(_ scene: UIScene) {
		// Called as the scene transitions from the background to the foreground.
		// Use this method to undo the changes made on entering the background.
	}
	
	func sceneDidEnterBackground(_ scene: UIScene) {
		// Called as the scene transitions from the foreground to the background.
		// Use this method to save data, release shared resources, and store enough scene-specific state information
		// to restore the scene back to its current state.
	}
	
}
