//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Юлия Корнишина on 09.04.2022.
//

import UIKit

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    lazy var photoView: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        return photo
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.photoView)

        NSLayoutConstraint.activate([
            self.photoView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.photoView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.photoView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.photoView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoView.image = nil
    }
}
