import UIKit

final class HomeView: UIView, RootView, EventEmitter {
    typealias EventType = HomeViewControllerEvent

    var practices: [Practice] = []

    private lazy var scrollView = FlexScrollView().then {
        addSubview($0)
    }

    func initUI() {
        backgroundColor = .systemBackground
    }

    override func layoutSubviews() {
        super.layoutSubviews()

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

        scrollView.pin.all()
        scrollView.endLayout()
    }

    @objc private func scrollViewCellTapped(recognizer: ContextTapGestureRecognizer) {
        guard let practice = recognizer.context["practice"] as? Practice else { return }

        emit(event: .moveToSomePractice(practice))
        emit(event: .another {
            print("Wow")
        })
    }
}
