//
//  Authetication_model.swift
//  Setting_template
//
//  Created by Sondre Lyngstad on 01/02/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

protocol AuthenticationFormProtocal {
    var formIsValid: Bool {get}
}

@MainActor
class UserAuth: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    
    func signIn(withEmail email: String, password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        }catch{
            print("DEBUG: Failed to login with error \(error.localizedDescription)")
        }
        
    }
    
    func createUser(withEmail email: String, password: String, fullname: String, phone_number: String, date_of_birth: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email, phone_number: phone_number, date_of_birth: date_of_birth)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()

        }catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            
        }
    }
    
    
    func signOut(){
        do{
            try Auth.auth().signOut() // signs out user on backend
            self.userSession = nil    // wipes out user session and takes us back to login screen
            self.currentUser = nil    // wipes out current user data model
        } catch{
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await
                Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as:User.self)
    }
    
    func updateUserInfo(userID: String, newName: String, newEmail: String, newDateOfBirth: String, newPhoneNumber: String) {
        let userRef = Firestore.firestore().collection("users").document(userID)
        userRef.updateData([
            "fullname": newName,
            "email": newEmail,
            "date_of_birth": newDateOfBirth,
            "phone_number": newPhoneNumber
        ]) { error in
            if let error = error {
                print("Error updating user information: \(error.localizedDescription)")
            } else {
                print("User information updated successfully")
            }
        }
    }
}

