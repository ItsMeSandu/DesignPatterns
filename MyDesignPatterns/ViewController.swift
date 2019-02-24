//
//  ViewController.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 24.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    lazy var greenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor  = .green
        button.setTitle("Green", for: [])
        button.setTitleColor(.white, for: [])
        button.layer.cornerRadius   = 12
        button.addTarget(self, action: #selector(tappedGreen), for: .touchUpInside)

        return button
    }()
    
    lazy var redButton: UIButton = {
        let button = UIButton()
        button.backgroundColor  = .red
        button.setTitle("Red", for: [])
        button.setTitleColor(.white, for: [])
        button.layer.cornerRadius   = 12
        button.addTarget(self, action: #selector(tappedRed), for: .touchUpInside)

        return button
    }()

    // MARK: - system-methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = ColourPalette.shared.background
        setupViews()
    }
    
    // MARK: - setup views
    private func setupViews() {
        view.addSubview(greenButton)
        view.addSubview(redButton)

        greenButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.translatesAutoresizingMaskIntoConstraints = false
        
        let layoutGuide = view.layoutMarginsGuide

        greenButton.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 16).isActive = true
        greenButton.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 16).isActive = true
        greenButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -16).isActive = true

        redButton.topAnchor.constraint(equalTo: greenButton.bottomAnchor, constant: 16).isActive = true
        redButton.leadingAnchor.constraint(equalTo: greenButton.leadingAnchor).isActive = true
        redButton.trailingAnchor.constraint(equalTo: greenButton.trailingAnchor).isActive = true
    }
    
    // MARK: - handle-methods
    @objc func tappedRed() {
        coordinator?.goRed()
    }
    
    @objc func tappedGreen() {
        coordinator?.goGreen()
    }
}

