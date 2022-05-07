//
//  PostViewController.swift
//  Navigation
//
//  Created by Юлия Корнишина on 19.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        let buttonPost = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self,action: #selector(didTapButtonPost))
        self.navigationItem.rightBarButtonItem = buttonPost
    }
    
    @objc private func didTapButtonPost() {
        let infoViewController = InfoViewController()
        infoViewController.modalPresentationStyle = .fullScreen
        self.present(infoViewController, animated: true)
    }
}
