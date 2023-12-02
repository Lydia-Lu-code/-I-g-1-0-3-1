import UIKit

class SearchVideoCollectionViewCell: UICollectionViewCell {
    
    let idebtifier = "SearchVideoCollectionViewCell"
    
    // titleLabel 也是測試用的，用於顯示 CollectionView 是否有置入資料
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        
        // 設定了一個 titleLabel 與其所在 contentView 之間的約束條件。
        // titleLabel 的上、左、右、下四個邊緣分別與 contentView 的上、左、右、下四個邊緣一致，確保 titleLabel 完全填滿 contentView。
        // 設定這些約束確保 titleLabel 被拉伸以填滿其所在的 contentView，並與 contentView 的邊緣對齊。
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
    
    // required 的初始化方法，用於從 NSCoder（通常是用於從 nib 或 storyboard 加載對象時）初始化一個對象。
    // 子類重寫了父類的指定初始化方法（designated initializer），必須實現相對應的 required init?(coder: NSCoder) 方法，以便支持解碼（decoding）過程。
    // 當你的對象需要從 nib 或 storyboard 中載入時，系統會使用 NSCoder 來解碼該對象。
    // 實現 required init?(coder: NSCoder) 方法。在這個方法中，應該呼叫父類的相應方法 super.init(coder: coder)，以保證所有的繼承鏈都有機會進行正確的解碼。
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
