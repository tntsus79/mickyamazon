import UIKit

var greeting = "Hello, playground"
var beatles = ["john","paul","george","ringo"]
let numbers = [4,8,15,16,23,42]
var temperatures = [25.3,28.2,28.4]
print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("allen")
beatles.append("")
beatles.append("adrian")
beatles.append("adrian")
beatles.append("adrian")
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = ["folklore"]
albums.append("fearless")
albums.append("red")
print(albums.count)

var characters = ["lana","pam","ray","sterling"]
print(characters.count)

characters.remove(at: 2)
characters.removeAll()
print(characters.count)

let bondmovies = ["casino royale","spectre", "no time to die"]
print(bondmovies.contains("frozen"))

let cities = ["london","tokyo","rome","budapest"]
print(cities.sorted())

let presidents = ["bush","obama","trump","biden"]
let reversedpresidents = presidents.reversed()
print(reversedpresidents)

let employee2 = ["name": "taylor swift","job": "singer","location": "nashville"]

print(employee2["name",default:"Unknown"])
print(employee2["job",default:"Unknown"])
print(employee2["location",default:"Unknown"])

let hasgraduated = ["eric":false,"maeve":true,"otis":false]

let olympics = [2012:"london", 2016:"rio de jinero",2021:"tokyo"]
print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["yao ming"]= 229
heights["shaq o'neal"]=216
heights["lebron james"]=206

var archenemies = [String: String]()
archenemies["batman"]="the joker"
archenemies["superman"]="lex luthor"


let actors = Set(["denzel washington", "tom cruise", "nicolas cage", "samuel l jackson"])
print(actors)

var actors2 = Set<String>()
actors2.insert("denzel washington")
actors2.insert("tom cruise")
actors2.insert("nicolas cage")
actors2.insert("samuel l jackson")
print(actors2)

var selected = "monday"
selected = "tuesday"
selected = "january"
selected = "friday"

enum weekday{
    case monday, tuesday, wednesday, thursday, friday
}

var day = weekday.monday
day = .tuesday
day = .wednesday
day = .thursday
day = .friday

let surname: String = "lasso"
var score: Int = 0
let playername:String = "roy"
let luckynumber:Int=13
let pi: Double = 3.141
var isauthenticated: Bool = true

