import Foundation

class ServiceProvider {
    let contactService: ContactService
    init(contactService: ContactService) {
        self.contactService = contactService
    }
}

extension ServiceProvider: HasContactService { }
