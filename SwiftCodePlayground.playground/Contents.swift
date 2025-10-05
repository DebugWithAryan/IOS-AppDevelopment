import UIKit

//var greeting = "Hello, I am aryan!"
//print(greeting)
//
//let pi:Double = 3.14 //Constant
//print(pi)
//
//var myInt: Int = 6
//print(myInt)
//
//var myDouble: Double = 6.0
//print(myDouble)
//
//var myBool: Bool = true
//print(myBool)


//Function
func hello(){
    var greeting = "Hello, I am aryan!"
    print(greeting)
}

hello()

//Parameterized Function
func sayHello(m:String){
    print(m)
}

sayHello(m: "I am learning functions.")

//Two Parameterized Function
func doAdd(a:Int,b:Int){
    var sum = a+b
    print(sum)
}
doAdd(a: 4, b: 5)


func doAddition(a:Int,b:Int) -> Int{
    var sum = a+b
    return sum
}
let result = doAddition(a: 7, b: 5)
print(result)

//Parameter Label
func doAdditions(firstNum a:Int,secondNum b:Int) -> Int{
    var sum = a+b
    return sum
}
let results = doAdditions(firstNum: 7, secondNum: 10)
print(results)
