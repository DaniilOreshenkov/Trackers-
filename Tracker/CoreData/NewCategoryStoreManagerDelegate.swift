import Foundation

//protocol NewCategoryStoreManagerDelegate: AnyObject {
////    func removeStubAndShowCategories(indexPath: IndexPath)
////    func startUpdate()
//}

protocol NewCategoryStoreManagerDelegate: AnyObject {
    func insert(_ category: TrackerCategory, at indexPath: IndexPath)
}
