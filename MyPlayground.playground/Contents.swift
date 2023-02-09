import UIKit

var greeting = "Hello, playground"


var cromb = 0

enum casen {
    case yessnt, noo,bing,nah
}

 cromb = Int.random(in: 1...4)

switch cromb {
case 1:
    casen.yessnt

case 2:
    casen.noo

case 3:
    casen.bing
case 4:
    casen.nah
default:
    nice
}

if(cromb == 1){
    print("yaga")
}else if(cromb == 2){
    print("yos")
}else if(cromb == 3){
    print("ying")
}else if(cromb == 4){
    print("yay")
}else{
    print("nah")
}


