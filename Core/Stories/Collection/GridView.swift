import UIKit

public protocol GridView {
    var gridView: UICollectionView { get }
}

public class GridViewImpl: UIView, GridView {
    private var layout: UICollectionViewLayout = UICollectionViewLayout()
    lazy public var gridView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.layout)
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        gridView.frame = bounds
    }
    
    init() {
        super.init(frame: CGRect.zero)
        addSubview(gridView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
