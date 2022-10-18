//
//  ListView.swift
//  ToDoList
//
//  Created by Theo DOS REIS on 16/10/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    init(){
        NotificationManager.instance.requstAuthorization()
    }
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoTasksView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else {
                List{
                    ForEach(listViewModel.items){item in
                        ListRowView(task: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateTask(task: item)
                                }
                                SoundManager.instance.playSound()
                            }
                    }
                    .onDelete(perform: listViewModel.deleteTask)
                    .onMove(perform: listViewModel.moveTask)
                }
                .listStyle(PlainListStyle())
            }
        }
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        .navigationTitle("Classe M 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add",
                                destination: AddTaskView()) )
    }

}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

