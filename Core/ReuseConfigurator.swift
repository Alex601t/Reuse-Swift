import UIKit

public final class ReuseConfigurator {
    
    // MARK: Interface
    
    public typealias reusableViewFetchHanler = () -> (ReusableViewFetch)
    
    public init(dataSource: DataSource, reusableViewFetchHanler: @escaping reusableViewFetchHanler) {
        self.dataSource = dataSource
        self.reusableViewHandler = reusableViewFetchHanler
    }
    
    // MARK: Private
    
    private let dataSource: DataSource
    private let reusableViewHandler: reusableViewFetchHanler
    private var reusableView: ReusableViewFetch {
        return self.reusableViewHandler()
    }
}

extension ReuseConfigurator: ReuseConfiguration {
    public func reuseView<T>(at indexPath: IndexPath, sourceView: T) -> ReusableView where T: UIScrollView, T: ReuseRegistration {
        let cellClass = reusableView.cellClass(by: dataSource, at: indexPath)
        guard let view = sourceView.dequeueReusableView(cellClass, for: indexPath) as? ReusableView else {
            assert(false, "cell class don't conform ReusableView protocol or don't register in Table/Collection view")
            return UIView() as! ReusableView
        }
        return view
    }
    
    public func reuseViewSize<T>(at indexPath: IndexPath, sourceView: T) -> CGSize where T: UIScrollView, T: ReuseRegistration {
        guard let cell = reusableView.cellClass(by: dataSource, at: indexPath) as? ReusableView.Type else {
            assert(false, "cell class do not conform ReusableView")
            return CGSize.zero
        }
        return cell.size(for: dataSource.item(at: indexPath), in: sourceView)
    }
    
    public func reuseViewWillDisplay(view: ReusableView, at indexPath: IndexPath) {
        view.configure(by: dataSource.item(at: indexPath))
    }
}
