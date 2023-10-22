protocol EventProtocol {}

protocol AnyEventListener {
    func handle(_ event: Any)
}

protocol EventListener: AnyEventListener {
    associatedtype Event: EventProtocol

    func handle(event: Event)
}

extension EventListener {
    func handle(_ event: Any) {
        if let event = event as? Event {
            handle(event: event)
        }
    }
}

protocol AnyEventEmitter {
    func emit(_ event: Any)
}

protocol EventEmitter: AnyEventEmitter {
    associatedtype Event: EventProtocol

    func emit(event: Event)
}

extension EventEmitter {
    func emit(_ event: Any) {
        if let event = event as? Event {
            emit(event: event)
        }
    }
}
