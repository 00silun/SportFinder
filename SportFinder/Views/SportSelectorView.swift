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
    }
}


#Preview{SportSelectorView()}
