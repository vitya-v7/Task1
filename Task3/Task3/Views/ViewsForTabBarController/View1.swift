//
//  View1.swift
//  Task3
//
//  Created by user183410 on 11/1/20.
//

import UIKit

class View1: UIView {

	// MARK: Properties

	private var isLayoutCompact = true

	private var sharedConstraints: [NSLayoutConstraint] = []
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []

	private enum Constants: CGFloat
	{
		case imageViewHeight = 300
		case bottomAndTopSpace = 8
		case spaceBetweenButtons = 3
		case labelFontSize = 14
		case buttonFontSize = 10
	}

	// MARK: Views

	private let label1 = UILabel()
	private let label2 = UILabel()
	private let label3 = UILabel()
	private let button1 = UIButton(type: .custom)
	private let button2 = UIButton(type: .custom)
	private let imageView = UIImageView()
	private let activityIndicator = UIActivityIndicatorView()
    
	// MARK: Life Cycle

	public override init(frame: CGRect) {
		super.init(frame: frame)

		setupViewsAppearances()
		setupViewsLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: Changes Cycle

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
	}
}

	// MARK: Appearances

extension View1 {
	func makeButton2Rounded() {
		button2.layer.cornerRadius = button2.bounds.height/2
	}
}

private extension View1 {
	func setupViewsAppearances() {
		setupSuperViewAppearances()
		setupImageViewAppearances()
		setupLabel1Appearances()
		setupLabel2Appearances()
		setupLabel3Appearances()
		setupButton1Appearances()
		setupButton2Appearances()
		setupImageViewAppearances()
		setupActivityIndicatorAppearances()
	}

	func setupSuperViewAppearances() {
		backgroundColor = .systemBackground
	}

	func setupLabel1Appearances() {
		label1.numberOfLines = 1
		label1.textAlignment = .center
		label1.text = "Simple Label"
	}

	func setupLabel2Appearances() {
		label2.numberOfLines = 1
		label2.textAlignment = .center
		label2.font = UIFont.boldSystemFont(ofSize: Constants.labelFontSize.rawValue)
		label2.text = "Different font"
	}

	func setupLabel3Appearances() {
		label3.numberOfLines = 2
		label3.textAlignment = .center
		label3.font = UIFont.italicSystemFont(ofSize: Constants.labelFontSize.rawValue)
		label3.text = """
            Different font
            line 2
            line 3 (not visible)
            """
	}

	func setupButton1Appearances() {
		button1.layer.cornerRadius = Constants.bottomAndTopSpace.rawValue
		button1.backgroundColor = .cyan
		button1.clipsToBounds = true
		button1.setTitleColor(.black, for: .normal)
		button1.setTitle("Button1", for: .normal)
		button1.layer.borderWidth = 1
		button1.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
	}

	func setupButton2Appearances() {
		button2.backgroundColor = .red
		button2.clipsToBounds = true
		button2.setTitleColor(.black, for: .normal)
		button2.setTitle("Button2", for: .normal)
		button2.titleLabel?.font = .italicSystemFont(ofSize: Constants.buttonFontSize.rawValue)
		button2.layer.borderWidth = 1
		button2.layer.borderColor = .init(red: 0, green: 1, blue: 1, alpha: 1)
	}

	func setupImageViewAppearances() {
		imageView.image = Images.test.image
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
	}

	func setupActivityIndicatorAppearances() {
		activityIndicator.color = .black
		activityIndicator.startAnimating()
	}

}

// MARK: Shared Layout

private extension View1 {

	func setupViewsLayout() {
		setupSharedLayout()
	}

	func setupSharedLayout() {
		setupLabel1Layout()
		setupLabel2Layout()
		setupLabel3Layout()
		setupButton1Layout()
		setupButton2Layout()
		setupImageViewLayout()
		setupActivityIndicatorLayout()
		NSLayoutConstraint.activate(sharedConstraints)
	}

	func setupLabel1Layout() {
		addSubview(label1)
		label1.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			label1.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor),
			label1.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor),
			label1.topAnchor.constraint(
				equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.bottomAndTopSpace.rawValue),
			label1.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)])
	}

	func setupLabel2Layout() {
		addSubview(label2)
		label2.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			label2.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor),
			label2.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor),
			label2.topAnchor.constraint(
				equalTo: label1.bottomAnchor),
			label2.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.15)
		])
	}

	func setupLabel3Layout() {
		addSubview(label3)
		label3.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			label3.trailingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.trailingAnchor),
			label3.leadingAnchor.constraint(
				equalTo: safeAreaLayoutGuide.leadingAnchor),
			label3.topAnchor.constraint(
				equalTo: label2.bottomAnchor),
			label3.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.26)
		])
	}

	func setupButton1Layout() {
		addSubview(button1)
		button1.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			button1.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor),
			button1.topAnchor.constraint(
				equalTo: label3.bottomAnchor),
			button1.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.10),
			button1.widthAnchor.constraint(
				equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.7)
		])
	}

	func setupButton2Layout() {
		addSubview(button2)
		button2.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			button2.heightAnchor.constraint(
				equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.10),
			button2.widthAnchor.constraint(
				equalTo: button2.heightAnchor),
			button2.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor),
			button2.topAnchor.constraint(
				equalTo: button1.bottomAnchor, constant: Constants.spaceBetweenButtons.rawValue
			),
		])
	}

	func setupImageViewLayout() {
		addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(
				equalTo: button2.bottomAnchor, constant: Constants.spaceBetweenButtons.rawValue),
			imageView.bottomAnchor.constraint(
				equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Constants.bottomAndTopSpace.rawValue),
			imageView.widthAnchor.constraint(
				equalTo: imageView.heightAnchor),
			imageView.centerXAnchor.constraint(
				equalTo: safeAreaLayoutGuide.centerXAnchor)
		])
	}

	func setupActivityIndicatorLayout() {
		addSubview(activityIndicator)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			activityIndicator.widthAnchor.constraint(
				equalTo: imageView.widthAnchor),
			activityIndicator.heightAnchor.constraint(
				equalTo: imageView.heightAnchor),
			activityIndicator.centerYAnchor.constraint(
				equalTo: imageView.centerYAnchor),
			activityIndicator.centerXAnchor.constraint(
				equalTo: imageView.centerXAnchor)
		])
	}
}

