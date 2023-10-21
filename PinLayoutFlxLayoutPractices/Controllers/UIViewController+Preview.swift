#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIViewController {
    private struct Preview<ViewController: UIViewController>: UIViewControllerRepresentable {
        let viewController: ViewController

        func makeUIViewController(context: Context) -> UIViewController { viewController }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }

    func preview() -> some View {
        Preview(viewController: self)
    }
}

#endif
