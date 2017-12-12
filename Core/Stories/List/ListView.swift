import UIKit

public protocol ListView {
    var tableView: UITableView { get }
}

public class ListViewImpl : UIView, ListView {
    public var tableView = UITableView(frame: CGRect.zero, style: .plain)
    
    // MARK: UIView
    
    init() {
        super.init(frame: CGRect.zero)
        addSubview(tableView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.frame = bounds
    }
}
