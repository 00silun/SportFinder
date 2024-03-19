import SwiftUI


/*
struct SettingsView: View {
    var body: some View{
        Text("SettingView")
    }
}
*/

struct SettingsView: View {
    @EnvironmentObject var core: UserAuth
    //@Binding var isInSettingsView: Bool?
    
    
    var body: some View {
        if let user = core.currentUser {
            ZStack {
                Color(.systemGreen)
                    .ignoresSafeArea()
                    .navigationTitle("Settings")
                    .navigationBarHidden(true)
                    
                VStack(spacing: 23){
                    HStack{
                        Image(systemName: "gear")
                            .imageScale(.large)
                            .frame(width: 25.0)
                            .foregroundColor(Color.white)
                        Text("Settings")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                    }
                    List {
                        Section(header:GeneralSectionHeader()) {
                            rowTemplate(imageName: "person.crop.circle.fill", title: "Name:", description: user.fullname, tintColor: Color(.black))
                            rowTemplate(imageName: "mail", title: "Email:", description: user.email, tintColor: Color(.black))
                            rowTemplate(imageName: "calendar.circle", title: "Date of birth:", description: user.date_of_birth, tintColor: Color(.black))
                            rowTemplate(imageName: "phone", title: "Phone", description: user.phone_number, tintColor: Color(.black))
                        }
                        Section(header: Text("Privacy")) {
                            rowTemplate(imageName: "bell", title: "Notifications", description: "Legge inn funksjon", tintColor: Color(.black))
                            rowTemplate(imageName: "key", title: "Password", description: "Legge inn funksjon", tintColor: Color(.black))
                        }
                       
                        Section(header: Text("Preferences")) {
                            NavigationLink(destination: SportSelectorView()) {
                                HStack {
                                    rowTemplate(imageName: "heart.fill", title: "Select Sports", description: "", tintColor: Color(.pink))
                                }
                            }
                        }
                        
                        Section("Account") {
                            Button {
                                core.signOut()
                            } label: {
                                rowTemplate(imageName: "arrow.left.circle.fill",
                                            title: "Sign out", description: "", tintColor: Color(.red))
                            }
                        }
                    }
                }
            }
        }
        
    }
}


struct GeneralSectionHeader: View {
    var body: some View {
        HStack {
            Text("General")
            Spacer()
            NavigationLink(destination: EditUserInfoView()) {
                Text("Edit".lowercased())
            }
            .foregroundColor(.blue)
        }
    }
}





struct EditUserInfoView: View {
    @EnvironmentObject var core: UserAuth
    @State private var newName = ""
    @State private var newEmail = ""
    @State private var newDateOfBirth = ""
    @State private var newPhoneNumber = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        Form {
            Section(header: Text("Edit User Info")) {
                TextField("New Name", text: $newName)
                TextField("New Email", text: $newEmail)
                TextField("New Date of Birth", text: $newDateOfBirth)
                TextField("New Phone Number", text: $newPhoneNumber)
            }
            Button("Save Changes") {
                saveChanges()
            }
        }
        .navigationTitle("Edit User Info")
        .onAppear {
            // Populate fields with current user information when view appears
            if let user = core.currentUser {
                newName = user.fullname
                newEmail = user.email
                newDateOfBirth = user.date_of_birth
                newPhoneNumber = user.phone_number
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Save Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func saveChanges() {
        guard let currentUser = core.currentUser else { return }
        // Update user information in Firestore
        core.updateUserInfo(userID: currentUser.id, newName: newName, newEmail: newEmail, newDateOfBirth: newDateOfBirth, newPhoneNumber: newPhoneNumber)
        
        // For now, just show a success message
        showAlert = true
        alertMessage = "Changes saved successfully"
    }
}











struct SettingsView_Previews2: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
                .environmentObject(UserAuth()) // Assuming you have an
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock user
        let mockUser = User(id: "mockUserID", fullname: "John Doe", email: "john@example.com", phone_number: "1234567890", date_of_birth: "1990-01-01")
        
        // Create a UserAuth instance and set currentUser to the mock user
        let userAuth = UserAuth()
        userAuth.currentUser = mockUser
        
        // Wrap the EditUserInfoView in a NavigationView to simulate navigation
        return NavigationView {
            SettingsView().environmentObject(userAuth)
            
        }
    }
}

            
            
struct EditUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock user
        let mockUser = User(id: "mockUserID", fullname: "John Doe", email: "john@example.com", phone_number: "1234567890", date_of_birth: "1990-01-01")
        
        // Create a UserAuth instance and set currentUser to the mock user
        let userAuth = UserAuth()
        userAuth.currentUser = mockUser
        
        // Wrap the EditUserInfoView in a NavigationView to simulate navigation
        return NavigationView {
            EditUserInfoView().environmentObject(userAuth)
        }
    }
}
            



/*
 struct EditUserInfoView: View {
     @EnvironmentObject var core: UserAuth
     @State private var newName = ""
     @State private var newEmail = ""
     @State private var newDateOfBirth = ""
     @State private var newPhoneNumber = ""
     @State private var showAlert = false
     @State private var alertMessage = ""

     var body: some View {
         Form {
             Section(header: Text("Edit User Info")) {
                 TextField("New Name", text: $newName)
                 TextField("New Email", text: $newEmail)
                 TextField("New Date of Birth", text: $newDateOfBirth)
                 TextField("New Phone Number", text: $newPhoneNumber)
             }
             Button("Save Changes") {
                 // Implement your save logic here
             }
         }
         .navigationTitle("Edit User Info")
         .onAppear {
             // Populate fields with current user information when view appears
             if let user = core.currentUser {
                 newName = user.fullname
                 newEmail = user.email
                 newDateOfBirth = user.date_of_birth
                 newPhoneNumber = user.phone_number
             }
         }
     }
     func saveChanges() {
         guard let currentUser = core.currentUser else { return }
         // Update user information in Firestore
         core.updateUserInfo(userID: currentUser.id, newName: newName, newEmail: newEmail, newDateOfBirth: newDateOfBirth, newPhoneNumber: newPhoneNumber)
     }
 }
 */
