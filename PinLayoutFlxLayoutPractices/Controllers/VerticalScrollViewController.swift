import FlexLayout
import PinLayout
import Then
import UIKit

final class VerticalScrollViewController: RootViewController<VerticalScrollView> {}

extension VerticalScrollViewController: EventListener {
    func handle(event: VerticalScrollView.Event) {
        switch event {
        case .tapped(let index):
            print("\(index) Tapped")
        }
    }
}
