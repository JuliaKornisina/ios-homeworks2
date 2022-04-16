//
//  LoginViewController.swift
//  Navigation
//
//  Created by Юлия on 03.04.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Email of phone"
        loginTextField.font = .systemFont(ofSize: 16, weight: .regular)
        loginTextField.textColor = .black
        loginTextField.tintColor = .lightGray
        loginTextField.backgroundColor = .systemGray6
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.clearButtonMode = .whileEditing
        loginTextField.clearButtonMode = .unlessEditing
        loginTextField.clearButtonMode = .always
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
        loginTextField.leftView = leftView
        loginTextField.leftViewMode = .always
        loginTextField.autocapitalizationType = .none
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.font = .systemFont(ofSize: 16, weight: .regular)
        passwordTextField.textColor = .black
        passwordTextField.tintColor = .lightGray
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.clearButtonMode = .unlessEditing
        passwordTextField.clearButtonMode = .always
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
        passwordTextField.leftView = leftView
        passwordTextField.leftViewMode = .always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocapitalizationType = .none
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hexString: "4885CC")
        button.layer.cornerRadius = 10
        if button.isSelected {
            button.alpha = 0.8
        } else if button.isHighlighted {
            button.alpha = 0.8
        } else if !button.isEnabled {
            button.alpha = 0.8
        } else {
            button.alpha = 1
        }
        button.addTarget(self, action: #selector(self.didTapLogButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let textFieldStackView = UIStackView()
        textFieldStackView.axis = .vertical
        textFieldStackView.distribution = .fillEqually
        textFieldStackView.spacing = 0
        textFieldStackView.layer.cornerRadius = 10
        textFieldStackView.clipsToBounds = true
        textFieldStackView.layer.borderWidth = 0.5
        textFieldStackView.layer.borderColor = UIColor.lightGray.cgColor
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        return textFieldStackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setUpView()
        self.tapGesture()
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrameSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentOffset = CGPoint(x: 0, y: keyboardFrameSize.height * 0.1)
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrameSize.height, right: 0)
        }
    }
        
        @objc func keyboardWillHide(notification: NSNotification) {
            scrollView.contentOffset = CGPoint.zero
        }
    
    private func setUpView() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(self.stackView)
        self.scrollView.addSubview(self.imageView)
        self.stackView.addArrangedSubview(self.textFieldStackView)
        self.stackView.addArrangedSubview(self.logInButton)
        self.textFieldStackView.addArrangedSubview(self.loginTextField)
        self.textFieldStackView.addArrangedSubview(self.passwordTextField)
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -30),
            self.imageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 100),
            self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor, multiplier: 1.0),
            self.stackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            self.logInButton.heightAnchor.constraint(equalToConstant: 50),
            //self.label.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
    
    private func tapGesture() {
            let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing))
            self.view.addGestureRecognizer(tapGesture)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc private func didTapLogButton() {
        if logInButton.isSelected {
            logInButton.alpha = 0.8
        } else if logInButton.isHighlighted {
            logInButton.alpha = 0.8
        } else if !logInButton.isEnabled {
            logInButton.alpha = 0.8
        } else {
            logInButton.alpha = 1
        }
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}
