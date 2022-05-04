import UIKit


extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        switch indexPath.section {
        
        case Sections.TrendingMovies.rawValue:
            viewModel.getMovies()
            guard let movies = viewModel.movies else { return UITableViewCell() }
            cell.configure(with: movies)
            break
            
        case Sections.Popular.rawValue:
            viewModel.getMovies()
            guard let movies = viewModel.movies else { return UITableViewCell() }
            cell.configure(with: movies)
            break
            
        case Sections.Upcoming.rawValue:
            viewModel.getUpcoming()
            guard let movies = viewModel.upcoming else { return UITableViewCell() }
            cell.configure(with: movies)
            break
            
        case Sections.topRated.rawValue:
            viewModel.getTopRated()
            guard let movies = viewModel.topRated else { return UITableViewCell() }
            cell.configure(with: movies)
            break
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font  = .boldSystemFont(ofSize: 18)
        header.textLabel?.textColor = .white
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20 , y: header.bounds.origin.y, width: 100, height: header.bounds.height)
    }
    
}

extension HomeViewController: CollectionViewTableViewCellDelegate {
    
    func handlePosterTap(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel) {
        DispatchQueue.main.async {
            let titlePreviewController = TitlePreviewViewController()
            titlePreviewController.configure(title: viewModel)
            self.navigationController?.pushViewController(titlePreviewController, animated: true)
        }
        
    }
    
}
