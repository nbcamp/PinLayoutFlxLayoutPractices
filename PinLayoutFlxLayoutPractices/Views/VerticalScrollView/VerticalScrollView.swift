import UIKit

final class VerticalScrollView: UIView, RootView {
    private lazy var scrollView = FlexScrollView().then {
        addSubview($0)
    }

    func initUI() {
        backgroundColor = .systemBackground
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        scrollView.contentView.flex.padding(10).define { flex in
            flex.addItems(count: 10, vGap: 10) { i in
                let view = ExampleRowView()

                view.title = "View \(i)"
                if i % 2 == 0 {
                    view.content = "Random Post Description......\nMultiple Line Test."
                } else {
                    view.content = "Random Post Description......"
                }

                return view
            }
        }

        scrollView.pin.all()
        scrollView.endLayout()
    }
}
