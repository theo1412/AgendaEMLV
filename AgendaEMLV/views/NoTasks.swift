//
//  NoTasks.swift
//  ToDoList
//
//  Created by Theo DOS REIS on 16/10/2022.
//

import SwiftUI

struct NoTasksView: View {
    
    @State var animate:Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing:10){
                Text("Il n'y a pas de tâches !!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom,20)
                NavigationLink(destination: AddTaskView(), label:{
                    Text("Ajoute une nouvelle tâche")
                        .foregroundColor(.white)
                        .font(.body)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red:Color.accentColor)
                        .cornerRadius(10)
                        
                } )
                    .padding(.horizontal,animate ? 30 : 50)
                    .shadow(
                    color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0, y: animate ? 50 : 30 )
                    .scaleEffect(animate ? 1.1 : 1.0 )
                    .offset(y: animate ? -7 : -0)
            }
            .frame( maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: makeAnimation)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
    
    func makeAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            withAnimation(
                .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
                                        
    }
}

struct NoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        NoTasksView()
        }
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
