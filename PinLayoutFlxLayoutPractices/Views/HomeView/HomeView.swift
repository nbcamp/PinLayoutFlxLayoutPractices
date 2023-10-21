import UIKit


final class HomeView: UIView, RootView {
    private lazy var label = UILabel().then {
        $0.text = "Hello, World!"
        $0.sizeToFit()
    }

    func initUI() {
        addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        label.pin.center()
    }
}
