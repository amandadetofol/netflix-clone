import UIKit

struct UrlOpen{
    let MOVIE_DB_URL = "https://themoviedb.org"
}

class UpcomingViewController: UIViewController {
    
    var movieData: [Result]?
    
    private lazy var upcomingTable: UITableView = {
        let tableView = UITableView()
        tableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        fetchUpcoming()
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupNavigationController()
        self.setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }

    //Private methods
    private func setupNavigationController(){
        self.title = "Upcoming"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupView() {
        self.view.addSubview(upcomingTable)
    }
    
    private func fetchUpcoming() {
        ApiCaller().getItems(items: Constants.UPCOMING) { [weak self] data, error in
            if let error = error {
                print(error.localizedDescription)
            }
            self?.movieData = data?.results.sorted{ $0.originalTitle ?? "" > $1.originalTitle ?? "" }
            DispatchQueue.main.async {
                self?.upcomingTable.reloadData()
            }
        }
    }
}

