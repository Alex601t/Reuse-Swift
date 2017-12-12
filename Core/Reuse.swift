import UIKit

public typealias CellClass = UIView.Type

public protocol Reuse {
    var dataSource: DataSource { get }
    init(dataSource: DataSource)
}

public protocol ReuseConfiguration {
    func reuseView<T>(at indexPath: IndexPath, sourceView: T) -> ReusableView where T: UIScrollView, T: ReuseRegistration
    func reuseViewSize<T>(at indexPath: IndexPath, sourceView: T) -> CGSize where T: UIScrollView, T: ReuseRegistration
    func reuseViewWillDisplay(view: ReusableView, at indexPath: IndexPath)
}

public protocol ReuseRegistration {
    func register(cellClass: CellClass)
    func register(cellClasses: [CellClass])
    func dequeueReusableView(_ cellClass: CellClass, for indexPath: IndexPath) -> UIView
}

public protocol ReusableView {
    func configure(by item: Any?)
    static func size(for item: Any?, in sourceView: UIScrollView) -> CGSize
}

public protocol ReusableViewFetch {
    func cellClass(by item: Any?) -> CellClass
    func cellClass(by dataSource: DataSource, at indexPath: IndexPath) -> CellClass
}
