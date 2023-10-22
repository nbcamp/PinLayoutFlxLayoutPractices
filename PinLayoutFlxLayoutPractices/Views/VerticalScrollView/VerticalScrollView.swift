import UIKit

final class VerticalScrollView: UIView, RootView {
    private var counts = [3, 10, 100]
    private var countIndex = 1 {
        didSet { drawScrollViewContent() }
    }

    private lazy var segmentControl = UISegmentedControl(items: ["3", "10", "100"]).then {
        $0.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
        $0.selectedSegmentIndex = countIndex
        addSubview($0)
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

        segmentControl.pin.top(pin.safeArea).horizontally(10)
        scrollView.pin.below(of: segmentControl).bottom().horizontally()
        scrollView.endLayout()
    }

    private func drawScrollViewContent() {
        let count = counts[countIndex % counts.count]
        scrollView.contentView.removeAllSubviews()
        scrollView.contentView.flex.padding(10).define { flex in
            flex.addItems(count: count, vGap: 10) { i in
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
        setNeedsLayout()
    }

    @objc private func scrollViewCellTapped(recognizer: ContextTapGestureRecognizer) {
        guard let index = recognizer.context["index"] as? Int else { return }
        emit(event: .tapped(index))
    }

    @objc private func segmentValueChanged(segment: UISegmentedControl) {
        countIndex = segment.selectedSegmentIndex
    }
}

extension VerticalScrollView: EventEmitter {
    enum Event: EventProtocol {
        case tapped(Int)
    }
}
