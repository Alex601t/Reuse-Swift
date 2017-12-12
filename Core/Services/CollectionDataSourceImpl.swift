import Foundation

open class CollectionDataSourceImpl : DataSource {
    
    // MARK: - CollectionDataSource
    
    public lazy var items = [Any]()
    
    public func numberOfSection() -> Int {
        return 1
    }
    
    public func numberOfRows(in section: Int) -> Int {
        return items.count
    }
    
    public func item(at indexPath: IndexPath) -> Any? {
        return items.element(at: indexPath.row)
    }
}
