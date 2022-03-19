//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юлия on 19.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "Cat")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 42
        avatarImageView.layer.masksToBounds = true
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Hipster Cat"
        fullNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.backgroundColor = .lightGray
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Show Status", for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.layer.cornerRadius = 12
        setStatusButton.clipsToBounds = true
        setStatusButton.layer.shadowOffset = .init(width: 4, height: 4)
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 12, height: 12)
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 12
        setStatusButton.layer.masksToBounds = false
        setStatusButton.addTarget(self, action: #selector(didTapStatusButton), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    @objc private func didTapStatusButton() {
        print("Action")
    }
    
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.font = .systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderWidth = 1.0
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.textAlignment = .center
        statusTextField.clearButtonMode = .whileEditing
        statusTextField.clearButtonMode = .unlessEditing
        statusTextField.clearButtonMode = .always
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private var buttonTopConstraint: NSLayoutConstraint?
    
    private func drawSelf() {
        self.addSubview(self.infoStackView)
        self.addSubview(self.setStatusButton)
        self.addSubview(self.statusTextField)
        self.infoStackView.addArrangedSubview(self.avatarImageView)
        self.infoStackView.addArrangedSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.fullNameLabel)
        self.labelsStackView.addArrangedSubview(self.statusLabel)
        self.labelsStackView.addArrangedSubview(self.statusTextField)
        
        let topConstraint = self.infoStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let leadingConstraint = self.infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingConstraint = self.infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        let imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1)
       
       self.buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 34)
        self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)
        let leadingButtonConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.infoStackView.leadingAnchor)
        let trailingButtonConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor)
        let bottomButtonConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let heightButtonConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        
       
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint,
            imageViewAspectRatio, self.buttonTopConstraint,
            leadingButtonConstraint, trailingButtonConstraint, bottomButtonConstraint, heightButtonConstraint
        ].compactMap({ $0 }))
    }
}
