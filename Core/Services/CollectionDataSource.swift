import Foundation

public protocol DataSource {
    func numberOfSection() -> Int
    func numberOfRows(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> Any?
}
