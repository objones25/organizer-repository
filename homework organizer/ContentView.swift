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
                CheckListView()
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

struct CheckListView: View {
    
    class PriorityTracker: ObservableObject {
        @Published var assignments = 0
        @Published var priority: [String: VariableTracker] = [:]
    }
    // Created an Observable Object
    
    @ObservedObject var priorityTracker = PriorityTracker()
    // And an Observed object variable
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10){
                ForEach(0..<self.priorityTracker.priority.count) { item in
                    //I seem to be having  a lot of trouble with this. Can scroll views not upadate?
                    Text("Priority \(item)")
                        .padding(10)
                    VStack {
                        VStack{
                            HStack{
                                HStack {
                                    Text("Subject:")
                                    Text(self.priorityTracker.priority["assignment\(item)"]!.sbjct)
                                        .opacity(0.5)
                                    // HStack with subject and response
                                }
                                .lineLimit(1)
                                .scaledToFit()
                                .minimumScaleFactor(0.1)
                                // subject box
                                Spacer(minLength: 10)
                                HStack {
                                    Text("Due Date:")
                                    Text(self.priorityTracker.priority["assignment\(item)"]!.date)
                                        .opacity(0.5)
                                    // HStack with due date and response
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
                                    Text(self.priorityTracker.priority["assignment\(item)"]!.type)
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
    @State var checklistView = CheckListView()
    
    
    
    // array of assignments
    @State private var subject = ""
    @State private var dueDate = Date()
    @State private var assignmentType = 0
    @State private var assignmentWorth = 0
    @State private var value = 0
    
    
    let types = ["essay", "worksheet", "reading", "study for test", "group project", "other"]
    // selection of different assignment types
    let points = ["minor assignment 5-10", "small assignment 15-25", "medium assignment 30-50", "large assignment 55-75", "major assignment 80-100" ]
    // selection of different points options
    
    
    
    var body: some View {
        NavigationView{
            
            Form{
                HStack(alignment: .center){
                    Text("Subject:")
                    TextField("NA", text: self.$subject)
                }
                //HStack with subject textfield
                
                DatePicker(selection: $dueDate, label: { Text("Due Date:") })
                // Allows pick due date
                
                Picker(selection: $assignmentType, label: Text("Assignment Type:")) {
                    ForEach(0 ..< types.count){ index in
                        Text(self.types[index]).tag(index)
                    }
                }
                // pick assignment type
                
                Picker(selection: $assignmentWorth, label: Text("Points Worth:")) {
                    ForEach(0 ..< points.count){ index in
                        Text(self.points[index]).tag(index)
                    }
                    // pick points worth
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    HStack{
                        Text("More Information")
                        Image(systemName: "pencil.and.ellipsis.rectangle")
                        
                    }
                }
                Button(action: {
                    let formatter1 = DateFormatter()
                    formatter1.dateStyle = .short
                    // formats date
                    switch self.assignmentWorth {
                    case 0:
                        self.value = 10
                    case 1:
                        self.value = 25
                    case 2:
                        self.value = 50
                    case 3:
                        self.value = 75
                    case 4:
                        self.value = 100
                    default:
                        print("error")
                    }
                    // converts chosen assignment point value to an an integer
                    
                    let assignment = VariableTracker(sbjct: self.subject, date: formatter1.string(from: self.dueDate), type: self.types[self.assignmentType], value: self.value)
                    print(assignment)
                    // creates a dictionary containing data imputted
                    self.checklistView.priorityTracker.priority.updateValue(assignment, forKey: "assignment\(self.checklistView.priorityTracker.assignments)")
                    
                    print(self.checklistView.priorityTracker.priority)
                    
                    self.checklistView.priorityTracker.assignments += 1
                    print(self.checklistView.priorityTracker.assignments)
                    // adds 1 to total # of assignments
                }) {
                    Text("Complete")
                }
            }
            .navigationBarTitle(Text("New Assignment"))
        }
    }
}
