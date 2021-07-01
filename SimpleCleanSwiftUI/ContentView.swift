import SwiftUI

struct ContentView: View {
    @Environment(\.serviceProvider) var serviceProvider
    
    var body: some View {
        NavigationView {
            ListContactsContentView()
                .navigationTitle(Text("Contact List"))
        }
        .environmentObject(ScreenBuilder.listContactContentView(interactor: serviceProvider))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


class ScreenBuilder {
    static func listContactContentView(interactor: HasContactService) -> ListContactsContentView.ObservableContent {
        let presenter = ListContactPresenter(service: interactor)
        let observer = ListContactsContentView.ObservableContent(presenter: presenter)
        presenter.observer = observer
        return observer
    }
}
