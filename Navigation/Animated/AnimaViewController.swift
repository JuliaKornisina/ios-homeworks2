//
//  AnimaViewController.swift
//  Navigation
//
//  Created by Юлия Корнишина on 14.04.2022.
//

import UIKit

final class AnimaViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Cat"))
        imageView.layer.borderWidth = 3.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 70
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var mySecondView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.alpha = 0
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var myButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "multiply.square")
        button.setBackgroundImage(image, for: .normal)
        button.isHidden = true
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private var topImageConstraint: NSLayoutConstraint?
    private var leadingImageConstraint: NSLayoutConstraint?
    private var widthImageConstraint: NSLayoutConstraint?
    private var heightImageConstraint: NSLayoutConstraint?
    
    private var isExpanded = false
    
    private func setupNavigationBar() {
                self.navigationController?.navigationBar.prefersLargeTitles = false
                self.navigationItem.title = "Anima"
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupGesture()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.mySecondView)
        self.view.addSubview(self.myButton)
        
        self.topImageConstraint = self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50)
        self.leadingImageConstraint = self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30)
        self.heightImageConstraint = self.imageView.heightAnchor.constraint(equalToConstant: 140)
        self.widthImageConstraint = self.imageView.widthAnchor.constraint(equalToConstant: 140)
        
        let centerXViewConstraint = self.mySecondView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let centerYViewConstraint = self.mySecondView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        let heightViewConstraint = self.mySecondView.heightAnchor.constraint(equalToConstant: 250)
        let widthViewConstraint = self.mySecondView.widthAnchor.constraint(equalToConstant: 250)
        
        let topButtonConstraint = self.myButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200)
        let trailingButtonConstraint = self.myButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let heightButtonConstraint = self.myButton.heightAnchor.constraint(equalToConstant: 50)
        let widthButtonConstraint = self.myButton.widthAnchor.constraint(equalToConstant: 50)
            
            NSLayoutConstraint.activate([
                self.topImageConstraint, self.leadingImageConstraint, self.heightImageConstraint, self.widthImageConstraint,
                centerXViewConstraint, centerYViewConstraint, heightViewConstraint, widthViewConstraint,
                topButtonConstraint, trailingButtonConstraint, heightButtonConstraint, widthButtonConstraint].compactMap({ $0 }))
    }
 
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.handleTapGesture(_:)))
        self.imageView.addGestureRecognizer(self.tapGestureRecognizer)
        myButton.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
    }
    
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        self.mySecondView.isHidden = false
        self.myButton.isHidden = false
        self.isExpanded.toggle()
        self.heightImageConstraint?.constant = self.isExpanded ? self.view.bounds.height : 140
        self.widthImageConstraint?.constant = self.isExpanded ? self.view.bounds.width : 140
        NSLayoutConstraint.deactivate([self.topImageConstraint, self.leadingImageConstraint].compactMap({ $0 }))
        
        UIView.animate(withDuration: 0.5) {
            self.mySecondView.alpha = self.isExpanded ? 0.5 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in }
        
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.myButton.alpha = self.isExpanded ? 1 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in }
    }
    
    @objc private func didTapButton() {
        self.mySecondView.isHidden = false
        self.myButton.isHidden = false
        self.isExpanded.toggle()
        self.heightImageConstraint?.constant = self.isExpanded ? self.view.bounds.height : 140
        self.widthImageConstraint?.constant = self.isExpanded ? self.view.bounds.width : 140
        NSLayoutConstraint.activate([self.topImageConstraint, self.leadingImageConstraint].compactMap({ $0 }))
        UIView.animate(withDuration: 0.5) {
            self.mySecondView.alpha = self.isExpanded ? 0.5 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in }
        
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.myButton.alpha = self.isExpanded ? 1 : 0 
            self.view.layoutIfNeeded()
        } completion: { _ in }
    }
}
