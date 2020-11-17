//
//  CarsElementViewModel.swift
//  Task5
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit


protocol IUI: AnyObject
{
	var tapButtonHandler: (() -> Void)? { get set }
}

class CarsElementViewModel: IUI {
	var tapButtonHandler: (() -> Void)?
	var carModel: String?
	var carYear: String?
	var carCountry: String?
	var carBodyStyle: String?
	var carNumber: String?

	init (withElementModel model: CarModel) {
		self.carModel = model.model.rawValue
		self.carCountry = model.manufacturer.rawValue
		self.carBodyStyle = model.body.rawValue
		if let year = model.yearOfIssue {
			carYear = String(year)
		}
		if let number = model.carNumber {
			carNumber = String(number)
		}
	}
}
