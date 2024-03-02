import SwiftUI


struct SettingsView: View {
    @EnvironmentObject var core: UserAuth
    //@Binding var isInSettingsView: Bool?
    
    var body: some View {
        NavigationView {
            if let user = core.currentUser {
                ZStack {
                    Color(.systemGreen)
                        .ignoresSafeArea()
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
                            Section(header: Text("General")) {
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
                            


                            .onAppear {
                                // Update navigation state when entering settings view
                                //self.isInSettingsView = true
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
}

struct Settings_view_Previews: PreviewProvider {
    static var previews: some View {
        let userAuth = UserAuth() // Create a mock UserAuth object
        return SettingsView().environmentObject(userAuth)
    }
}


