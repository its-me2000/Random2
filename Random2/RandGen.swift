//
//  RandGen.swift
//  Random2
//
//  Created by Eugenijus Margalikas on 28/11/2017.
//  Copyright © 2017 Eugenijus Margalikas. All rights reserved.
//

import Foundation

class RandGen {
    
    var lowerBound:Int
    var upperBound:Int
    var range:UInt
    
    init(withBounds lb:Int,_ ub:Int){
        lowerBound = Int(min(lb,ub))
        upperBound = Int(max(lb, ub))
        range = UInt.init(bitPattern: upperBound &- lowerBound &+ 1) 
    }
    convenience init(){
        self.init(withBounds: 1, 10)
    }
    
    func generate()->Int{
        
        return Int.init(bitPattern: (RandGen.randomNumber() % range)) &+ lowerBound
        
    }
    
    static func randomNumber()->UInt{
        
        var v:[UInt8] = Array.init(repeating: 0, count: Int.bitWidth/8)
        
        
        _ = SecRandomCopyBytes(kSecRandomDefault, 8, &v)
        
        let a = v.reduce(0) { (result, next) -> UInt in result<<8+UInt(next) }
        
        return a
    }
    
}
