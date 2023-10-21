import FlexLayout
import PinLayout
import Then
import UIKit

final class HomeViewController: RootViewController<HomeView> {

}

#if DEBUG
import SwiftUI

struct HomeViewControllerPreview: PreviewProvider {
    static var previews: some View {
        HomeViewController().preview()
    }
}
#endif
