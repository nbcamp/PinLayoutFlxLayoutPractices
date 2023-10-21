import UIKit

protocol EventListener {
    associatedtype ControllerType: UIViewController

    func execute(on controller: ControllerType)
}

protocol EventEmitter {
    associatedtype EventType: EventListener

    func emit(event: EventType)
}
