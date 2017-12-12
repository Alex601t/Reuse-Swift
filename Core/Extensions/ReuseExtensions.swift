import UIKit

extension UITableView : ReuseRegistration {
    public final func register(cellClass: CellClass) {
        register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
    public final func register(cellClasses: [CellClass]) {
        cellClasses.forEach {
            register(cellClass: $0)
        }
    }
    public final func dequeueReusableView(_ cellClass: CellClass, for indexPath: IndexPath) -> UIView {
        return dequeueReusableCell(withIdentifier: String(describing: cellClass), for: indexPath)
    }
}

extension UICollectionView : ReuseRegistration {
    public final func register(cellClass: CellClass) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }
    public final func register(cellClasses: [CellClass]) {
        cellClasses.forEach {
            register(cellClass: $0)
        }
    }
    public final func dequeueReusableView(_ cellClass: CellClass, for indexPath: IndexPath) -> UIView {
        return dequeueReusableCell(withReuseIdentifier: String(describing: cellClass), for: indexPath)
    }
}
