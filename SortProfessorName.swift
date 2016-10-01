//
//  SortProfessorName.swift
//  GradesViewer
//
//  Created by Riyang Liu on 12/22/15.
//  Copyright © 2015 Riyang-Liu. All rights reserved.
//

import Foundation

//A class with collects likely names of professors.
class SortProfessorName{
    
    var sortedArray: [[CourseData]] = []
    var temp: CourseData?
    
    func sortFunc(var array:[[CourseData]]) -> [[CourseData]] {
        
        for var n = 0; n < array.count; n++ {
            
            for var i = 0; i < array[n].count; i++ {
                
                for var j = i+1; j<array[n].count; j++ {
                    
                    if( array[n][i].professorId < array[n][j].professorId) {
                        
                        temp = array[n][i]
                        array[n][i] = array[n][j]
                        array[n][j] = temp!
                        
                    }
                }
                
            }
        }
        
        sortedArray = array
        return sortedArray
    }
    
    
}

