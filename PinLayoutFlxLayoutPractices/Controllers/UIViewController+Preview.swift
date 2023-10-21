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

// [사용법]
// 아래 코드를 복사한 뒤 미리 보고 싶은 UIViewController가 있는 파일에 배치합니다.
// [UIViewController] 부분을 보고 싶은 UIViewController 타입 이름으로 변경합니다.

//#if DEBUG
//import SwiftUI
//
//struct [UIViewController]Preview: PreviewProvider {
//    static var previews: some View {
//        [UIViewController]().preview()
//    }
//}
//#endif

#endif
