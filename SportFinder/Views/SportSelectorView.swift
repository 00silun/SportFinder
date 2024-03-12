import SwiftUI

struct SportSelectorView: View {
    @StateObject var sportsManager = SportsManager()

    var body: some View {
        VStack {
            List(sportsManager.filteredSports(), id: \.self) { sport in
                SportRow(sport: self.$sportsManager.allSports[self.sportsManager.allSports.firstIndex(where: { $0.sport == sport.sport })!], sportsManager: self.sportsManager)
            }
        }
        .navigationBarTitle("Select your favorite sports:", displayMode: .inline)
        .navigationBarItems(
            trailing: // Right side
                Picker(selection: $sportsManager.selectedSportType, label: Text("Filter")) {
                    ForEach(sportsManager.sportTypes, id: \.self) { type in
                        Text(type)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 100)
                .accentColor(.red)
        )
    }
}


import SwiftUI

struct ContentView5: View {
    var body: some View {
        NavigationView {
            SportSelectorView()
        }
    }
}

struct SportSelectorView5: View {
    var body: some View {
        VStack {
            Text("Sport Selector View")
        }
        .navigationBarTitle("Select your favorite sports")
    }
}

struct ContentView_Previews5: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}



/*
 import SwiftUI


 struct SportSelectorView: View {
     @StateObject var sportsManager = SportsManager()

     var body: some View {
         VStack {
             
             Text("Select your favorite sports:").font(.title)
             HStack{
                 Text("Filter")
                 Picker(selection: $sportsManager.selectedSportType, label: Text("")) {
                     ForEach(sportsManager.sportTypes, id: \.self) { type in
                         Text(type)
                 // I want i function her to make multiple filterselctions possible
                     }
                 }
             }
             .pickerStyle(MenuPickerStyle())
             .padding()
             
             List(sportsManager.filteredSports(), id: \.self) { sport in
                 SportRow(sport: self.$sportsManager.allSports[self.sportsManager.allSports.firstIndex(where: { $0.sport == sport.sport })!], sportsManager: self.sportsManager)
             }
         }
         .navigationBarTitle("Select your favorite sports:")
         
     }
 }

 struct SportSelectorView_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
             SportSelectorView()
         }
     }
 }

 
 


 */
