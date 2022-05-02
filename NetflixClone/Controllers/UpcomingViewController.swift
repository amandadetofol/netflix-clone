import UIKit

class UpcomingViewController: UIViewController {
    
    var movieData: [Result]?
    
    private lazy var upcomingTable: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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

extension UpcomingViewController: UITableViewDelegate {
    
}

extension UpcomingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movieData?[indexPath.row].originalTitle ?? "Unknown"
        return cell 
    }
    
}
