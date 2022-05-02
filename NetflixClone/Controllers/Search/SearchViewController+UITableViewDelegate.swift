//
//  SearchViewController+UITableViewDelegate.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 02/05/22.
//

import UIKit

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}
