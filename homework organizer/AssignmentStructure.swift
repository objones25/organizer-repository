//
//  AssignmentStructure.swift
//  homework organizer
//
//  Created by Owen Jones on 4/20/20.
//  Copyright © 2020 Owen Jones. All rights reserved.
//

import Foundation

struct AssignmentStructure {
    let sbjct: String
    let date: String
    let type: String
    let points: Int
    
    init( subject: String, dueDate: String, assignmentType: String, pointsWorth: Int){
        sbjct = subject
        date = dueDate
        type = assignmentType
        points = pointsWorth
    }
}
