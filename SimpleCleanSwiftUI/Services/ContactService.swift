import Foundation

struct Contact {
    let id: String
    let firstName: String
    let lastName: String
    let mobilePhoneNumber: String
}

protocol ContactService {
    func allContacts() -> [Contact]
}

class ContactServiceImpl: ContactService {
    func allContacts() -> [Contact] {
        [
            .init(id: UUID().uuidString, firstName: "Pedro", lastName: "Antunes", mobilePhoneNumber: "12345"),
            .init(id: UUID().uuidString, firstName: "John", lastName: "Bond", mobilePhoneNumber: "12345"),
            .init(id: UUID().uuidString, firstName: "Marie", lastName: "Pearl", mobilePhoneNumber: "12345"),
            .init(id: UUID().uuidString, firstName: "Anne", lastName: "Luton", mobilePhoneNumber: "12345"),
            .init(id: UUID().uuidString, firstName: "Sara", lastName: "Allen", mobilePhoneNumber: "12345"),
            .init(id: UUID().uuidString, firstName: "Bobby", lastName: "Ryan", mobilePhoneNumber: "12345"),
        ]
    }
}

protocol HasContactService {
    var contactService: ContactService { get }
}
