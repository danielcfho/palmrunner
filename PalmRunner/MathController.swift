//
//  MathController.swift
//  PalmRunner
//
//  Created by Ho Daniel on 10/5/15.
//  Copyright (c) 2015 rm-3d.com. All rights reserved.
//

import Foundation

class MathController: NSObject {
    static let isMetric:Bool = true
    static let metersInKM:Float = 1000
    static let metersInMile:Float = 1609.344
    
    class func stringifyDistance(meters:Float)->String{
        var unitDivider:Float
        var unitName:String
        
        // metric
        if (isMetric) {
            unitName = "km"
            // to get from meters to kilometers divide by this
            unitDivider = metersInKM
            // U.S.
        } else {
            unitName = "mi"
            // to get from meters to miles divide by this
            unitDivider = metersInMile
        }
        
        return String(format: "%.2f %@", (meters / unitDivider), unitName)
    }
    
    class func stringigySecondCount(seconds:Int,longFormat:Bool)->String{
        var remainingSeconds:Int = seconds
        var hours:Int = remainingSeconds / 3600
        remainingSeconds = remainingSeconds - hours * 3600
        var minutes:Int = remainingSeconds / 60
        remainingSeconds = remainingSeconds - minutes * 60
        
        if (longFormat) {
            if (hours > 0) {
                return String(format: "%ihr %imin %isec", hours, minutes, remainingSeconds)
            } else if (minutes > 0) {
                return String(format: "%imin %isec", minutes, remainingSeconds)
            } else {
                return String(format: "%isec", remainingSeconds)
            }
        } else {
            if (hours > 0) {
                return String(format: "%02i:%02i:%02i", hours, minutes, remainingSeconds)
            } else if (minutes > 0) {
                return String(format: "%02i:%02i", minutes, remainingSeconds)
            } else {
                return String(format: "00:%02i", remainingSeconds)
            }
        }
    }
    
    class func stringifyAvgPaceFromDist(meters:Float,seconds:Int)->String{
        if (seconds == 0 || meters == 0) {
            return "0"
        }
        
        var avgPaceSecMeters:Float = Float(seconds) / meters
        
        var unitMultiplier:Float
        var unitName:String
        
        // metric
        if (isMetric) {
            unitName = "min/km"
            unitMultiplier = metersInKM
            // U.S.
        } else {
            unitName = "min/mi"
            unitMultiplier = metersInMile
        }
        
        var paceMin:Float = ((avgPaceSecMeters * unitMultiplier) / 60.0)
        var paceSec:Float = (avgPaceSecMeters * unitMultiplier - (paceMin*60.0))
        
        return String(format: "%i:%02i %@", Int(paceMin), Int(paceSec), unitName)
    }
}
