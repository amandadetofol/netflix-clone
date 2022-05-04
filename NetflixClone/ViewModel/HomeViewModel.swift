import Foundation


class HomeViewModel {
    
    var movies: [Result]?
    var upcoming: [Result]?
    var topRated: [Result]?
    
    let sectionTitles: [String] = ["Trending Movies","Popular","Upcoming Movies","Top rated"]
    
    var api: ApiProtocol
    private var viewController: HomeViewController
   
    
    init(api: ApiProtocol, viewController: HomeViewController) {
        self.api = api
        self.viewController = viewController
    }
    
    func getMovies() {
        self.api.getItems(items: Constants.MOVIES) { data, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data?.results else { return }
            self.movies = data
        }
    }
    
    func getUpcoming(){
        self.api.getItems(items: Constants.UPCOMING) { data, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data?.results else { return }
            self.upcoming = data
        }
    }
    
    func getTopRated(){
        self.api.getItems(items: Constants.TOP_RATED) { data, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data?.results else { return }
            self.topRated = data
        }
    }
    
    
}
