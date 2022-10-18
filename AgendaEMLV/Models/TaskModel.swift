//
//  TaskModel.swift
//  ToDoList
//
//  Created by Theo DOS REIS on 16/10/2022.
//

import Foundation

struct TaskModel:Identifiable,Codable{
    let id:String
    let title:String
    let priorityOption:String
    let date:Date
    let isCompleted:Bool
    
    init(id:String = UUID().uuidString,title: String,isCompleted:Bool,priorityOption:String,date:Date){
        self.id=id
        self.title=title
        self.priorityOption=priorityOption
        self.date=date
        self.isCompleted=isCompleted
    }
    
    func updateComplete()->TaskModel{
        return TaskModel(id: id, title: title, isCompleted: !isCompleted, priorityOption:priorityOption, date: date)
    }
}
