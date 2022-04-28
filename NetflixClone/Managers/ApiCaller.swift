import Foundation

struct Constants {
    static let API_KEY: String = "4d32df8357f588e1d75c7308b0eaf4a2"
    static let BASE_URL: String = "http://api.themoviedb.org/"
    static let MOVIES: String = "movies"
    static let ALL: String = "all"
    static let TV_TRENDING: String = "tv"
    static let POPULAR: String = "popular"
    static let UPCOMING: String = "upcoming"
    static let TOP_RATED: String = "top-rated"
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
    
    func getTrendingTvItems(completion:  @escaping(TrendinggTv?, Error?) -> Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/\(Constants.TV_TRENDING)/day?api_key=\(Constants.API_KEY)" ) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else  { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(TrendinggTv.self, from: data)
                completion(gitData, nil)
            } catch let err {
                print(err.localizedDescription)
                completion(nil, err)
            }
        }.resume()
    }
    
}
