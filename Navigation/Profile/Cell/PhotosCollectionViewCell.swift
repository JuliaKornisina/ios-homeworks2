//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Юлия Корнишина on 09.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private var topConstraint: NSLayoutConstraint?
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    private var heightImageConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.photoImageView)
        self.setupGesture()
        
        self.topConstraint = self.photoImageView.topAnchor.constraint(equalTo: self.topAnchor)
        self.leadingConstraint = self.photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        self.trailingConstraint = self.photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        self.bottomConstraint = self.photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        
        NSLayoutConstraint.activate([
            self.topConstraint, self.leadingConstraint, self.trailingConstraint, self.bottomConstraint
        ].compactMap({ $0 }))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.handleTapGesture(_:)))
        self.photoImageView.addGestureRecognizer(self.tapGestureRecognizer)
    }

    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        print("tap")
        NSLayoutConstraint.activate([self.photoImageView.heightAnchor.constraint(equalToConstant: self.bounds.height)])
        NSLayoutConstraint.deactivate([self.topConstraint, self.leadingConstraint, self.trailingConstraint, self.bottomConstraint].compactMap({ $0 }))
    }
}
