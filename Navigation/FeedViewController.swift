//
//  FeedViewController.swift
//  Navigation
//
//  Created by Юлия on 18.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle(" Мой пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        setupViews()
        button.addTarget(self, action:#selector(didTabButton), for: .touchUpInside)
        self.button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func didTabButton() {
        let postViewController = PostViewController()
        postViewController.navigationItem.title = "Мой пост"
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func setupViews() {
        title = "Пост"
        view.addSubview(button)
    }
}
