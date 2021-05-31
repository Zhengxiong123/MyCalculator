//
//  Calculator.swift
//  MyCalculator
//
//  Created by dev-lsz on 2021/5/28.
//

import UIKit

class Calculator: NSObject {
    enum Openation {
        case UnarOp((Double)->Double)
        case BinaryOp((Double,Double)->Double)
        case EqualOp
        case Constent(Double)
    }
    
    var openations = [
        "+":Openation.BinaryOp{
             op1, op2 in
            return op1+op2
        },
        
        "-":Openation.BinaryOp{
            op1, op2 in
           return op1-op2
       },
        
        "*":Openation.BinaryOp{
            op1, op2 in
           return op1*op2
       },
        
        "/":Openation.BinaryOp{
            op1, op2 in
            return op1/op2
        },
        
        "=":Openation.EqualOp,
        
        "%":Openation.UnarOp{
            op in
            return op / 100.0
        },
        
        "+/-":Openation.UnarOp({
            op in
            return -op
        }),
        
        "Clear":Openation.UnarOp{
            _ in
            return 0
        },
        
        "pi":Openation.Constent(3.14)
    ]
    
    struct Intermediate {
        var firstOp: Double
        var waitingOperation: (Double,Double) -> Double
    }
    var pengindOp: Intermediate? = nil
    
    func performOpenation(operation: String, operand: Double) -> Double? {
        if let op = openations[operation] {
            switch op {
            case .BinaryOp(let function):
                pengindOp = Intermediate.init(firstOp: operand, waitingOperation: function)
                return nil
            case .Constent(let value):
                return value
            case .EqualOp:
                return pengindOp!.waitingOperation(pengindOp!.firstOp, operand)
            case .UnarOp(let function):
                return function(operand)
            }
        }
        return nil
    }
}
