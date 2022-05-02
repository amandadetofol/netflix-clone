//
//  SearchViewController+UITableViewDataSource.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 02/05/22.
//

import UIKit

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.identifier, for: indexPath) as? UpcomingTableViewCell else { return UITableViewCell() }
        cell.title = self.movieData?[indexPath.row].originalTitle ?? "Unknown"
        cell.posterSinopse = self.movieData?[indexPath.row].overview ?? "This upcoming has no overview"
        cell.poster = self.movieData?[indexPath.row].posterPath ?? ""
        return cell
    }
    
}
