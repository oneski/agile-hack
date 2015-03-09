//
//  Line.swift
//  AVCam
//
//  Created by David E. Silverman on 3/7/15.
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

import Foundation

import UIKit

class Line {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    init(start _start: CGPoint, end _end: CGPoint, color _color: UIColor!) {
        //init(start _start: CGPoint, end _end: CGPoint) {
        start = _start
        end = _end
        color = _color
    }
}