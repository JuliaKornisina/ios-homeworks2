//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юлия on 19.03.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.backgroundColor = .systemGray6
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var tableHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var heightConstraint: NSLayoutConstraint? //высота хедера
    
    private lazy var jsonDecoder: JSONDecoder = {
        return JSONDecoder()
    }()
    
    private var dataSource: [News.Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.fetchPosts{ [weak self] posts in
            self?.dataSource = posts
            self?.tableView.reloadData()
        }
        self.tableView.tableHeaderView = tableHeaderView
        self.setupNavigationBar()
        self.tapGesture()
        self.setupProfileHeaderView()
        
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Profile"
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateHeaderViewHeight(for: tableView.tableHeaderView)
       
    }
    
    private func setupView() {
        self.view.addSubview(self.tableView)
        
        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }
    
    private func setupProfileHeaderView() {
        self.view.backgroundColor = .lightGray
        let topConstraint = self.tableHeaderView.topAnchor.constraint(equalTo: tableView.topAnchor)
        let leadingConstraint = self.tableHeaderView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor)
        let trailingConstraint = self.tableHeaderView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
        let widthConstraint = self.tableHeaderView.widthAnchor.constraint(equalTo: tableView.widthAnchor)
        self.heightConstraint = self.tableHeaderView.heightAnchor.constraint(equalToConstant: 220)
        let bottomConstraint = self.tableHeaderView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, widthConstraint, heightConstraint, bottomConstraint
        ].compactMap( {$0} ))
    }
    
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func updateHeaderViewHeight(for header: UIView?) {
        guard let header = header else {return}
        header.frame.size.height = header.systemLayoutSizeFitting(CGSize(width: view.bounds.width, height: CGFloat(heightConstraint!.constant))).height

    }
    
    private func fetchPosts(completion:@escaping ([News.Post]) -> Void) {
        if let path = Bundle.main.path(forResource: "news", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let news = try self.jsonDecoder.decode(News.self, from: data)
                print("json data: \(news)")
                completion(news.posts)
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            fatalError("Invalid filename/path.")
        }
    }
}
    
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let post = self.dataSource[indexPath.row]
        let viewModel = PostTableViewCell.ViewModel(author: post.author,
                                                    description: post.description,
                                                    image: post.image,
                                                    likes: post.likes,
                                                    views: post.views)
        cell.setup(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
}

extension ProfileViewController:  ProfileHeaderViewProtocol {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
        self.heightConstraint?.constant = textFieldIsVisible ? 250 : 220
        
        tableView.beginUpdates()
        tableView.reloadSections(IndexSet(0..<1), with: .automatic)
        tableView.endUpdates()
        
        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}
