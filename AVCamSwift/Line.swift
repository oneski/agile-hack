//
//  Line.swift
//  AVCamSwift
//
//  Created by David Taitz on 3/7/15.
//  Copyright (c) 2015 sunset. All rights reserved.
//

import Foundation

import UIKit

class Line {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    //Add line segments
    init(start _start: CGPoint, end _end: CGPoint, color _color: UIColor!) {
        //init(start _start: CGPoint, end _end: CGPoint) {
        start = _start
        end = _end
        color = _color
    }
}