//
//  UpcomingTableViewCell.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 01/05/22.
//

import UIKit
import SDWebImage

protocol UpcomingTableViewCellDelegate {
    func handlePlayButtonTap()
}

class UpcomingTableViewCell: UITableViewCell {
    
    private let titlePosterUIImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Play  ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleLeadingButtonTap), for: .touchUpInside)
        return button
    }()
    
    private let titlePosterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionPosterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var title: String = "" {
        didSet {
            self.titlePosterLabel.text = self.title
        }
    }
    
    lazy var posterSinopse: String = "" {
        didSet {
            self.descriptionPosterLabel.text = self.posterSinopse
        }
    }
    
    lazy var poster: String = ""{
        didSet {
            guard let url = URL(string: "http://image.tmdb.org/t/p/w500/\(self.poster)") else { return }
            self.titlePosterUIImageView.sd_setImage(with: url,
                                                    placeholderImage: UIImage(named: "placeholder"))
        }
    }
    
    
    var delegate: UpcomingTableViewCellDelegate?
    static let identifier = "UpcomingTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private methods
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titlePosterUIImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 88),
            titlePosterUIImageView.heightAnchor.constraint(equalToConstant: 150),
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 100),
           
            titlePosterLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            titlePosterLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor, constant: 16),
            titlePosterLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 128),
            titlePosterLabel.heightAnchor.constraint(equalToConstant: 68),
            
            descriptionPosterLabel.topAnchor.constraint(equalTo: titlePosterLabel.bottomAnchor, constant: 16),
            descriptionPosterLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor, constant: 16),
            descriptionPosterLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 128),
            descriptionPosterLabel.heightAnchor.constraint(equalToConstant: 150),
            
            playButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            playButton.heightAnchor.constraint(equalToConstant: 38)
        ])
        
    }
    
    private func setupView() {
        self.contentView.addSubview(titlePosterUIImageView)
        self.contentView.addSubview(titlePosterLabel)
        self.contentView.addSubview(descriptionPosterLabel)
        self.contentView.addSubview(playButton)
    }
}

extension UpcomingTableViewCell {
    
    @objc func handleLeadingButtonTap() {
        self.delegate?.handlePlayButtonTap()
    }
    
}
