import UIKit

private typealias Collection = UICollectionViewDataSource & UICollectionViewDelegate & UICollectionViewDelegateFlowLayout
open class CollectionViewController: ReuseViewController, Collection {
    
    internal var collectionView: GridView? {
        return view as? GridView
    }
    
    // MARK: UIViewController
    
    open override func loadView() {
        view = GridViewImpl()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        assert((collectionView != nil), "Collection view can't be nil")
        
        collectionView?.gridView.dataSource = self
        collectionView?.gridView.delegate = self
    }
    
    // MARK: UICollectionViewDataSource
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.numberOfSection()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numberOfRows(in: section)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view: ReusableView = reuseView(at: indexPath, sourceView: collectionView)
        guard let cell = view as? UICollectionViewCell else {
            assert(false, "Unsupported view at \(indexPath)")
            return UICollectionViewCell()
        }
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let reuseCell = cell as? ReusableView else { return }
        reuseViewWillDisplay(view: reuseCell, at: indexPath)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return reuseViewSize(at: indexPath, sourceView: collectionView)
    }
}
