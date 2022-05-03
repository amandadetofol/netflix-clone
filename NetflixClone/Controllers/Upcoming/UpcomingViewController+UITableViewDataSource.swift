//
//  UpcomingViewController+UITableViewDataSource.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 02/05/22.
//

import UIKit

extension UpcomingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.identifier, for: indexPath) as? UpcomingTableViewCell else { return UITableViewCell() }
        cell.delegate = self 
        cell.title = viewModel.movieData?[indexPath.row].originalTitle ?? "Unknown"
        cell.posterSinopse = viewModel.movieData?[indexPath.row].overview ?? "This upcoming has no overview"
        cell.poster = viewModel.movieData?[indexPath.row].posterPath ?? ""
        return cell
    }
    
}

extension UpcomingViewController: UpcomingTableViewCellDelegate {
    
    func handlePlayButtonTap() {
        guard let url = URL(string: UrlOpen().MOVIE_DB_URL) else { return }
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
    
}
