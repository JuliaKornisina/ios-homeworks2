//
//  AnimationPhotoCell.swift
//  Navigation
//
//  Created by Юлия Kорнишина on 07.05.2022.
//

import UIKit

protocol AnimationPhotoCellDelegate: AnyObject {
    func tapButton(view: AnimationPhotoCell)
}

class AnimationPhotoCell: UIView {
    weak var delegate: AnimationPhotoCellDelegate?
    var tapButtonCancel = UITapGestureRecognizer()
    
    lazy var imageAnimationCell: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var buttonCancel: UIImageView = {
        let button = UIImageView()
        button.image = UIImage(systemName: "multiply.square")
        button.tintColor = .black
        button.alpha = 0
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.drawSelf()
        self.setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.addSubview(self.imageAnimationCell)
        self.addSubview(buttonCancel)
        
        NSLayoutConstraint.activate([
            imageAnimationCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageAnimationCell.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageAnimationCell.widthAnchor.constraint(equalTo: self.widthAnchor),
            imageAnimationCell.heightAnchor.constraint(equalTo: self.heightAnchor),
            buttonCancel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            buttonCancel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            buttonCancel.widthAnchor.constraint(equalToConstant: 30),
            buttonCancel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupGesture() {
        tapButtonCancel.addTarget(self, action: #selector(tapButton1(_:)))
        buttonCancel.addGestureRecognizer(tapButtonCancel)
    }
    
    @objc func tapButton1(_ gestureRecognizer: UITapGestureRecognizer) {
        delegate?.tapButton(view: self)
    }
}

