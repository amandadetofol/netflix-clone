import Foundation

struct Constants {
    static let API_KEY: String = "4d32df8357f588e1d75c7308b0eaf4a2"
    static let BASE_URL: String = "http://api.themoviedb.org/"
    static let MOVIES: String = "movies"
    static let ALL: String = "all"
    static let POPULAR: String = "popular"
    static let UPCOMING: String = "upcoming"
    static let TOP_RATED: String = "top-rated"
    static let DISCOVER: String  = "http://api.themoviedb.org/3/discover/movie?api_key=4d32df8357f588e1d75c7308b0eaf4a2&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
}

class ApiCaller {
    
    static let shared = ApiCaller()
    
    func getItems(items: String,  completion:  @escaping(MovieData?, Error?) -> Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/\(items)/day?api_key=\(Constants.API_KEY)" ) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else  { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(MovieData.self, from: data)
                completion(gitData, nil)
            } catch let err {
                print(err.localizedDescription)
                completion(nil, err)
            }
        }.resume()
    }
    
    func getDiscoverMovies(completion:  @escaping(SearchModel?, Error?) -> Void){
        guard let url = URL(string: "\(Constants.DISCOVER)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else  { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(SearchModel.self, from: data)
                completion(gitData, nil)
            } catch let err {
                print(err.localizedDescription)
                completion(nil, err)
            }
        }.resume()
    }
    
    func searchFor(movie: String, completion:  @escaping(SearchModel?, Error?) -> Void) {
        guard let movie = movie.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        guard let url = URL(string: "\(Constants.BASE_URL)3/search/movie?api_key=\(Constants.API_KEY)&query=\(movie)" ) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else  { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(SearchModel.self, from: data)
                completion(gitData, nil)
            } catch let err {
                print(err.localizedDescription)
                completion(nil, err)
            }
        }.resume()
    }
}
