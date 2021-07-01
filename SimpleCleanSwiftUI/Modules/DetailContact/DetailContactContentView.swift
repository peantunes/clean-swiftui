import SwiftUI

struct DetailContactContentView: View {
    let contact: ListContact.ViewModel.Contact
    
    var body: some View {
        VStack {
            Text(contact.firstName)
            Text(contact.lastName)
            Text(contact.phoneNumber)
        }
    }
}

struct DetailContactContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailContactContentView(contact: .init(id: "123", firstName: "Pedro", lastName: "Antunes", phoneNumber: "999399393", contacted: false))
    }
}
