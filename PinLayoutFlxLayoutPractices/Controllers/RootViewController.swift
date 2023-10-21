import FlexLayout
import PinLayout
import Then
import UIKit

final class RootViewController: UIViewController {
    private lazy var label = UILabel().then {
        $0.text = "Hello, World!"
        $0.sizeToFit()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        view.addSubview(label)
        label.pin.center()
    }
}
