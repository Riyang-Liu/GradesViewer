//
//  ProfessorList.swift
//  GradesViewer
//
//  Created by Riyang Liu on 12/22/15.
//  Copyright © 2015 Riyang-Liu. All rights reserved.
//

import Foundation

//Collecting all the professor data in one array. 
struct ProfessorList {
    
    var professorList: [ProfessorData] = []
    
    init(professorData: [[String:AnyObject]]) {
        
        for dictionary in professorData {
            
            let professorData = ProfessorData(professorDataDictionary: dictionary)
            
            professorList.append(professorData)
            
        }
    }
}
