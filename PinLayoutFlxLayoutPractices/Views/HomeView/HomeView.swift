import UIKit

final class HomeView: UIView, RootView {
    var practices: [Practice] = [] {
        didSet { drawScrollViewContent() }
    }

    private lazy var scrollView = FlexScrollView().then {
        addSubview($0)
    }

    func initUI() {
        backgroundColor = .systemBackground
        drawScrollViewContent()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        scrollView.pin.all(pin.safeArea)
        scrollView.endLayout()
    }
    
    private func drawScrollViewContent() {
        scrollView.contentView.removeAllSubviews()
        scrollView.contentView.flex.padding(10).define { [unowned self] flex in
            flex.addItems(count: practices.count, vGap: 10) { i in
                let view = ExampleRowView()
                let practice = practices[i]
                view.title = practice.title
                view.content = practice.content

                let tapGesture = ContextTapGestureRecognizer(target: self, action: #selector(scrollViewCellTapped))
                tapGesture.context["practice"] = practice
                view.isUserInteractionEnabled = true
                view.addGestureRecognizer(tapGesture)

                return view
            }
        }
        setNeedsLayout()
    }

    @objc private func scrollViewCellTapped(recognizer: ContextTapGestureRecognizer) {
        guard let practice = recognizer.context["practice"] as? Practice else { return }

        emit(event: .practiceCellTapped(practice))
    }
}

extension HomeView: EventEmitter {
    enum Event: EventProtocol {
        case practiceCellTapped(Practice)
    }
}
