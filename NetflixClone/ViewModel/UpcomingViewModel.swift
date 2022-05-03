//
//  UpcomingViewModel.swift
//  NetflixClone
//
//  Created by Amanda Detofol on 03/05/22.
//

import Foundation

class UpcomingViewModel {
    
    var movieData: [Result]?
    
    private var api: ApiProtocol
    private var viewController: UpcomingViewController
    
    init(api: ApiProtocol, viewController: UpcomingViewController) {
        self.api = api
        self.viewController = viewController
    }
    
    func fetchUpcoming() {
        ApiCaller().getItems(items: Constants.UPCOMING) { [weak self] data, error in
            if let error = error {
                print(error.localizedDescription)
            }
            self?.movieData = data?.results.sorted{ $0.originalTitle ?? "" > $1.originalTitle ?? "" }
            DispatchQueue.main.async {
                self?.viewController.upcomingTable.reloadData()
            }
        }
    }
    
}
