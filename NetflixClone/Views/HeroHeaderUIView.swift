import UIKit

protocol HeroHeaderUIViewDelegate {
    func handleLeadingButtonTap()
    func handleTrailingButtonTap()
}

class HeroHeaderUIView: UIView {

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemCyan
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
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
        button.addTarget(self, action: #selector(handleTrailingButtonTap), for: .touchUpInside)
        return button
    }()
    
    var delegate: HeroHeaderUIViewDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.buildView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Private methods
    private func buildView(){
        self.addSubview(imageView)
        self.imageView.addSubview(playButton)
        self.imageView.addSubview(downloadButton)
        self.setupConstraints()
    }
    
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            playButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 90),
            playButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100),
            
            downloadButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -80),
            downloadButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}

extension HeroHeaderUIView {
    
    @objc func handleLeadingButtonTap() {
        self.delegate?.handleLeadingButtonTap()
    }
    
    @objc func handleTrailingButtonTap(){
        self.delegate?.handleTrailingButtonTap()
    }
}
