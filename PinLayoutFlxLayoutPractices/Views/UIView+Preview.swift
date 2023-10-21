#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIView {
    struct UIViewPreview<View: UIView>: UIViewRepresentable {
        let view: View

        func makeUIView(context: Context) -> UIView { view }

        func updateUIView(_ view: UIView, context: Context) {}
    }

    var preview: some View { UIViewPreview(view: self) }
}

// [사용법]
// 아래 코드를 복사한 뒤 미리 보고 싶은 UIView가 있는 파일에 배치합니다.
// [UIView] 부분을 보고 싶은 UIView 타입 이름으로 변경합니다.

// #if canImport(SwiftUI) && DEBUG
// import SwiftUI
//
// struct [UIView]Preview: PreviewProvider {
//    static var previews: some View {
//        [UIView]().preview
//    }
// }
// #endif

#endif
