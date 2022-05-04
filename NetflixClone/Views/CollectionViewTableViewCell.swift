import UIKit

protocol CollectionViewTableViewCellDelegate {
    func handlePosterTap(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel)
}

class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    private var movieData: [Result] = []
   
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.itemSize = CGSize(width: 150, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    var delegate: CollectionViewTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupContentView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public funcs
    public func configure(with movieData: [Result]){
        self.movieData = movieData
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    //MARK: Private funcs
    private func setupContentView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        self.contentView.backgroundColor = .systemBackground
        contentView.addSubview(collectionView)
    }
    
}

extension CollectionViewTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else { return  UICollectionViewCell() }
        cell.configure(with: movieData[indexPath.row].posterPath ?? "placeholder")
        return cell
    }
    
}

extension CollectionViewTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let titleName = movieData[indexPath.row].originalTitle ?? "Ops! Something wrong occurred!"
        
        ApiCaller.shared.getTrailerFor(movie: titleName) { result, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            self.delegate?.handlePosterTap(self, viewModel: TitlePreviewViewModel(title: titleName,
                                                                             videoId: result?.items[0].id.videoID ?? "qN4ooNx77u0"))
        }
    }
}
