import UIKit

protocol RootView: UIView {
    func initUI()
}

private enum AssociatedKeys {
    static var viewControllerKey = "ViewControllerKey"
}

extension RootView {
    var viewController: UIViewController? {
        get {
            withUnsafePointer(to: &AssociatedKeys.viewControllerKey) { pointer in
                objc_getAssociatedObject(self, pointer) as? UIViewController
            }
        }
        set {
            withUnsafePointer(to: &AssociatedKeys.viewControllerKey) { pointer in
                objc_setAssociatedObject(self, pointer, newValue, .OBJC_ASSOCIATION_ASSIGN)
            }
        }
    }
}

extension RootView where Self: EventEmitter {
    func emit(event: Event) {
        if let viewController = viewController as? AnyEventListener {
            viewController.handle(event)
        }
    }
}
