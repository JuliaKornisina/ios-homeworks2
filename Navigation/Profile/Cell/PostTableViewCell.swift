//
//  File.swift
//  Navigation
//
//  Created by Юлия on 03.04.2022.
//


import UIKit

final class PostTableViewCell: UITableViewCell {
    
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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupGesture()
        self.setupGesture1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() { // обнуление информации в ячейках
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.descriptionLabel.text = nil
        self.postImageView.image = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.lightGrayView)
        self.lightGrayView.addSubview(self.authorLabel)
        self.lightGrayView.addSubview(self.postImageView)
        self.lightGrayView.addSubview(self.descriptionLabel)
        self.lightGrayView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.likesLabel)
        self.stackView.addArrangedSubview(self.viewsLabel)
        
        
        let lightGrayViewConstraints = self.lightGrayViewConstraints()
        let authorLabelConstraints = self.authorLabelConstraints()
        let postImageViewConstraints = self.postImageViewConstraints()
        let descriptionLabelConstraints = self.descriptionLabelConstraints()
        let stackViewConstraints = self.stackViewConstraints()
        
        NSLayoutConstraint.activate(lightGrayViewConstraints + authorLabelConstraints + postImageViewConstraints + descriptionLabelConstraints + stackViewConstraints)
    }
    
    private func lightGrayViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.lightGrayView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.lightGrayView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.lightGrayView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.lightGrayView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        return [
        topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }

    private func authorLabelConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.authorLabel.topAnchor.constraint(equalTo: self.lightGrayView.topAnchor, constant: 16)
        let leadingConstraint = self.authorLabel.leadingAnchor.constraint(equalTo: self.lightGrayView.leadingAnchor, constant: 16)
        let trailingConstraint = self.authorLabel.trailingAnchor.constraint(equalTo: self.lightGrayView.trailingAnchor, constant: -16)
        return [
        topConstraint, leadingConstraint, trailingConstraint //bottomConstraint
        ]
    }
    
    private func postImageViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.postImageView.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 12)
        let leadingConstraint = self.postImageView.leadingAnchor.constraint(equalTo: self.lightGrayView.leadingAnchor)
        let trailingConstraint = self.postImageView.trailingAnchor.constraint(equalTo: self.lightGrayView.trailingAnchor)
        let widthConstraint = self.postImageView.heightAnchor.constraint(equalTo: self.lightGrayView.widthAnchor, multiplier: 1.0)
        return [
        topConstraint, leadingConstraint, trailingConstraint, widthConstraint
        ]
    }
    
    private func descriptionLabelConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16)
        let leadingConstraint = self.descriptionLabel.leadingAnchor.constraint(equalTo: self.lightGrayView.leadingAnchor, constant: 16)
        let trailingConstraint = self.descriptionLabel.trailingAnchor.constraint(equalTo: self.lightGrayView.trailingAnchor, constant: -16)
        return [
        topConstraint, leadingConstraint, trailingConstraint
        ]
    }
    
    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.lightGrayView.leadingAnchor, constant: 16)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.lightGrayView.trailingAnchor, constant: -16)
        let bottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.lightGrayView.bottomAnchor, constant: -16)
        return [
        topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private let tapGestureRecognizer1 = UITapGestureRecognizer()

    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_ :)))
        self.likesLabel.addGestureRecognizer(self.tapGestureRecognizer)
    }

    @objc private func handlePanGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        let userLikes = 0
        if likesLabel.isUserInteractionEnabled == true {
            self.likesLabel.text? += String(userLikes + 1)
        } else {
            self.likesLabel.text? += String(userLikes)
        }
    }
    
    private func setupGesture1() {
        self.tapGestureRecognizer1.addTarget(self, action: #selector(handlePanGesture1(_ :)))
        self.postImageView.addGestureRecognizer(self.tapGestureRecognizer1)
    }

    @objc private func handlePanGesture1(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer1 === gestureRecognizer else { return }
        print("tap")
    
        UIView.animate(withDuration: 3) {
            self.postImageView.layoutIfNeeded()
            } completion: { _ in
            }
                 
        let userViews = 0
        if postImageView.isUserInteractionEnabled == true {
            self.viewsLabel.text? += String(userViews + 1)
        } else {
            self.viewsLabel.text? += String(userViews)
        }
    }
}
    extension PostTableViewCell: Setupable {
        
        func setup(with viewModel: ViewModelProtocol) {
            guard let viewModel = viewModel as? ViewModel else { return }
            
            self.authorLabel.text = viewModel.author
            self.descriptionLabel.text = viewModel.description
            self.postImageView.image = UIImage(named: viewModel.image)
            self.descriptionLabel.text = viewModel.description
            }
    }
