import UIKit

class SearchViewController: UIViewController {

    var movieData: [Result]?
    
    private lazy var searchResults: UITableView = {
        let tableView = UITableView()
        tableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
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

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}
