let number = 139

if number.isMultiple(of: 2) {
    print("even")
    
}else{
    print("odd")
}

let roll = Int.random(in: 1...20)

func printtimestables(number: Int, end: Int){
    for i in 1...12{
        print("\(i) * \(number) is \(i * number)")
    }
}

printtimestables(number: 5, end: 20)

let root = sqrt(169)
print(root)
func rolldice() -> Int{
    return Int.random(in:1...6)
}

let result = rolldice()
print(result)

func arelettersident(string1: String, string2: String) -> Bool{
  string1.sorted() == string2.sorted()
}
func pythagoras(a: Double, b: Double) -> Double{
    let input = a * a + b * b 
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

func getuser() -> (firstname: String, lastname: String){
    (firstname: "taylor", lastname: "swift")
}

let user = getuser()
print("name: \(user.firstname) \(user.lastname)")

func rolldice2(sides: Int, count:Int)->[Int]{
    var rolls = [Int]()
    for _ in 1...count{
        let roll = Int.random(in:1...sides)
        rolls.append(roll)

    }
}
let rolls = rolldice2(sides:6,count:4)
func hireemployee(name:String){}
func hireemployee(title:String){}
func hireemployee(location:String){}

let lyric = "i see a red door and i want it painted black"
print(lyric.hasPrefix("i see"))


var characters = {"bing", "bong","dolphin"}
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)


func checkpassword(_ password: String) throws -> String{
    if password.count < 5 {throw passworderror.short}
    if password = "12345" {throw passworderror.obvious}

    if password.count < 8{
        return "ok"
    }else if password.count < 10{
        "good"
    }else{
        "poggers"
    }
}

let string3 = "12345"

do{
    let result = try checkpassword(string3)
    print("password rating: \(result)")

} catch passworderror.short{
    print("password too short")
}catch passworderror.obvious{
    print("password sucks")
}catch{
    print("password licks weewee")
}