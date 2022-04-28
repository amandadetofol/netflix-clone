
import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    private let posterImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    static let identifier: String = "TitleCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: String) {
        guard let url = URL(string: model) else { return }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
    
}
