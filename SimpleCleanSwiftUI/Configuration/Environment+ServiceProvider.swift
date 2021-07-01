import SwiftUI

private struct ServiceProviderKey: EnvironmentKey {
    static let defaultValue = ServiceProvider.spy
}

extension EnvironmentValues {
    var serviceProvider: ServiceProvider {
        get { self[ServiceProviderKey.self] }
        set { self[ServiceProviderKey.self] = newValue }
    }
}

extension ServiceProvider {
    static var spy: ServiceProvider {
        ServiceProvider(contactService: ContactServiceSpy())
    }
    static var main: ServiceProvider {
        ServiceProvider(contactService: ContactServiceImpl())
    }
}


class ContactServiceSpy: ContactService {
    enum Event {
        case allContacts
    }
    
    var log: [Event] = []
    
    func allContacts() -> [Contact] {
        log.append(.allContacts)
        return []
    }
    
    
}
