//
//  SearchResultsViewController+UICollectionViewDelegate.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 02/05/22.
//

import UIKit

extension SearchResultsViewController: UICollectionViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CollectionViewHeight.normal.rawValue
    }
    
}

