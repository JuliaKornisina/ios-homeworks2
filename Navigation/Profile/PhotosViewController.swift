//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Юлия Корнишина on 09.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private enum Constant {
        static let itemCount: CGFloat = 3
    }
    
    var images = [UIImage]()
    
    private lazy var layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 8
            layout.minimumLineSpacing = 8
            return layout
        }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.collectionView)
        
        for i in 0...19 {
            if let image = UIImage(named: "m\(i)") {
                images.append(image)
            }
        }
        
            NSLayoutConstraint.activate([
                self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Photo Gallery"
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize { // размер ячейки
        let needWidth = width - 4 * spacing
        let itemWidth = floor(needWidth / Constant.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        let image = images[indexPath.item]
        cell.photoView.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let animationCell = AnimationPhotoCell()
        animationCell.delegate = self
        self.view.addSubview(animationCell)
        animationCell.imageAnimationCell.image = images[indexPath.item]
        navigationController?.navigationBar.isHidden = true
        NSLayoutConstraint.activate([
            animationCell.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationCell.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationCell.topAnchor.constraint(equalTo: view.topAnchor),
            animationCell.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        UIView.animate(withDuration: 1, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                animationCell.buttonCancel.alpha = 1
                animationCell.backgroundColor = .white.withAlphaComponent(0.8)
            }
        }
    }
}

extension PhotosViewController: AnimationPhotoCellDelegate {
    func tapButton(view: AnimationPhotoCell) {
        view.removeFromSuperview()
        navigationController?.navigationBar.isHidden = false
    }
}
