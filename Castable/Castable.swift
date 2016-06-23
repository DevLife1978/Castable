//
//  Castable.swift
//  Castable
//
//  Created by jayios on 2016. 6. 23..
//  Copyright © 2016년 ngenii. All rights reserved.
//

import Foundation

protocol Castable {}

protocol UnsafePointerProtocol: NilLiteralConvertible {
    associatedtype Memory
    init(nilLiteral: ())
    init<Memory>(_ from: UnsafeMutablePointer<Memory>)
    init<Memory>(_ from: UnsafePointer<Memory>)
    var memory: Memory { get }
}

extension UnsafeMutablePointer : UnsafePointerProtocol{}
extension UnsafePointer : UnsafePointerProtocol{}
extension UnsafeMutablePointer : Castable{}
extension UnsafePointer : Castable{}

extension UnsafePointerProtocol where Self: RandomAccessIndexType, Self: Castable {
    func cast<P: UnsafePointerProtocol, M where M == P.Memory>() -> P {
        switch self {
        case let ptr as UnsafePointer<Memory>:
            return P(ptr)
        case let ptr as UnsafeMutablePointer<Memory>:
            return P(ptr)
        default:
            return nil
        }
    }
}


protocol Pointerable {
    associatedtype Element
    var pointer:UnsafePointer<Element> {get}
    var mutablePointer:UnsafeMutablePointer<Element> {get}
}

extension Array : Pointerable {}
extension ArraySlice : Pointerable {}

extension Pointerable where Self: SequenceType {
    var pointer : UnsafePointer<Element> {
        switch self {
        case let a as Array<Element>:
            return UnsafePointer<Element>(a)
        case let s as ArraySlice<Element>:
            let a = s.flatMap({$0})
            return UnsafePointer<Element>(a)
        default:
            return nil
        }
    }
    
    var mutablePointer : UnsafeMutablePointer<Element> {
        return pointer.cast()
    }
}