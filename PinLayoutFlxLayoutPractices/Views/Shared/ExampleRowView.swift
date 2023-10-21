import UIKit

final class ExampleRowView: UIView {
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }

    var content: String? {
        get { contentLabel.text }
        set { contentLabel.text = newValue }
    }

    private lazy var titleLabel = UILabel().then { label in
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black.withAlphaComponent(0.9)
    }

    private lazy var contentLabel = UILabel().then { label in
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black.withAlphaComponent(0.7)
        label.numberOfLines = 0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.borderWidth = 1.0
        layer.borderColor = UIColor.systemGray2.cgColor
        layer.cornerRadius = 10

        flex.padding(20).define { flex in
            flex.addItem(titleLabel)
            flex.addItem(contentLabel).marginTop(10)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        flex.layout()
    }
}

// #if canImport(SwiftUI) && DEBUG
// import SwiftUI
//
// struct ExampleRowViewPreview: PreviewProvider {
//    static var previews: some View {
//        ExampleRowView().preview
//    }
// }
// #endif
