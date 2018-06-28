//
//  ViewController.swift
//  TypedPreferences
//
//  Created by kernel on 06/28/2018.
//  Copyright (c) 2018 ReImpl. All rights reserved.
//

import UIKit
import TypedPreferences

final class AppPreferences: TypedPreferences {
	
	dynamic var launchCounter: Int
	
	override init() {
		launchCounter = 0
		
		super.init()
	}
	
}

class ViewController: UIViewController {
	
	@IBOutlet weak var infoLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let preferences = AppPreferences()
		
		let count = preferences.launchCounter + 1
		preferences.launchCounter = count
		
		infoLabel.text = "This app was launched \(count) time(s)."
	}

}

