//
//  PostView.swift
//  Navigation
//
//  Created by Юлия Корнишина on 07.05.2022.
//

import UIKit

class PostView: UIView {

    struct ViewModel: ViewModelProtocol {
        var author, description, image: String
        var likes: Int
        var views: Int
    }
    
    private lazy var lightGrayView: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .justified
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Likes: "
        label.textColor = .black
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Views: "
        label.textColor = .black
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var returnButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "clear")
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setBackgroundImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func didTapButton() {
        removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(self.lightGrayView)
        self.addSubview(self.returnButton)
        self.lightGrayView.addSubview(self.authorLabel)
        self.lightGrayView.addSubview(self.postImageView)
        self.lightGrayView.addSubview(self.descriptionLabel)
        self.lightGrayView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.likesLabel)
        self.stackView.addArrangedSubview(self.viewsLabel)
        
        NSLayoutConstraint.activate([
            self.lightGrayView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.lightGrayView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.lightGrayView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.lightGrayView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.authorLabel.topAnchor.constraint(equalTo: self.lightGrayView.topAnchor),
            self.authorLabel.leadingAnchor.constraint(equalTo: self.lightGrayView.leadingAnchor, constant: 16),
            self.authorLabel.trailingAnchor.constraint(equalTo: self.lightGrayView.trailingAnchor, constant: -16),
            
            self.postImageView.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 4),
            self.postImageView.leadingAnchor.constraint(equalTo: self.lightGrayView.leadingAnchor),
            self.postImageView.trailingAnchor.constraint(equalTo: self.lightGrayView.trailingAnchor),
            self.postImageView.heightAnchor.constraint(equalTo: self.lightGrayView.widthAnchor, multiplier: 1.0),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.lightGrayView.leadingAnchor, constant: 16),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.lightGrayView.trailingAnchor, constant: -16),
            
            self.stackView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.lightGrayView.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.lightGrayView.trailingAnchor, constant: -16),
            self.stackView.bottomAnchor.constraint(equalTo: self.lightGrayView.bottomAnchor, constant: -16),
            
            self.returnButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.returnButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.returnButton.heightAnchor.constraint(equalToConstant: 28),
            self.returnButton.widthAnchor.constraint(equalToConstant: 28)
        ])
    }
}

extension PostView: Setupable {
   
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        self.authorLabel.text = viewModel.author
        self.postImageView.image = UIImage(named: viewModel.image)
        self.descriptionLabel.text = viewModel.description
        self.likesLabel.text = "Likes: " + String(viewModel.likes)
        self.viewsLabel.text = "Views: " + String(viewModel.views)
    }
}
