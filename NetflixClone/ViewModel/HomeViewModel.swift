import Foundation


class HomeViewModel {
    
    let apiCaller: ApiCaller = ApiCaller()
    let sectionTitles: [String] = ["Trending Movies","Popular","Trending TV","Upcoming Movies","Top rated"]

    
    //Retorna filmes com a melhor classificacao
    func getTopRatedMovies() {
        apiCaller.getItems(items: Constants.TOP_RATED) { data, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
           
        }
    }
    
    //Retorna filmes que são lancamento
    func getUpcomingMovies(){
        apiCaller.getItems(items: Constants.UPCOMING) { data, error in
            print(data)
        }
    }
    
    //Retorna os filmes mais populares na TV
    func getTrendingTV(){
        apiCaller.getTrendingTvItems { data, error in
            print(data)
        }
    }
    
    //Retorna os filmes com maior classificacao pelo publico
    func getTrendingMovies(){
        apiCaller.getItems(items: Constants.MOVIES) { data, error in
            print(data)
        }
    }
    
    //Retorna os filmes mais populares
    func getPopulars(){
        apiCaller.getItems(items: Constants.POPULAR) { data, error in
            print(data)
        }
    }
    
    //Retorna todos os filmes
    func getAll(){
        apiCaller.getItems(items: Constants.ALL) { data, error in
            print(data)
        }
    }

    
}
