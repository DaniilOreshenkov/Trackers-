import UIKit

final class TrackerNavigationController: UINavigationController {
    
    private let datePicker: UIDatePicker = { //MARK: DOTO - сделать месяц цифрами
        let datePicker = UIDatePicker()
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    private let searchBar: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.setValue("Отменить", forKey: "cancelButtonText")
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.tintColor = R.ColorYP.blue
        searchController.searchBar.searchTextField.clearButtonMode = .never
        return searchController
    }()
    
    weak var viewController: TrackerNavigationControllerDelegate?
    
    init(rootViewController: TrackerNavigationControllerDelegate) {
        super.init(rootViewController: rootViewController)
        viewController = rootViewController
        setupAppearance()
        actionAddButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAppearance() {
        navigationBar.shadowImage = UIImage()
        navigationBar.backgroundColor = R.ColorYP.whiteDynamic
        navigationBar.tintColor = R.ColorYP.blackDynamic
        navigationBar.isTranslucent = false
        navigationBar.prefersLargeTitles = true
        
        viewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: datePicker)
        viewController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.ImagesYP.addIcon , style: .done, target: self, action: #selector(actionAddButton))
        
        searchBar.searchResultsUpdater = viewController
        viewController?.navigationItem.searchController = searchBar
        
        viewController?.navigationItem.hidesSearchBarWhenScrolling = false
        viewController?.navigationItem.largeTitleDisplayMode = .always
        viewController?.navigationItem.title = "Трекеры"
    }
    
    @objc private func actionAddButton() {
        viewController?.addButtonTapped()
    }
}
