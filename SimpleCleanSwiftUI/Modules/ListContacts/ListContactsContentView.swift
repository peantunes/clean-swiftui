import SwiftUI

struct ListContactsContentView: View {
    @EnvironmentObject var listContacts: ListContactsContentView.ObservableContent
    
    var body: some View {
        List(listContacts.viewModel.contacts) { contact in
            NavigationLink(
                destination: DetailContactContentView(contact: contact)) {
                Text(contact.firstName) + Text(" ") + Text(contact.lastName)
            }
        }
        .onAppear {
            listContacts.viewLoaded()
        }
    }
}

extension ListContactsContentView {
    class ObservableContent: ObservableObject, ListContactControllerProtocol {
        private let presenter: ListContactPresenterProtocol
        
        init(presenter: ListContactPresenterProtocol) {
            self.presenter = presenter
        }
        
        var viewModel: ListContact.ViewModel {
            presenter.viewModel
        }
        
        func viewLoaded() {
            presenter.performAction(.viewLoaded)
        }
        
        func performUpdate(_ update: ListContact.Update) {
            switch update {
            case .viewModelUpdated:
                objectWillChange.send()
            }
        }
    }
}

struct ListContactsContentView_Previews: PreviewProvider {
    private class SimpleContactService: HasContactService {
        var contactService: ContactService
        init() {
            contactService = ContactServiceImpl()
        }
    }
    
    static var previews: some View {
        ListContactsContentView()
            .environmentObject(ScreenBuilder.listContactContentView(interactor: SimpleContactService()))
    }
}
