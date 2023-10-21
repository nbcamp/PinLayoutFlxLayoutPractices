import FlexLayout
import PinLayout
import Then
import UIKit

final class HomeViewController: RootViewController<HomeView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        print(#function)
    }
}
