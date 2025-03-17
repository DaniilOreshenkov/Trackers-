import UIKit

final class TrackerViewController: UIViewController {
    
    private let noContentView = NoContentView(text: R.Text.textNoContent, image: R.ImagesYP.dizzy)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNoContentView()
    }
}

// MARK: - UISearchResultsUpdating
extension TrackerViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

//MARK: - TrackerNavigationControllerDelegate
extension TrackerViewController: TrackerNavigationControllerDelegate {
    func addButtonTapped() {
        let viewController = NewTrackerViewController()
        let navVC = UINavigationController(rootViewController: viewController)
        present(navVC, animated: true)
    }
}

//MARK: - UI
extension TrackerViewController {
    private func setupNoContentView() {
        view.addView(noContentView)
        
        NSLayoutConstraint.activate([
            noContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            noContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            noContentView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            noContentView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
}
