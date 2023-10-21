import FlexLayout
import PinLayout
import Then
import UIKit

struct Practice {
    let title: String
    let content: String
    let viewController: UIViewController.Type
}

final class HomeViewController: RootViewController<HomeView> {
    private let practices: [Practice] = [
        .init(
            title: "Vertical ScrollView",
            content: "수직 스크롤에 대해 테스트합니다.",
            viewController: VerticalScrollViewController.self
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.practices = practices
    }
}

enum HomeViewControllerEvent: EventListener {
    case moveToSomePractice(Practice)
    case another(() -> Void)

    func execute(on controller: HomeViewController) {
        switch self {
        case .moveToSomePractice(let practice):
            let vc = practice.viewController.init()
            vc.title = practice.title
            controller.navigationController?.pushViewController(vc, animated: true)
        case .another(let handler):
            print("another")
            handler()
        }
    }
}

#if DEBUG
import SwiftUI

struct HomeViewControllerPreview: PreviewProvider {
    static var previews: some View {
        HomeViewController().preview()
    }
}
#endif
