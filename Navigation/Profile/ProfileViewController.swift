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
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private var heightConstraint: NSLayoutConstraint?
    
    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)
    
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
    let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
    let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
       // let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor)
        let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 170)
    
    NSLayoutConstraint.activate([
        topConstraint, leadingConstraint, trailingConstraint, heightConstraint
    ].compactMap({ $0 }))
    }
}
    extension ProfileViewController: ProfileHeaderViewProtocol {
        
        func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
            self.heightConstraint?.constant = textFieldIsVisible ? 214 : 170
            
            UIView.animate(withDuration: 0.3, delay: 0.0) {
                self.view.layoutIfNeeded()
            } completion: { _ in
                completion()
            }
        }
    }
