//
//  ParceSwift+Commons.swift
//  Demo
//
//  Created by Leonardo Armero Barbosa on 25/02/16.
//
//

import Foundation

/**
 NSObject extension to transform a Dictionary to and from object
 */
public extension NSObject {
        
    /**
     Get a dictionary with label-value of properties of the current NSObject
     
     - returns: Dictionary with label-value of properties.
     */
    func getPropertiesAndType() -> [String : String] {
        var propertiesAndType = [String: String]()
        let aMirror = Mirror(reflecting: self)
        
        for case let (label?, value) in aMirror.children {
            propertiesAndType[label] = "\(Mirror(reflecting: value).subjectType)".componentsSeparatedByString("<").last!.componentsSeparatedByString(">").first
        }
        
        return propertiesAndType
    }
    
    /**
     Get type of a class from their class name.
     
     - parameter className: String with class name.
     - returns: Class type ready to initializing.
     */
    func swiftClassFromString(className: String) -> NSObject.Type {
        let appName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String
        let path = appName + "." + className
        let anyClass: AnyClass = NSClassFromString(path)!
        return anyClass as! NSObject.Type
    }
    
    public func customKeysName() -> [String : String]? {
        return nil
    }
    
}