//
//  ContentView.swift
//  To-Do List
//
//  Created by Aryan Jaiswal on 10/10/25.
//

import SwiftUI

//Mark: - Task Model
//Represents a single task in the to-do list
/// CONCEPT: Identifiable - Protocol that requires a unique 'id' property for SwiftUI to track items in lists
/// CONCEPT: Codable - Protocol that enables encoding/decoding to/from formats like JSON for data persistence

struct Task: Identifiable, Codable {
    var id: UUID //unique identifier for each task
    var title: String //task description
    var isCompleted: Bool // Tracks whether task is done
    
    init(id: UUID = UUID(), title : String, isCompleted: Bool=false){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}

//Mark: Main Content View
struct ContentView: View {
    
    @State private var tasks: [Task] = [] //array holding all task
    @State private var newTaskTitle: String = "" //input text field binding
    @State private var showingAlert = false //control alert visibility
    
    
    var body: some View {
        // CONCEPT: NavigationView - Container that provides navigation bar and title
        NavigationView{
            VStack{
                //Mark: Input Section
                //TextField for adding new tasks
                
                HStack{
                    TextField("Enter new task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    //Button - tappable view that triggers action
                    Button(action: addTask){
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                    .disabled(newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                
                // MARK: - Task List Section
                // CONCEPT: Conditional Views - SwiftUI's if/else for showing different UI based on state
                
                if tasks.isEmpty{
                    VStack(spacing:20){
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 60))
                            .foregroundColor(.gray.opacity(0.5))
                        
                        Text("No Tasks Yet")
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        Text("Add a task to get started!")
                            .font(.subheadline)
                            .foregroundColor(.gray.opacity(0.8))
                        
                    }
                    .frame(maxHeight: .infinity)
                } else {
                    
                    // CONCEPT: List - Container view for displaying scrollable rows of data
                    // Similar to UITableView in UIKit but declarative and automatic
                    
                    List{
                        
                        // CONCEPT: ForEach - Iterates over a collection to create multiple views
                        // Works with Identifiable items to track each row uniquely
                        
                        ForEach(tasks){ task in
                            TaskRowView(task: task, onToggle:{
                                toggleTaskCompletion(task)
                            })
                        }
                        // CONCEPT: onDelete - Modifier that enables swipe-to-delete gesture
                        // Passes IndexSet of items to delete to the handler function
                        .onDelete(perform: deleteTasks)
                        
                    }
                    // CONCEPT: listStyle() - Modifier that changes the appearance of List
                    .listStyle(InsetGroupedListStyle())
                }
            }
            // CONCEPT: navigationTitle() - Sets the title text in the navigation bar
            .navigationTitle("My Tasks")
            
            //Concept: toolbar - adds items to the navigation bar
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    // CONCEPT: EditButton - Built-in button that toggles edit mode in List
                    EditButton()
                }
            }
            // CONCEPT: alert() - Modifier that shows an alert dialog
            .alert("Task Added", isPresented: $showingAlert){
                Button("Ok", role: .cancel){}
            } message: {
                Text("Your task has been added successfully!")
            }
            // CONCEPT: onAppear - Lifecycle method called when view appears on screen
            // Used here to load saved data when app launches
            .onAppear {
                loadTasks()
            }
        }
    }
    
    // MARK: - Task Management Functions
    
    // Adds a new task to the list
    /// CONCEPT: Private functions - Encapsulate logic and keep implementation details hidden
    
    private func addTask(){
        let trimmedTitle = newTaskTitle.trimmingCharacters(in: .whitespaces)
        
        // CONCEPT: guard statement - Early exit if condition fails, improves readability
        
        guard !trimmedTitle.isEmpty else { return }
        
        let newTask = Task(title: trimmedTitle)
        // CONCEPT: Array mutation - Adding items to mutable array triggers @State update
        tasks.append(newTask)
        newTaskTitle = "" //Clear input field
        saveTasks() //Persists to userdefaults
        showingAlert = true
        
    }
    
    /// Toggles the completion status of a task
    /// CONCEPT: firstIndex(where:) - Functional programming method to find array element
    
    private func toggleTaskCompletion(_ task: Task){
        if let index = tasks.firstIndex(where: {$0.id == task.id}){
            // CONCEPT: toggle() - Boolean method that flips true/false value
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }
    
    /// Deletes tasks at specified indices
    /// CONCEPT: IndexSet - Collection of integer indices for batch operations
    
    private func deleteTasks(at offsets: IndexSet){
        // CONCEPT: remove(atOffsets:) - Array method that removes multiple items efficiently
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }
    
    // MARK: - Data Persistence with UserDefaults
    
    /// Saves tasks to UserDefaults for persistence
    /// CONCEPT: UserDefaults - Key-value storage system that persists data between app launches
    /// Ideal for small amounts of data like user preferences and simple app state
    
    private func saveTasks(){
        
        // CONCEPT: JSONEncoder - Converts Swift objects to JSON data format
        // CONCEPT: try? - Optional try that returns nil on error instead of throwing
        
        if let encoded = try? JSONEncoder().encode(tasks) {
            // CONCEPT: UserDefaults.standard - Singleton instance for accessing user defaults
            // CONCEPT: set(_:forKey:) - Stores data with a unique string key
            
            UserDefaults.standard.set(encoded, forKey: "SavedTasks")
        }
    }
    
    /// Loads tasks from UserDefaults on app launch
    /// CONCEPT: Data Decoding - Converting stored JSON back to Swift objects
    private func loadTasks(){
        // CONCEPT: data(forKey:) - Retrieves Data object from UserDefaults
        
        if let savedData = UserDefaults.standard.data(forKey: "SavedTasks") {
            // CONCEPT: JSONDecoder - Converts JSON data back to Swift objects
            if let decodedTasks = try? JSONDecoder().decode([Task].self, from: savedData) {
                tasks = decodedTasks
            }
        }
    }
    
    // MARK: - Task Row View
    /// Custom view for displaying individual task rows
    /// CONCEPT: View Composition - Breaking UI into smaller, reusable components
    
    struct TaskRowView: View {
        
        let task: Task //Immutable task data passed from parent
        let onToggle: () -> Void // CONCEPT: Closure - Function passed as parameter for callbacks
        
        var body: some View{
            HStack{
                // Checkbox button to mark task as complete/incomplete
                Button(action: onToggle){
                    // CONCEPT: Ternary operator - Compact if-else for conditional values
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .foregroundColor(task.isCompleted ? .green : .gray)
                }
                // CONCEPT: buttonStyle() - Changes button's interaction behavior
                .buttonStyle(PlainButtonStyle())
                
                // Task title with strikethrough if completed
                Text(task.title)
                // CONCEPT: strikethrough() - Text modifier for line-through effect
                    .strikethrough(task.isCompleted, color: .gray)
                    .foregroundColor(task.isCompleted ? .gray : .primary)
                    .padding(.leading, 8)
                
                Spacer()
            }
            .padding(.vertical, 8)
        }
    }
    
    
    // MARK: - Preview Provider
    /// CONCEPT: PreviewProvider - Protocol for Xcode canvas live preview
    /// Allows developers to see UI changes in real-time without running the app
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
