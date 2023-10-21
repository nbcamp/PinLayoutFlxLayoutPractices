import FlexLayout
import PinLayout
import UIKit

final class FlexScrollView: UIScrollView {
    private(set) var contentView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
        contentInsetAdjustmentBehavior = .always
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func endLayout() {
        contentView.pin.top().horizontally()
        flex.layout()
        contentSize = contentView.frame.size
    }
}
