import SwiftUI


     //MARK: original
struct ContentView: View {
    @State private var showMapView :Bool = true
    @State private var showSettingView : Bool = false
    @State private var showSportSelectionView : Bool = false
    @EnvironmentObject var core: UserAuth
    
    var body: some View {
        Group {
            if core.userSession != nil {
                ZStack {
                    if showMapView {
                        MapView()
                    } else if showSettingView {
                        SettingsView()
                    } else if showSportSelectionView{
                        SportSelectorView()
                    } else {
                        LoginView()
                    }
                }
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

