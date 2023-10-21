#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIView {
    struct UIViewPreview<View: UIView>: UIViewRepresentable {
        let view: View

        func makeUIView(context: Context) -> UIView { view }

        func updateUIView(_ view: UIView, context: Context) {
//            view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//            view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
    }

    var preview: some View { UIViewPreview(view: self) }
}

#endif
