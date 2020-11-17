//
//  CarsListDataSource.swift
//  Task5
//
//  Created by Admin on 16.11.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
protocol CarsListDataSourceProtocol: UITableViewDataSource {
	func setItems(_ CellModels: [CarsElementViewModel])
	func getItem(for indexPath: IndexPath) -> CarsElementViewModel
}

class CarsListDataSource: NSObject, CarsListDataSourceProtocol {
	var cellModels = [CarsElementViewModel]()

	func setItems(_ CellModels: [CarsElementViewModel]) {
		cellModels = CellModels
	}

	func getItem(for indexPath: IndexPath) -> CarsElementViewModel {
		return cellModels[indexPath.row]
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CarsElementCell.reuseIdentifier) as! CarsElementCell
		cell.configureCell(withObject: cellModels[indexPath.row])
		return cell
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.cellModels.count
	}
}