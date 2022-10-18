//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Theo DOS REIS on 16/10/2022.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode)var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    
    @State var textFieldText:String=""
    
    @State var alertTitle:String=""
    @State var showAlert:Bool=false
    
    @State var deadLine = Date()
    
    @State var prioritySelection:String = "High"
    let priorityOptions:[String]=[
    "High","Mid","Low"
    ]
    
    var body: some View {
        ScrollView{
            VStack (spacing:20){
                TextField("Ecrire ici ...",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .font(.title)
  
                Picker(
                    selection:$prioritySelection,
                    label: Text("Picker"),
                    content: {
                        ForEach(priorityOptions.indices){ index in
                            Text(priorityOptions[index])
                                .tag(priorityOptions[index])
                        }
                    }
                )
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                
                DatePicker("Date & Heure🕔",selection: $deadLine,in:Date()...)
                    .font(.headline)
                    .padding()
                
                Button(action:saveButton,
                       label: {
                    Text("Sauvegarder")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth:120)
                        .background(textChecker() ? Color.accentColor : Color.gray)
                        .cornerRadius(10)
                })
            }
            .padding(14)
                
        }
        .navigationTitle("Nouvelle tâche 🖋")
        .alert(isPresented: $showAlert , content: getAlert)
    }
    
    func saveButton(){
        if textChecker(){
        listViewModel.addTask(title: textFieldText,
        priorityOption: prioritySelection,
        date: deadLine)
        NotificationManager.instance.pushNotification(
        input:deadLine,
        text: textFieldText)
        presentationMode.wrappedValue.dismiss()
       }
    }
    
    func textChecker()->Bool{
        if(textFieldText.count<3){
            alertTitle="Enter at least 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert()->Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddTaskView()
        }
        .environmentObject(ListViewModel())
    }
}
