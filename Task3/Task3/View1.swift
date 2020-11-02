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

        private enum Constants: CGFloat {
            case imageViewHeight = 300
            case horizontalStandardSpace = 16
            case horizontalBigSpace = 32
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
            //changeViewsLayout(traitCollection: traitCollection)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: Changes Cycle

        override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            super.traitCollectionDidChange(previousTraitCollection)

           // changeViewsLayout(traitCollection: traitCollection)
        }
    }

    // MARK: Appearances

    private extension View1 {
        func setupViewsAppearances() {
            setupSuperViewAppearances()
            setupImageViewAppearances()
            setupLabel1Appearances()
            setupLabel2Appearances()
            setupLabel3Appearances()
            setupButton1Appearances()
            setupButton2Appearances()
        }

        func setupSuperViewAppearances() {
            self.backgroundColor = .systemBackground
        }

        func setupLabel1Appearances() {
            label1.numberOfLines = 1
            label1.textAlignment = .center
            label1.text = "Simple Label"
          //  imageView.image = Images.test.image
            //imageView.contentMode = .scaleAspectFill
           // imageView.clipsToBounds = true
        }

        func setupLabel2Appearances() {
            label2.numberOfLines = 1
            label2.textAlignment = .center
            label2.font = UIFont.boldSystemFont(ofSize: 14)
            label2.text = "Different font"
        }
        
        func setupLabel3Appearances() {
            label3.numberOfLines = 2
            label3.textAlignment = .center
            label3.font = UIFont.italicSystemFont(ofSize: 14)
            label3.text = """
            Different font
            line 2
            line 3 (not visible)
            """
        }
        
        func setupButton1Appearances() {
               // button1.layer.cornerRadius = 0.5 * button.bounds.size.width
                button1.layer.cornerRadius = 8
                button1.backgroundColor = .cyan
                button1.clipsToBounds = true
        }
        
        func setupButton2Appearances() {
            
            button2.backgroundColor = .red
            button2.clipsToBounds = true
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

        /*func changeViewsLayout(traitCollection: UITraitCollection) {
            switch(traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
            case (.compact, .regular):
                isLayoutCompact = true
                NSLayoutConstraint.deactivate(regularConstraints)
                NSLayoutConstraint.activate(compactConstraints)
            default:
                guard isLayoutCompact != false else { return }

                isLayoutCompact = false
                NSLayoutConstraint.deactivate(compactConstraints)
                NSLayoutConstraint.activate(regularConstraints)
            }
        }*/

        func setupViewsLayout() {
            setupSharedLayout()
            //setupCompactLayout()
            //setupRegularLayout()
        }

        func setupSharedLayout() {
            setupLabel1Layout()
            setupLabel2Layout()
            setupLabel3Layout()
            setupButton1Layout()
            setupButton2Layout()
            //setupImageViewLayout()
            //setupTitleLabelLayout()

            NSLayoutConstraint.activate(sharedConstraints)
        }

        func setupLabel1Layout() {
            self.addSubview(label1)
            label1.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                                            label1.trailingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.trailingAnchor ),
                                            label1.leadingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor ),
                                            label1.topAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.topAnchor ),
                                            label1.heightAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)])
        }

        func setupLabel2Layout() {
            self.addSubview(label2)
            label2.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                                            label2.trailingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.trailingAnchor ),
                                            label2.leadingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor ),
                                            label2.topAnchor.constraint(
                                                equalTo: self.label1.bottomAnchor
                                            ) ,
                label2.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15)
            ])
        }

        func setupLabel3Layout() {
            self.addSubview(label3)
            label3.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                                            label3.trailingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.trailingAnchor ),
                                            label3.leadingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor ),
                                            label3.topAnchor.constraint(
                                                equalTo: self.label2.bottomAnchor
                                            ) ,
                label3.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.26)
            ])
        }

        func setupButton1Layout() {
            self.addSubview(button1)
            button1.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                button1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                button1.topAnchor.constraint(
                    equalTo: self.label3.bottomAnchor
                ),
                button1.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),
                button1.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7)
            ])
        }
        
        func setupButton2Layout() {
            //.layer.cornerRadius = self.safeAreaLayoutGuide.layoutFrame.size.height * 0.15 * 0.5
            self.addSubview(button2)
            button2.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                button2.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),
                button2.widthAnchor.constraint(equalTo: button2.heightAnchor),
                button2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                button2.topAnchor.constraint(
                    equalTo: self.button1.bottomAnchor, constant: 3
                ),
            ])
            button2.layer.cornerRadius = 0.5 * button2.bounds.size.width
        }
        
        func setupImageViewLayout() {
           /* scrollView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                imageView.heightAnchor.constraint(equalToConstant: Constants.imageViewHeight.rawValue)
            ])*/
        }

    }

    // MARK: Compact Layout

   /* private extension View1 {
        func setupCompactLayout() {
            setupImageViewCompactLayout()
            setupTitleLabelCompactLayout()
        }

        func setupImageViewCompactLayout() {
            compactConstraints.append(contentsOf: [
                imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            ])
        }

        func setupTitleLabelCompactLayout() {
            compactConstraints.append(contentsOf: [
                titleLabel.leadingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalStandardSpace.rawValue),
                titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32)
            ])
        }
    }

    // MARK: Regular Layout

    private extension View1 {
        func setupRegularLayout() {
            setupImageViewRegularLayout()
            setupTitleLabelRegularLayout()
        }

        func setupImageViewRegularLayout() {
            regularConstraints.append(contentsOf: [
                imageView.leadingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.horizontalStandardSpace.rawValue),
                imageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -Constants.horizontalBigSpace.rawValue),
                imageView.widthAnchor.constraint(equalToConstant: 300)
            ])
        }

        func setupTitleLabelRegularLayout() {
            regularConstraints.append(contentsOf: [
                titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor)
            ])
        }
    }*/

