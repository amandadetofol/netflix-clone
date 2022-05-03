//
//  SearchResultsViewController.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 02/05/22.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    var data: [SearchResult] = []
    
    lazy var searchResultsCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.itemSize = CGSize(width: 100, height: 200)
        collectionViewLayout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.searchResultsCollectionView.frame = self.view.bounds
    }
    
    // MARK: Private methods
    private func setupView(){
        self.view.addSubview(searchResultsCollectionView)
        self.view.backgroundColor = .black
    }
    
}
