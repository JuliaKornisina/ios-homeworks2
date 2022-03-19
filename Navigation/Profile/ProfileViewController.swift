//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юлия on 19.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var newButton: UIButton = {
        let newButton = UIButton()
        newButton.setTitle("Button", for: .normal)
        newButton.backgroundColor = .systemBlue
        newButton.setTitleColor(.white, for: .normal)
        newButton.layer.cornerRadius = 12
        newButton.clipsToBounds = true
        newButton.layer.shadowOffset = .init(width: 4, height: 4)
        newButton.layer.shadowColor = UIColor.black.cgColor
        newButton.layer.shadowOffset = CGSize(width: 12, height: 12)
        newButton.layer.shadowOpacity = 0.7
        newButton.layer.shadowRadius = 12
        newButton.layer.masksToBounds = false
        newButton.translatesAutoresizingMaskIntoConstraints = false
        return newButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewButton()
    }
    
    private var heightConstraint: NSLayoutConstraint?
    
    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)
    
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
    let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
    let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
    
    NSLayoutConstraint.activate([
        topConstraint, leadingConstraint, trailingConstraint, heightConstraint
    ].compactMap({ $0 }))
    }
    
    private func setupViewButton() {
        self.view.addSubview(self.newButton)
    
        let topConstraint = self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
    let leadingConstraint = self.newButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
    let trailingConstraint = self.newButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let heightConstraint = self.newButton.heightAnchor.constraint(equalToConstant: 50)
    
    NSLayoutConstraint.activate([
        topConstraint, leadingConstraint, trailingConstraint, heightConstraint
    ].compactMap({ $0 }))
    }
}
