// Demo when and how an @State var can be used on a single view
import SwiftUI

struct UserSettingsPage : View {
    // State vars are always private since they only apply to this particular view
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("Your Name: ")
                .padding(14)
                // The following 2 text views just point to the state vars
                HStack {
                    Text(firstName)
                    Text(lastName)
                }
            }
            // The following textfield views have 2-way binding with the state vars. This means that they reflect the value of state, but can also change the value of state and then reflect that new value. The 2-way binding is indicated with the "$" ex: $firstName
            TextField("First name", text: $firstName)
            .padding()
            .font(.largeTitle)
            
            TextField("Last name", text: $lastName)
                .padding()
                .font(.largeTitle)
            // The following button mutates state. The self.firstName is required because it's a closure.
            Button("Change First Name") {
                self.firstName = "Foo"
            }
        }
    }
}

#if DEBUG
struct UserSettingsPage_Previews : PreviewProvider {
    static var previews: some View {
        UserSettingsPage()
    }
}
#endif
