import UIKit

class SearchViewController: UIViewController {

    var movieData: [SearchResult]?
    
     lazy var searchResults: UITableView = {
        let tableView = UITableView()
        tableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private let searchBarController: UISearchController = {
        let searchBarController = UISearchController(searchResultsController: SearchResultsViewController())
        searchBarController.searchBar.placeholder = "Search for a movie or a TVShow"
        searchBarController.searchBar.searchBarStyle = .minimal
        return searchBarController
    }()

    override func viewDidLoad() {
        getDiscoverMovies()
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupNavigationController()
        self.setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.searchResults.frame = self.view.bounds
    }
    
    //MARK: Private methods
    private func setupNavigationController(){
        self.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.searchController = searchBarController
        self.searchBarController.searchResultsUpdater = self
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupView() {
        self.view.addSubview(searchResults)
    }
    
    private func getDiscoverMovies(){
        ApiCaller().getDiscoverMovies { data, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            self.movieData = data?.results
            DispatchQueue.main.async {
                self.searchResults.reloadData()
            }
        }
    }
    
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3,
        let resultsController = searchController.searchResultsController as? SearchResultsViewController else {
            return
        }
        
        ApiCaller().searchFor(movie: query) { result, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                guard let result = result else {
                    return
                }
                resultsController.data = result.results
                resultsController.searchResultsCollectionView.reloadData()
            }
            
        }
        
    }
    
}
