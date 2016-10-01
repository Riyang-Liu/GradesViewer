//
//  ProfessorData.swift
//  GradesViewer
//
//  Created by Riyang Liu on 12/21/15.
//  Copyright © 2015 Riyang-Liu. All rights reserved.
//

import Foundation

//A struct of professorData which contains professor Id and professor name.
struct ProfessorData {
    
    let professorId:Int?
    let professorName: String?
    
    init(professorDataDictionary:[String:AnyObject]) {
        
        professorId = professorDataDictionary["id"] as? Int
        professorName = professorDataDictionary["name"] as? String
        
    }
    
}
