import UIKit

var greeting = "Welcome! Here are my solutions for Codility training."

func frogImpl(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    let N: Double = Double(Y - X) / Double(D)
    let Nint = Int(N.rounded(.up))
    return Nint
}

frogImpl(10, 85, 30)

public func oddOccurrencesInArray(_ A : [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    var solDict = [Int:Int]()
    for item in A {
        if let count = solDict[item] {
            solDict[item] = count + 1
        } else {
            solDict[item] = 1
        }
    }
    
    print(solDict)
    
    let result = solDict.first { key, value in
        value % 2 != 0
    }
    
    return result?.key ?? 0
}

oddOccurrencesInArray([9, 3, 9, 3, 9, 7, 9])

public func cyclicRotation2(_ A : [Int], _ K : Int) -> [Int] {
    // write your code in Swift 4.2.1 (Linux)
    guard !A.isEmpty else { return A }
    var shiftedArray = A
    let auxArray = shiftedArray
    
    for i in 0..<shiftedArray.count {
        let index = (i+K) % A.count
        shiftedArray[index] = auxArray[i]
    }
    print(shiftedArray)
    return shiftedArray
}

cyclicRotation2([1, 2, 3, 4], 2)
cyclicRotation2([], 1)

public func cyclicRotation(_ A : [Int], _ K : Int) -> [Int] {
    // write your code in Swift 4.2.1 (Linux)
    var shiftedArray = A
    
    guard !A.isEmpty else { return A }
    for _ in 0..<K {
        let auxArray = shiftedArray
        for i in 0..<shiftedArray.count - 1 {
            shiftedArray[i+1] = auxArray[i]
        }
        shiftedArray[0] = auxArray.last!
    }
    print(shiftedArray)
    return shiftedArray
}

cyclicRotation([1, 2, 3, 4], 2)
cyclicRotation([], 1)

public func binaryGap(_ N : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    let s = String(N, radix: 2)
    print(s)
    
    var maxValue = 0
    var aux = 0
    var startCounting = false
    s.forEach { ch in
        if (ch == "1") {
            startCounting = !startCounting
            
            if !startCounting {
                maxValue = max(maxValue, aux)
                aux = 0
            }
        } else if (ch == "0") {
            if !startCounting {
                startCounting = !startCounting
            }
            aux += 1
            
        }
    }
    
    return maxValue
}

binaryGap(529)
