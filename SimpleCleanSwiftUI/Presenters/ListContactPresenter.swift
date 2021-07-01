import Foundation

class ListContactPresenter: ListContactPresenterProtocol {
    private let contactService: ContactService
    weak var observer: ListContactControllerProtocol?
    
    var viewModel: ListContact.ViewModel = .init(contacts: [])
    
    init(service: HasContactService) {
        contactService = service.contactService
    }
    
    func performAction(_ action: ListContact.Action) {
        switch action {
        case .contactedPressed:
            print("pressed")
        case .viewLoaded:
            //load contacts
            let contacts = contactService.allContacts().map(ListContact.ViewModel.Contact.init)
            viewModel = .init(contacts: contacts)
            observer?.performUpdate(.viewModelUpdated)
        }
    }
}

private extension ListContact.ViewModel.Contact {
    init(_ contact: Contact) {
        id = contact.id
        firstName = contact.firstName
        lastName = contact.lastName
        phoneNumber = contact.mobilePhoneNumber
        contacted = false
    }
}
