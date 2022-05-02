//
//  SearchResultsViewController+UICollectionViewDataSource.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 02/05/22.
//

import UIKit

extension SearchResultsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: data[indexPath.row].posterPath)
        return cell
    }
    
    
}
