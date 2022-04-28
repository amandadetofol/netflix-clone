import UIKit

enum CollectionViewHeight: CGFloat {
    case normal = 200
    case header = 40
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CollectionViewHeight.normal.rawValue
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CollectionViewHeight.header.rawValue
    }
    
    // Tratamento para esconder a navigation bar quando realizo o scroll para baixo
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset) )
    }
    
}
