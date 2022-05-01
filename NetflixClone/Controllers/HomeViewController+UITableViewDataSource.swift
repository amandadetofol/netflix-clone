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
            homeViewModel.apiCaller.getItems(items: Constants.MOVIES) { data, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let data = data?.results else { return }
                cell.configure(with: data)
            }
            break
            
        case Sections.Popular.rawValue:
            homeViewModel.apiCaller.getItems(items: Constants.MOVIES) { data, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let data = data?.results else { return }
                cell.configure(with: data)
            }
            break
            
        case Sections.Upcoming.rawValue:
            homeViewModel.apiCaller.getItems(items: Constants.UPCOMING) { data, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let data = data?.results else { return }
                cell.configure(with: data)
            }
            break
            
        case Sections.topRated.rawValue:
            homeViewModel.apiCaller.getItems(items: Constants.TOP_RATED) { data, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let data = data?.results else { return }
                cell.configure(with: data)
            }
            
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
