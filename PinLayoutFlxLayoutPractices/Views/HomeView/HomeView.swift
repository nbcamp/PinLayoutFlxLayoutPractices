import UIKit

final class HomeView: UIView, RootView {
    private lazy var scrollView = FlexScrollView()

    func initUI() {
        backgroundColor = .systemBackground
        addSubview(scrollView)
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
