import UIKit

var greeting = "Hello, playground"


let score = 85

if score > 80{
    print("great job")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88{
    print("bababooey")
}

if percentage < 85 {
    print("sorry")
}

if age >= 18{
   print("good to go")
}

let ourname = "myles holley"
let friendname = "ryker kuntz"

if ourname < friendname
{print("its\(ourname) vs \(friendname)")
    
}

if ourname > friendname
{print("its\(friendname) vs \(ourname)")
    
}

var numbers = [1,2,3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)

let country = "usa"

if country == "russia"{
    print("russian oligarchy")
}

let name = "joe biden"
if name != "anonymous"{
    print("welcome \(name)")
}

let temp = 25

if temp > 20 && temp < 30{
    print("cheese")
}

let userage = 16
let hasparentperm = true

enum transportoption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = transportoption.airplane

if transport == .airplane || transport == .helicopter{
    print("letsfly")
}else if transport == .bicycle{
    print("leg day")
}
else if transport == .car{
    print("legarmday")
}else if transport == .escooter{
    print("armday")
}
enum weather{
    case sun, rain, wind, snow, unknown
}
let forecast = weather.sun
switch forecast {
case .sun: print("mr.blue sky")
case .rain: print("moody blues")
case .wind: print("wailing wind")
case .snow: print("schools out for winter")
case .unknown: print("good luck")
}

let place = "metropolis"

switch place {
case "gotham": print("joker")
case "wakanda": print("wakanda forever")
case "bing bong ville": print("yooooooo")
default: print("milven")
}


let hour = 23

print(hour < 12 ? "itsc clown":"its valid")

let names = ["conk","cave johnson","monkey"]
let crewcount = names.isEmpty ? "no one": "\(names.count) people"
print(crewcount)

enum theme {
    case light, dark
    
}
let timy = theme.dark

let background = theme == dark ? "black": "white"
print(background)


let platforms = ["ios","macos","tvos","watchos"]

for os in platforms {
    print("swift works great on \(os).")
    
    
}
for i in 1...12{
    print("5 x \(i) is \(5*i)")
    
    
}


var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown  -= 1
}

print("blast off")

let id = Int.random(in:1...1000)

let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("i rolled a \(roll)")
    
}

print("critical hit")

