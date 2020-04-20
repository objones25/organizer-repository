//
//  ContentView.swift
//  homework organizer
//
//  Created by Owen Jones on 4/15/20.
//  Copyright © 2020 Owen Jones. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selection = 0
    
    
    var body: some View {
        ZStack{
            TabView(selection: $selection){
                CheckListVIew()
                    .tabItem {
                        VStack {
                            Image(systemName: "calendar.circle")
                            Text("Homework Organizer")
                        }
                }
                .tag(0)
                NewAssignmentView()
                    .tabItem {
                        VStack {
                            Image(systemName: "folder.fill.badge.plus")
                            Text("New Assignment")
                        }
                }
                .tag(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CheckListVIew: View {
    @State private var assignments = 2
    @State private var subject = "NA"
    @State private var dueDate = "NA"
    @State private var assignmentType = "NA"
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10){
                ForEach(1..<assignments){
                    Text("Priority \($0)")
                        .padding(10)
                    VStack {
                        VStack{
                            HStack{
                                HStack {
                                    Text("Subject:")
                                    Text(self.subject)
                                        .opacity(0.5)
                                }
                                .lineLimit(1)
                                .scaledToFit()
                                .minimumScaleFactor(0.1)
                                // subject box
                                Spacer(minLength: 10)
                                HStack {
                                    Text("Due Date:")
                                    Text(self.dueDate)
                                        .opacity(0.5)
                                    
                                }
                                .lineLimit(1)
                                .scaledToFit()
                                .minimumScaleFactor(0.1)
                                .padding(10)
                                // due date box
                            }
                            .padding(10)
                            HStack{
                                HStack{
                                    Text("Assignment Type:")
                                    Text(self.assignmentType)
                                        .opacity(0.5)
                                    //assignment type box
                                }
                                .lineLimit(1)
                                .scaledToFit()
                                .minimumScaleFactor(0.1)
                                .padding(10)
                                Spacer(minLength: 15)
                                VStack{
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                        Image(systemName: "pencil.and.ellipsis.rectangle")
                                    }
                                    .padding(5)
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                        Image(systemName: "pencil.slash")
                                    }
                                    .padding(.horizontal, 0.5)
                                }
                                .lineLimit(1)
                                .scaledToFit()
                                .minimumScaleFactor(0.1)
                                .padding(10)
                            }
                        }
                    }
                    Divider()
                }
            }
            .background(Color.white)
            .cornerRadius(15)
            .padding(1)
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.black)
    }
}


struct NewAssignmentView: View {
    @State private var subject = ""
    @State private var dueDate = Date()
    @State private var assignmentType = 0
    let types = ["essay", "worksheet", "reading", "study for test", "group project", "other"]
    var body: some View {
        NavigationView{
            Form{
                HStack(alignment: .center){
                    Text("Subject:")
                    TextField("NA", text: self.$subject)
                }
                
                DatePicker(selection: $dueDate, label: { Text("Due Date:") })
                
                Picker(selection: $assignmentType, label: Text("Assignment Type:")) {
                    ForEach(0 ..< types.count){ index in
                        Text(self.types[index]).tag(index)
                    }
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    HStack{
                        Text("More Information")
                        Image(systemName: "pencil.and.ellipsis.rectangle")
                        
                    }
                }
                Button(action: {}) {
                    Text("Complete")
                }
            }
        .navigationBarTitle(Text("New Assignment"))
        }
    }
}
