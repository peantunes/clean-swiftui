import Foundation

enum ListContact {
    enum Action {
        case viewLoaded
        case contactedPressed
    }
    
    enum Update {
        case viewModelUpdated
    }
    
    struct ViewModel {
        struct Contact: Identifiable {
            let id: String
            let firstName: String
            let lastName: String
            let phoneNumber: String
            let contacted: Bool
        }
        
        let contacts: [Contact]
    }
}

protocol ListContactPresenterProtocol {
    var viewModel: ListContact.ViewModel { get }
    func performAction(_ action: ListContact.Action)
}

protocol ListContactControllerProtocol: AnyObject {
    func performUpdate(_ update: ListContact.Update)
}
