//
//  InfoViewController.swift
//  Navigation
//
//  Created by Юлия Корнишина on 19.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    let alertButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 13, y: 650, width: 350, height: 52))
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.backgroundColor = .systemBackground
        button.setTitle("alert", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        view.addSubview(alertButton)
        setupButton()
    }
    
    private func setupButton() {
        alertButton.addTarget(self, action: #selector(didTapAlertButton), for: .touchUpInside)
    }
    
    @objc private func didTapAlertButton() {
        let alert = UIAlertController(title: "Attention", message: "Are you sure?", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "YES", style: .default, handler: {action in print ("YES")})
        let noButton = UIAlertAction(title: "NO", style: .default, handler: {action in print ("NO")})
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated: true, completion: nil)
        print("Alert")
    }
}
