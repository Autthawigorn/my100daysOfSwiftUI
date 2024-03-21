//
//  checkpoint7.swift
//  
//
//  Created by Autthawigorn Yortpiboot on 15/3/2567 BE.
//

class Animal {
    let leg: Int
    init(leg: Int) {
        self.leg = leg
    }
}

class Dog: Animal {
    func speak() {
        print("Woof Woof")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Cav Cav")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Pau Pau")
    }
}

class Cat: Animal {
    func speak(){
        print("Miow Miow")
    }
    let isTame: Bool
    init(leg: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(leg:leg)
    }
}

class Persian: Cat {
    override func speak() {
        print("Maaaww")
    }
}

class Lion: Cat {
    override func speak(){
        print("Roarrrr")
    }
}


//test some
let treeLegsPersian = Persian(leg: 3, isTame: true)
treeLegsPersian.speak()
print(treeLegsPersian.leg, treeLegsPersian.isTame)

let lion = Lion(leg: 4, isTame: false)
lion.speak()
print(lion.leg, lion.isTame)

