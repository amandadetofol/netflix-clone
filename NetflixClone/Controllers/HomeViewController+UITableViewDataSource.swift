import UIKit


extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.homeViewModel.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
       
        switch indexPath.section {
        
        case Sections.TrendingMovies.rawValue:
            homeViewModel.getTrendingMovies()
            break
            
        case Sections.TrendingTv.rawValue:
            homeViewModel.getTrendingTV()
            break
            
        case Sections.Popular.rawValue:
            homeViewModel.getPopulars()
            break
            
        case Sections.Upcoming.rawValue:
            homeViewModel.getUpcomingMovies()
            break
            
        case Sections.topRated.rawValue:
            homeViewModel.getTopRatedMovies()
            break
        default:
            break
        }
        
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return homeViewModel.sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font  = .boldSystemFont(ofSize: 18)
        header.textLabel?.textColor = .white
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20 , y: header.bounds.origin.y, width: 100, height: header.bounds.height)
    }
    
}
