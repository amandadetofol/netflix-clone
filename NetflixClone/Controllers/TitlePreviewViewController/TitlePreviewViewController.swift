//
//  TitlePreviewViewController.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 04/05/22.
//

import UIKit
import WebKit


class TitlePreviewViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.text = "Harry Potter and The Chamber of Secrets"
        return label
    }()
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Download  ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
       //button.addTarget(self, action: #selector(handleLeadingButtonTap), for: .touchUpInside)
        return button
    }()
    
    var mvTitle: String = "" {
        didSet {
            self.titleLabel.text = self.mvTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
    }
    
    //Private methods
    private func setupView() {
        self.view.backgroundColor = .black
        self.view.addSubview(titleLabel)
        self.view.addSubview(webView)
        self.view.addSubview(downloadButton)
        
    }
    
    func configure(title: TitlePreviewViewModel) {
        DispatchQueue.main.async {
            self.titleLabel.text = title.title
            guard let url = URL(string: "https://www.youtube.com/embed/\(title.videoId)") else { return }
            self.webView.load(URLRequest(url: url))
        }
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            self.webView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.webView.heightAnchor.constraint(equalToConstant: self.view.bounds.width),
            self.webView.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 32),
            
            self.downloadButton.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 32),
            self.downloadButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.downloadButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.downloadButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
}
