//
//  ImageView.swift
//  WantedPreOnboarding
//
//  Created by 김규철 on 2023/03/05.
//

import UIKit

final class ImageView: UIStackView {
    
    private let imageView = UIImageView(image: .init(systemName: "photo"))
    
    private let loadButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Load", for: .normal)
        return button
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(0.5, animated: true)
        progressView.backgroundColor = .lightGray
        progressView.layer.cornerRadius = 1
        progressView.clipsToBounds = true
        return progressView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
        alignment = .center
        spacing = 10
        
        setUp()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 90),
            imageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        [imageView, progressView, loadButton].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(subView)
        }
    }
}
