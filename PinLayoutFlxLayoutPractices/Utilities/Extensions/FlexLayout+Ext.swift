import FlexLayout
import UIKit

extension Flex {
    func addItems<View: UIView>(
        count: Int,
        gap: CGFloat? = nil,
        vGap: CGFloat? = nil,
        hGap: CGFloat? = nil,
        _ builder: (_ index: Int) -> View
    ) {
        let _vGap = gap ?? vGap
        let _hGap = gap ?? hGap

        for i in 0 ..< count {
            addItem(builder(i))
            if i != count {
                if let _vGap { addItem().height(_vGap) }
                if let _hGap { addItem().width(_hGap) }
            }
        }
    }
}
