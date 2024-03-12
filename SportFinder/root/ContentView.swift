import SwiftUI



//MARK: original
struct ContentView: View {
    //@State private var showMapView :Bool = true
    //@State private var showSettingView: Bool = false
    @EnvironmentObject var core: UserAuth
    
    var body: some View {
        Group {
            if core.userSession != nil {
                        MapView()
            } else {
                    LoginView()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserAuth())
 
  }
}


/*
 //MARK: original
struct ContentView: View {
@State private var showMapView :Bool = true
@EnvironmentObject var core: UserAuth

var body: some View {
    Group {
        if core.userSession != nil {
            ZStack {
                if showMapView {
                    MapView()
                } else {
                    LoginView()
                }
            }
        }
    }
}
}
 */
