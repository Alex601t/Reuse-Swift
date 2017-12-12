import UIKit

open class ReuseViewController: UIViewController, Reuse, ReusableViewFetch {

    // MARK: Private
    
    private lazy var configurator: ReuseConfigurator = ReuseConfigurator(dataSource: self.dataSource) { [unowned self] () -> (ReusableViewFetch) in
        return self
    }
    
    // MARK: Reuse
    
    public let dataSource: DataSource

    public required init(dataSource: DataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: ReusableViewFetch
    
    public func cellClass(by item: Any?) -> CellClass {
        assert(false, "Implement me: cellClass(byItem:)")
        return UITableViewCell.self
    }
    
    public func cellClass(by dataSource: DataSource, at indexPath: IndexPath) -> CellClass {
        return cellClass(by: dataSource.item(at: indexPath))
    }
    
    // MARK: UIViewController
    
    public required init?(coder aDecoder: NSCoder) {
        assert(false, "Reuse can't be use in view controllers from storyboard")
        return nil
    }
}

extension ReuseViewController: ReuseConfiguration {
    public func reuseView<T>(at: IndexPath, sourceView: T) -> ReusableView where T: UIScrollView, T: ReuseRegistration {
        return configurator.reuseView(at: at, sourceView: sourceView)
    }
    
    public func reuseViewSize<T>(at: IndexPath, sourceView: T) -> CGSize where T: UIScrollView, T: ReuseRegistration {
        return configurator.reuseViewSize(at: at, sourceView: sourceView)
    }
    
    public func reuseViewWillDisplay(view: ReusableView, at: IndexPath) {
        configurator.reuseViewWillDisplay(view: view, at: at)
    }
}
