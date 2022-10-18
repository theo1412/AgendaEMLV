//
//  ListRowView.swift
//  ToDoList
//
//  Created by Theo DOS REIS on 16/10/2022.
//

import SwiftUI

struct ListRowView: View {
    

    
    let task:TaskModel
    
    
    var body: some View {
        HStack{
            Image(systemName: task.isCompleted ? "checkmark.circle":"circle")
                .foregroundColor(task.isCompleted ? .green:.red)
            VStack (alignment:.leading){
                Text(task.title)
                    .fontWeight(.bold)
                
                HStack{
                    Text(task.date,style: .date)
                    .font(.body)
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
                    
                    Text(task.date,style: .time)
                    .font(.body)
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
            }
            }
            .padding()
            
            Spacer()
            
            Text(task.priorityOption)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(priorityColor(input: task.priorityOption))

        }
        
        .font(.title2)
        .padding(.vertical,8)
    }


}

func priorityColor(input:String) -> Color{
    if input=="High"{
        return Color.red
    }
    else if input=="Mid"{
        return Color.yellow
    }
    else{
        return Color.green
    }
}

struct ListRowView_Previews: PreviewProvider {
    
static var task1 = TaskModel(title: "First", isCompleted: false,priorityOption:"High",date: Date().addingTimeInterval(600))
    
    
    static var previews: some View {
        NavigationView{
            ListRowView(task: task1)
        }
        .previewLayout(.sizeThatFits)
    }
}
