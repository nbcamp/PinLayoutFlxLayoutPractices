import UIKit

class RootViewController<View: RootView>: UIViewController {
    var rootView: View { view as! View }

    override func loadView() {
        view = View()
        rootView.viewController = self
        rootView.initUI()
    }
}
