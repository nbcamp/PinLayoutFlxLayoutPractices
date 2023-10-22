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
        ),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "테스트 목록"
        rootView.practices = practices
    }
}

extension HomeViewController: EventListener {
    func handle(event: HomeView.Event) {
        switch event {
        case .practiceCellTapped(let practice):
            let vc = practice.viewController.init()
            vc.title = practice.title
            navigationController?.pushViewController(vc, animated: true)
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
