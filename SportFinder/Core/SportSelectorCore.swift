import SwiftUI
import Firebase
import FirebaseFirestore

struct DatabaseSport: Identifiable, Hashable, Codable {
    var id = UUID() // Unique identifier for each sport
    let sport: String
    let imageName: String
    var isFavorite: Bool

    func hash(into hasher: inout Hasher) {
        hasher.combine(sport)
    }

    static func == (lhs: DatabaseSport, rhs: DatabaseSport) -> Bool {
        return lhs.sport == rhs.sport && lhs.isFavorite == rhs.isFavorite
    }
}

class SportsManager: ObservableObject {
    // REMARK: All sports in app to be listed here
    @Published var allSports: [DatabaseSport] = [
        DatabaseSport(sport: "American Football",   imageName: "americanFootballIcon", isFavorite: false),
        DatabaseSport(sport: "Football",   imageName: "footballIcon",isFavorite: false),
        DatabaseSport(sport: "Handball",   imageName: "naIcon",isFavorite: false),
        DatabaseSport(sport: "Swimming",   imageName: "swimmingIcon", isFavorite: false),
        DatabaseSport(sport: "Surfing",    imageName: "surfingIcon",isFavorite: false),
        DatabaseSport(sport: "Water Polo", imageName: "waterPoloIcon",isFavorite: false),
        DatabaseSport(sport: "Basketball", imageName: "basketballIcon",isFavorite: false),
        DatabaseSport(sport: "Tennis",     imageName: "tennisIcon",isFavorite: false),
        DatabaseSport(sport: "Golf",       imageName: "golfIconMen",isFavorite: false),
        DatabaseSport(sport: "Cricket",    imageName: "cricketIcon",isFavorite: false),
        DatabaseSport(sport: "Baseball",   imageName: "baseballIcon",isFavorite: false),
        DatabaseSport(sport: "Volleyball", imageName: "vollyballIcon",isFavorite: false),
        DatabaseSport(sport: "Badminton",  imageName: "naIcon",isFavorite: false),
        DatabaseSport(sport: "Table Tennis", imageName: "tableTennisIcon",isFavorite: false),
        DatabaseSport(sport: "Rugby",      imageName: "rugbyIcon",isFavorite: false),
        DatabaseSport(sport: "Boxing",     imageName: "boxingIcon",isFavorite: false),
        DatabaseSport(sport: "Alpint",     imageName: "alpintIcon",isFavorite: false),
        DatabaseSport(sport: "Bowling",    imageName: "bowlingIcon",isFavorite: false),
        DatabaseSport(sport: "Chess",      imageName: "chessIcon",isFavorite: false),
        DatabaseSport(sport: "Climbing",   imageName: "climbingIconWomen",isFavorite: false),
        DatabaseSport(sport: "Field Hockey", imageName: "fieldHockeyIcon",isFavorite: false),
        DatabaseSport(sport: "Frisbee",    imageName: "frisbeeIcon",isFavorite: false),
        DatabaseSport(sport: "Ice Hockey", imageName: "iceHockeyIcon",isFavorite: false),
        DatabaseSport(sport: "Lacross",    imageName: "lacrossIcon",isFavorite: false),
        DatabaseSport(sport: "Meditation", imageName: "meditateIconMan",isFavorite: false),
        DatabaseSport(sport: "Parachuteing", imageName: "parachuteIcon",isFavorite: false),
        DatabaseSport(sport: "Rugby",      imageName: "rugbyIcon",isFavorite: false),
        DatabaseSport(sport: "Running",    imageName: "runningIconWomen",isFavorite: false),
        DatabaseSport(sport: "Snowboarding", imageName: "snowboardIcon",isFavorite: false),
        DatabaseSport(sport: "Weight Lifting", imageName: "weightLiftingIcon",isFavorite: false),
        DatabaseSport(sport: "Wrestling",  imageName: "wrestlingIcon",isFavorite: false)
        // Add more if needed
        //DatabaseSport(sport: "",     imageName: "",isFavorite: false),
        ]
    
    // UserDefaults key for saving favorites
    let favoritesKey = "FavoriteSports"

    init() {
        loadFavorites()
    }

    // Load user favorites from UserDefaults
    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: favoritesKey) {
            if let favorites = try? JSONDecoder().decode([String: Bool].self, from: data) {
                for (index, sport) in allSports.enumerated() {
                    if let isFavorite = favorites[sport.sport] {
                        allSports[index].isFavorite = isFavorite
                    }
                }
            }
        }
    }

    // Save user favorites to UserDefaults
    private func saveFavorites() {
        var favorites = [String: Bool]()
        for sport in allSports {
            favorites[sport.sport] = sport.isFavorite
        }
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
    
    // MARK: All Categories of sports in app to be listed here
    let sportTypes = ["All", "Favorite", "Ball Sports", "Outdoor", "Indoor", "Water Sports", "Individual", "Winter Sports"]
    @Published var selectedSportType = "All"
    
    // MARK: Add sports to categori here
    func filteredSports() -> [DatabaseSport] {
        defer{
            saveFavorites()// Call saveFavorites whenever any sport's isFavorite is changed
        }
       if selectedSportType == "All" {
           return allSports
           
       } else if selectedSportType == "Favorite"{
           return allSports.filter { $0.isFavorite }
           
       } else if selectedSportType == "Ball Sports" {
           return allSports.filter {
               ["American Football",
                "Football",
                "Handball",
                "Tennis",
                "Basketball",
                "Baseball"].contains($0.sport)
           }
       }
        else if selectedSportType == "Winter Sports"{
            return allSports.filter{
                ["Snowboarding",
                 "Alpint",
                 "Ice Hockey"].contains($0.sport)
                
            }
        }
        else if selectedSportType == "Water Sports" {
           return allSports.filter {
               $0.sport == "Swimming" ||
               $0.sport == "Surfing"  ||
               $0.sport == "Water Polo"
           }
       } else if selectedSportType == "Outdoor" {
           return allSports.filter {
               ["Swimming",
                "Surfing",
                "Football",
                "Golf"].contains($0.sport) }
       } else {
           return allSports.filter { $0.sport == selectedSportType }
       }
   }
    
}

// REMARK: Generates each row of sport with an icon, name and check box
struct SportRow: View {
    @Binding var sport: DatabaseSport
    @ObservedObject var sportsManager: SportsManager
    
    var body: some View {
        HStack {
            // ##### Icon #####
            Image(sport.imageName) // Use the image name stored in the sport object
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.trailing, 5)
            
            // ##### Text #####
            Text(sport.sport)
            Spacer()
        
            // ##### Check Box #####
            Image(systemName: sport.isFavorite ? "checkmark.square.fill" : "square")
                .foregroundColor(sport.isFavorite ? .blue : .gray)
                .imageScale(.large)
                .onTapGesture {self.sport.isFavorite.toggle()
                    
                    // ##### For Debug #####
                    /*
                    print()
                    print(sportsManager.allSports)
                    print()
                     */
                }
        }
        .padding()
    }
}
