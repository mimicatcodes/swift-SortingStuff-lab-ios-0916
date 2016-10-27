import Foundation

struct ToyBin {
    
    var ships: [Ship] = []
    var books: [Book] = []
    var bowlingPins: [BowlingPin] = []
    var musicCDs: [MusicCD] = []
 
    // struct - mutating func!
    mutating func sortShips() {
        ships = ships.sorted(by: { ship1, ship2 in ship1.age > ship2.age })
        // sorted takes a closure as an argument
        
        //"Titanic" should be at the front of the list
        for (index, ship) in ships.enumerated() {
            if ship.name == "Titanic" {
                ships.remove(at: index)
                ships.insert(ship, at: 0)
            }
        }
    }
    
    mutating func sortBooks() {
        books = books.sorted(by: {return $0.name < $1.name})
    }

    
    mutating func sortBowlingPins() {
        bowlingPins = bowlingPins.sorted(by: {bowlingPin1, bowlingPin2 in return bowlingPin1.color.rawValue < bowlingPin2.color.rawValue })
    }
    
    mutating func sortMusicCDs() {
        musicCDs = musicCDs.sorted(by: { musicCd1, musicCd2 in musicCd1.name < musicCd2.name })
        for (index, musicCd) in musicCDs.enumerated() {
            if musicCd.name == "Drake" {
                musicCDs.remove(at: index)
                musicCDs.insert(musicCd, at: 0)
            }
        }
    }
    
    mutating func changeColorOfAllPins(to color:Color) {
        bowlingPins = bowlingPins.map{ pin in
        var copy = pin
        copy.changeColor(to: color)
        return copy
        }
        
    }
    
}

struct Ship {
    var name: String
    var age: Int
}


struct Book {
    var name: String
    var year: Int
    var author: String
}


struct BowlingPin {
    var name: String
    var film: String
    var color: Color
    
    mutating func changeColor(to newColor:Color){
        color = newColor
    }
}


enum Color: Int {
    case red, organe, yellow, green, blue, indigo, violet
}



struct MusicCD {
    var name: String
    var year: Int
    var songs: [String]
}

