import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case topRated = 4
}

class HomeViewController: UIViewController {
    
    private lazy var homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.separatorStyle = .none
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        let heroHeaderView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 450))
        heroHeaderView.delegate = self
        table.tableHeaderView = heroHeaderView
        return table
    }()
    
    let homeViewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHomeFeedTable()
        self.configureNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.homeFeedTable.frame = view.frame
    }
    
    //MARK: Private methods
    private func setupHomeFeedTable() {
        self.view.backgroundColor = .black
        self.view.addSubview(homeFeedTable)
    }
    
    private func configureNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "house.fill"),
                                                           style: .done,
                                                           target: self,
                                                           action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"),
                            style: .done,
                            target: self,
                            action: nil),
            
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"),
                            style: .done,
                            target: self,
                            action: nil)]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = .black
    }
    
}

extension HomeViewController: HeroHeaderUIViewDelegate {
    func handleLeadingButtonTap() {
        print("One")
    }
    
    func handleTrailingButtonTap() {
        print("Two")
    }
}
