import UIKit

protocol RootView: UIView {
    func initUI()
}

extension RootView where Self: EventEmitter {
    func emit(event: EventType) {
        if let vc = viewController as? Self.EventType.ControllerType {
            event.execute(on: vc)
        }
    }
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
