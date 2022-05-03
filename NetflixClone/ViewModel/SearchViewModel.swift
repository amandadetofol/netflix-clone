//
//  SearchViewModel.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 03/05/22.
//

import Foundation

class SearchViewModel {
    
    var movieData: [SearchResult]?
    
    private var api: ApiProtocol
    private var viewController: SearchViewController
    
    init(api: ApiProtocol, viewController: SearchViewController) {
        self.api = api
        self.viewController = viewController
    }
    
    func getDiscoverMovies() {
        ApiCaller().getDiscoverMovies { data, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            self.movieData = data?.results
            DispatchQueue.main.async {
                self.viewController.searchResults.reloadData()
            }
        }
    }
    
    func searchForMovie(movie: String, resultsController: SearchResultsViewController) {
        ApiCaller().searchFor(movie: movie) { result, error in
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
