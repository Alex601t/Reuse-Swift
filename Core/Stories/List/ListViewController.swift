import UIKit

open class ListViewController: ReuseViewController, UITableViewDataSource, UITableViewDelegate {
    
    internal var listView: ListView? {
        return view as? ListView
    }
    
    // MARK: UIViewController methods
    
    open override func loadView() {
        view = ListViewImpl()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        assert((listView != nil), "List view can't be nil")

        listView?.tableView.delegate = self;
        listView?.tableView.dataSource = self;
    }
    
    // MARK: UITableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSection()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfRows(in: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let view: ReusableView = reuseView(at: indexPath, sourceView: tableView)
        guard let cell = view as? UITableViewCell else {
            assert(false, "Unsupported view at \(indexPath), view \(view)")
            return UITableViewCell()
        }
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return reuseViewSize(at: indexPath, sourceView: tableView).height
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let reuseCell = cell as? ReusableView else { return }
        reuseViewWillDisplay(view: reuseCell, at: indexPath)
    }
}
