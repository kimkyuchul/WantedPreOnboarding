//
//  MainViewController.swift
//  WantedPreOnboarding
//
//  Created by 김규철 on 2023/02/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let imageView = (1...5).map { _ in
        ImageView()
    }
   
   private let loadAllImageButton: UIButton = {
       let button = UIButton(configuration: .filled())
       button.setTitle("Load All Images", for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
   }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
        setView()
        setUp()
    }
    
    private func setView() {
        view.addSubview(mainStackView)
        view.addSubview(loadAllImageButton)
        imageView.forEach { mainStackView.addArrangedSubview($0) }
    }
    
    private func setUp() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            loadAllImageButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 10),
            loadAllImageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            loadAllImageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        
        imageView.forEach { $0.heightAnchor.constraint(equalToConstant: 70).isActive = true }
        
        loadAllImageButton.addTarget(self, action: #selector(allloadImage), for: .touchUpInside)
    }
    
    @objc func allloadImage() {
        imageView.forEach { $0.loadImage() }
    }
}
