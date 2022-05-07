//
//  FeedViewController.swift
//  Navigation
//
//  Created by Юлия Корнишина on 19.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let buttonOne: UIButton = {
           let buttonOne = UIButton()
        buttonOne.setTitle("buttonOne", for: .normal)
        buttonOne.backgroundColor = .systemBlue
        buttonOne.setTitleColor(.white, for: .normal)
        buttonOne.layer.cornerRadius = 12
        buttonOne.clipsToBounds = true
        buttonOne.addTarget(FeedViewController.self, action: #selector(didTabButton), for: .touchUpInside)
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
           return buttonOne
       }()
    
    private let buttonTwo: UIButton = {
           let buttonTwo = UIButton()
        buttonTwo.setTitle("buttonTwo", for: .normal)
        buttonTwo.backgroundColor = .systemBlue
        buttonTwo.setTitleColor(.white, for: .normal)
        buttonTwo.layer.cornerRadius = 12
        buttonTwo.clipsToBounds = true
        buttonTwo.addTarget(FeedViewController.self, action: #selector(didTabButton), for: .touchUpInside)
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
           return buttonTwo
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    @objc private func didTabButton() {
        let postViewController = PostViewController()
        postViewController.navigationItem.title = "Post"
        self.navigationController?.pushViewController(postViewController, animated: true)
    }

    private func setupViews() {
        title = "Post"
        view.addSubview(buttonStackView)
        self.buttonStackView.addArrangedSubview(self.buttonOne)
        self.buttonStackView.addArrangedSubview(self.buttonTwo)
        
        NSLayoutConstraint.activate([
            self.buttonStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            self.buttonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.buttonStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.buttonStackView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
}
