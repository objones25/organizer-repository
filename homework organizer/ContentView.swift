//
//  ContentView.swift
//  homework organizer
//
//  Created by Owen Jones on 4/15/20.
//  Copyright © 2020 Owen Jones. All rights reserved.
//

import SwiftUI

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
    @State private var assignments = 14
    @State private var subject = ""
    @State private var dueDate = ""
    @State private var assignmentType = ""
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10){
                ForEach(1..<assignments){
                    Text("Priority \($0)")
                    VStack {
                        VStack{
                            HStack{
                                HStack {
                                    Text("Subject:")
                                    TextField("NA", text: self.$subject)
                                }
                                .lineLimit(1)
                                .minimumScaleFactor(0.1)
                                HStack {
                                    Text("Due Date:")
                                    TextField("NA", text: self.$dueDate)
                                }
                                .lineLimit(1)
                                .minimumScaleFactor(0.1)
                            }
                            .padding(10)
                            HStack{
                                HStack{
                                    Text("Assignment Type:")
                                    TextField("NA", text: self.$assignmentType)
                                }
                                .lineLimit(1)
                                .minimumScaleFactor(0.1)
                                HStack{
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                        VStack{
                                            Image(systemName: "pencil.and.ellipsis.rectangle")
                                            Text("More Information")
                                        }
                                        
                                    }
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                        VStack{
                                            Image(systemName: "pencil.slash")
                                            Text("Complete Assignment")
                                        }
                                    }
                                }
                                .lineLimit(1)
                                .minimumScaleFactor(0.1)
                            }
                        }
                    }
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
    var body: some View {
        Text("")
    }
}
