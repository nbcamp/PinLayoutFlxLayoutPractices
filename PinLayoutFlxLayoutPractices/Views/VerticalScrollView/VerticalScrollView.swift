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
                
                let tapGesture = ContextTapGestureRecognizer(target: self, action: #selector(scrollViewCellTapped))
                tapGesture.context["index"] = i
                view.isUserInteractionEnabled = true
                view.addGestureRecognizer(tapGesture)

                return view
            }
        }

        scrollView.pin.all()
        scrollView.endLayout()
    }
    
    @objc private func scrollViewCellTapped(recognizer: ContextTapGestureRecognizer) {
        guard let index = recognizer.context["index"] as? Int else { return }
        emit(event: .tapped(index))
    }
}

extension VerticalScrollView: EventEmitter {
    enum Event: EventProtocol {
        case tapped(Int)
    }
}
