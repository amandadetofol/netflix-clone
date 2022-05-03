import UIKit

struct UrlOpen{
    let MOVIE_DB_URL = "https://themoviedb.org"
}

class UpcomingViewController: UIViewController {
    
    lazy var viewModel: UpcomingViewModel = UpcomingViewModel(api: ApiCaller(), viewController: self)
    
    lazy var upcomingTable: UITableView = {
        let tableView = UITableView()
        tableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        viewModel.fetchUpcoming()
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
    
}

