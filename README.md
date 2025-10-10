# 📱 iOS App Development Journey

![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%2017+-lightgrey.svg)
![Xcode](https://img.shields.io/badge/Xcode-15+-blue.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Focused-green.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

> **This is my journey towards iOS Development** - Learning Swift, building apps, and mastering SwiftUI one project at a time! 🚀

## 👨‍💻 About This Repository

Welcome to my iOS development learning repository! This repo documents my journey as I learn iOS development with Swift and SwiftUI. Here you'll find various projects ranging from simple UI layouts to interactive games and practical utilities.

**Started:** October 2024  
**Current Status:** Actively Learning & Building  
**Projects Completed:** 4 (and counting!)

## 📂 Repository Structure

```
IOS-AppDevelopment/
│
├── My First App/              # First SwiftUI app - Tourist card UI
├── War Card Game/             # Interactive card game with game logic
├── BMI Calculator/            # Health utility app with state management
├── To-Do List/                # Task management app with data persistence
├── SwiftCodePlayground.playground/  # Swift fundamentals practice
├── README.md                  # This file
└── .DS_Store
```

## 🚀 Featured Projects

### 1. 🏞️ My First App - Tourist Card
**Created:** October 4, 2025  
**Tech Stack:** SwiftUI, ZStack, VStack, HStack

My very first SwiftUI application! A beautiful tourist card showcasing Niagara Falls.

**Skills Learned:**
- ✅ SwiftUI basic layout components (VStack, HStack, ZStack)
- ✅ Image handling and resizing with `.resizable()` and `.aspectRatio()`
- ✅ SF Symbols for system icons
- ✅ Styling with modifiers (`.cornerRadius()`, `.shadow()`, `.padding()`)
- ✅ Color management and `.ignoresSafeArea()`
- ✅ Text formatting and fonts
- ✅ Layout alignment and spacing

**Key Features:**
- 🎨 Custom card design with rounded corners and shadows
- ⭐ Star rating display using SF Symbols
- 📱 Responsive layout with proper spacing
- 🖼️ Image aspect ratio handling

**Code Highlights:**
```swift
// Layered layout with ZStack
ZStack {
    Color(.systemMint).ignoresSafeArea()
    VStack(alignment: .leading, spacing: 20.0) {
        // Card content with image, text, and icons
    }
}
```

---

### 2. 🃏 War Card Game
**Created:** October 4, 2025  
**Tech Stack:** SwiftUI, State Management, Game Logic

An interactive card game where you compete against the CPU! Draw cards and see who wins each round.

**Skills Learned:**
- ✅ `@State` property wrapper for state management
- ✅ Button actions and user interaction
- ✅ Function creation and game logic
- ✅ Random number generation with `Int.random(in:)`
- ✅ String interpolation and conversion
- ✅ Conditional logic (if-else statements)
- ✅ Variable mutation and score tracking

**Key Features:**
- 🎮 Interactive gameplay with button taps
- 🎲 Random card generation (values 2-14)
- 📊 Real-time score tracking for Player vs CPU
- 🎨 Custom game assets and background
- 🔄 Dynamic UI updates based on game state

**Code Highlights:**
```swift
@State var playerScore: Int = 0
@State var cpuScore: Int = 0

func deal() {
    let playerCardValue = Int.random(in: 2...14)
    let cpuCardValue = Int.random(in: 2...14)
    
    // Update scores based on comparison
    if playerCardValue > cpuCardValue {
        playerScore += 1
    }
}
```

---

### 3. 🏋️ BMI Calculator
**Created:** October 9, 2025  
**Tech Stack:** SwiftUI, Advanced State Management, Data Models, Animations

A comprehensive BMI (Body Mass Index) calculator supporting both Metric and Imperial units with beautiful animations and health advice.

**Skills Learned:**
- ✅ Complex state management with multiple `@State` properties
- ✅ `@Binding` for two-way data flow between views
- ✅ Custom reusable components
- ✅ Struct data models (`BMIResult`)
- ✅ Computed properties for validation
- ✅ Optional handling with `guard let` and `if let`
- ✅ Switch statements with range patterns
- ✅ Tuple return types
- ✅ String formatting with `String(format:)`
- ✅ Animations with `withAnimation()` and `.transition()`
- ✅ TextField with keyboard type customization
- ✅ Picker with SegmentedPickerStyle
- ✅ Conditional rendering
- ✅ Color opacity and shadow effects

**Key Features:**
- 📊 Real-time BMI calculation with validation
- 🌍 Support for Metric (kg/cm) and Imperial (lbs/in) units
- 🎨 Beautiful, modern UI with custom components
- 🎭 Animated result display with spring animation
- 💡 Color-coded health categories (Underweight, Normal, Overweight, Obese)
- 📝 Personalized health advice based on BMI
- ✨ Input validation with disabled state
- 🎯 Reusable InputFieldView component

**Code Highlights:**
```swift
// Computed property for validation
private var isInputValid: Bool {
    guard let w = Double(weight), let h = Double(height),
          w > 0, h > 0 else { return false }
    return true
}

// Tuple return for complex data
private func interpretBMI(_ bmi: Double) -> (category: String, color: Color, advice: String) {
    switch bmi {
    case ..<18.5:
        return ("Underweight", .blue, "You may need to gain weight...")
    case 18.5..<25:
        return ("Normal", .green, "Great! You're in a healthy weight range.")
    // ...
    }
}

// Smooth animations
withAnimation(.spring()) {
    showingResult = true
}
```

---

### 4. 📝 To-Do List App
**Created:** October 10, 2025  
**Tech Stack:** SwiftUI, UserDefaults, Codable, Data Persistence

A fully functional task management app with data persistence. Tasks are saved between app launches using UserDefaults!

**Skills Learned:**
- ✅ **Identifiable Protocol** - Unique identification for list items
- ✅ **Codable Protocol** - Encoding/decoding Swift objects to JSON
- ✅ **UserDefaults** - Persistent data storage between app sessions
- ✅ **JSONEncoder/JSONDecoder** - Converting objects to/from JSON
- ✅ **List and ForEach** - Creating scrollable, dynamic lists
- ✅ **onDelete modifier** - Swipe-to-delete functionality
- ✅ **EditButton** - Built-in edit mode for lists
- ✅ **Closure parameters** - Passing functions as callbacks
- ✅ **Array manipulation** - firstIndex(where:), remove(atOffsets:)
- ✅ **Optional try (try?)** - Safe error handling
- ✅ **guard statements** - Early exit validation
- ✅ **Ternary operators** - Concise conditional logic
- ✅ **onAppear lifecycle** - Loading data when view appears
- ✅ **Alert dialogs** - User feedback with alerts
- ✅ **Toolbar customization** - Adding buttons to navigation bar
- ✅ **View composition** - Creating reusable sub-views

**Key Features:**
- ✅ Add new tasks with input validation
- ✅ Mark tasks as complete/incomplete with checkboxes
- ✅ Swipe-to-delete tasks
- ✅ Edit mode for batch operations
- ✅ Data persistence with UserDefaults (tasks saved between launches)
- ✅ Empty state UI when no tasks exist
- ✅ Success alert when task is added
- ✅ Visual feedback (strikethrough for completed tasks)
- ✅ Clean, modern interface with grouped list style

**Code Highlights:**
```swift
// Data Model with Protocols
struct Task: Identifiable, Codable {
    var id: UUID
    var title: String
    var isCompleted: Bool
}

// Data Persistence
private func saveTasks() {
    if let encoded = try? JSONEncoder().encode(tasks) {
        UserDefaults.standard.set(encoded, forKey: "SavedTasks")
    }
}

private func loadTasks() {
    if let savedData = UserDefaults.standard.data(forKey: "SavedTasks") {
        if let decodedTasks = try? JSONDecoder().decode([Task].self, from: savedData) {
            tasks = decodedTasks
        }
    }
}

// Dynamic List with ForEach
List {
    ForEach(tasks) { task in
        TaskRowView(task: task, onToggle: {
            toggleTaskCompletion(task)
        })
    }
    .onDelete(perform: deleteTasks)
}
```

---

## 💡 Skills Acquired

### Swift Programming Fundamentals
- ✅ Variables and Constants (`var`, `let`)
- ✅ Data Types (String, Int, Double, Bool)
- ✅ Optionals and Optional Binding
- ✅ Functions and Parameters
- ✅ Control Flow (if-else, switch)
- ✅ Structs and Data Models
- ✅ Computed Properties
- ✅ Tuples
- ✅ String Interpolation and Formatting
- ✅ Random Number Generation
- ✅ Type Conversion

### SwiftUI Components
- ✅ **Layout:** VStack, HStack, ZStack, Spacer, Divider
- ✅ **Views:** Text, Image, Button, TextField, Picker
- ✅ **Styling:** `.padding()`, `.foregroundColor()`, `.font()`, `.background()`
- ✅ **Visual Effects:** `.cornerRadius()`, `.shadow()`, `.opacity()`
- ✅ **Modifiers:** `.resizable()`, `.aspectRatio()`, `.frame()`
- ✅ **System Assets:** SF Symbols
- ✅ **Navigation:** NavigationView, ScrollView

### State Management
- ✅ `@State` - Managing local state
- ✅ `@Binding` - Two-way data binding between views
- ✅ State mutations and UI updates
- ✅ Conditional rendering based on state

### Advanced Concepts
- ✅ Custom reusable components
- ✅ Component composition
- ✅ Data models with structs
- ✅ Input validation
- ✅ Animations and transitions
- ✅ Keyboard type customization
- ✅ Mathematical calculations
- ✅ Range patterns in switch statements
- ✅ **Protocols (Identifiable, Codable)**
- ✅ **UserDefaults for data persistence**
- ✅ **List and ForEach for dynamic content**
- ✅ **JSON encoding/decoding**
- ✅ **Closures as parameters**
- ✅ **Array functional methods**
- ✅ **Lifecycle methods (onAppear)**
- 🔄 MVVM Architecture (Upcoming)
- 🔄 Core Data (Upcoming)
- 🔄 Networking and APIs (Upcoming)

## 📚 Learning Resources

### Currently Using
- 📖 **100 Days of SwiftUI** by Paul Hudson (Hacking with Swift)
- 🎥 **YouTube Tutorials** - Various iOS development channels
- 📱 **Apple Developer Documentation** - Official SwiftUI guides
- 💻 **Xcode Playground** - Experimenting with Swift syntax

### Reference Materials
- [Apple's SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [Hacking with Swift](https://www.hackingwithswift.com/)
- [Swift Documentation](https://docs.swift.org/swift-book/)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)

## 🎯 Learning Path

### Phase 1: Foundations ✅ *(Completed)*
- [x] Set up Xcode and development environment
- [x] Learn Swift basics in Playground
- [x] Understand SwiftUI layout system
- [x] Build first UI with VStack/HStack/ZStack
- [x] Work with Images and SF Symbols

### Phase 2: Interactivity ✅ *(Completed)*
- [x] Learn @State for reactive updates
- [x] Implement button actions
- [x] Add game logic and calculations
- [x] Handle user input with TextField

### Phase 3: Advanced UI ✅ *(Completed)*
- [x] Create custom reusable components
- [x] Master @Binding for data flow
- [x] Implement form validation
- [x] Add animations and transitions
- [x] Build complex layouts

### Phase 4: Data Persistence ✅ *(Completed)*
- [x] Learn UserDefaults
- [x] Implement data saving and loading
- [x] Build To-Do List app
- [x] Understand data persistence patterns
- [x] Master Codable protocol
- [x] JSON encoding and decoding
- [x] Implement List and ForEach
- [x] Add swipe-to-delete functionality

### Phase 5: Architecture 🔄 *(Next Up)*
- [ ] Learn MVVM pattern
- [ ] Separate business logic from UI
- [ ] Implement ObservableObject
- [ ] Master @Published and @ObservedObject

### Phase 6: Advanced Features 📋 *(Upcoming)*
- [ ] Core Data for complex data
- [ ] Networking and API calls
- [ ] JSON parsing from APIs
- [ ] NavigationStack and routing
- [ ] Async/await for asynchronous operations

## 📊 Progress Statistics

| Metric | Count |
|--------|-------|
| **Projects Completed** | 4 |
| **Days of Learning** | 7 |
| **SwiftUI Views Mastered** | 20+ |
| **Lines of Code Written** | 800+ |
| **Concepts Learned** | 40+ |
| **Hours Invested** | 23+ |

## 🎓 Month-by-Month Progress

### October 2024
**Focus:** SwiftUI Fundamentals, State Management & Data Persistence

| Date | Project | Key Achievement |
|------|---------|----------------|
| Oct 4 | My First App | First SwiftUI app with custom layouts |
| Oct 4 | War Card Game | Implemented game logic and state management |
| Oct 9 | BMI Calculator | Advanced state management, custom components, animations |
| Oct 10 | To-Do List | Data persistence with UserDefaults, List views, Codable protocol |

**Skills This Month:**
- SwiftUI layout system
- State management (@State, @Binding)
- Custom components
- Animations
- Input validation
- Data modeling
- **Data persistence (UserDefaults)**
- **Protocols (Identifiable, Codable)**
- **JSON encoding/decoding**
- **List and ForEach**
- **Closures and callbacks**

## 🛠️ Development Setup

### Requirements
- **macOS:** 13.0 Ventura or later
- **Xcode:** 15.0 or later
- **iOS Deployment Target:** iOS 17.0+
- **Swift Version:** 5.9

### Getting Started

1. **Clone this repository**
   ```bash
   git clone https://github.com/DebugWithAryan/IOS-AppDevelopment.git
   cd IOS-AppDevelopment
   ```

2. **Open a project**
   ```bash
   cd "BMI Calculator"
   open *.xcodeproj
   ```

3. **Run in Simulator or Device**
   - Select your target device (iPhone 15 recommended)
   - Press `⌘ + R` or click the Play button
   - Explore and experiment!

## 📋 Upcoming Projects

- [ ] **Weather App** - API integration and JSON parsing from live weather data
- [ ] **Quiz App** - Multiple choice questions with scoring system
- [ ] **Expense Tracker** - Financial management with charts
- [ ] **Recipe Book** - Browse and save recipes with images
- [ ] **Habit Tracker** - Daily habit monitoring with streaks
- [ ] **Notes App** - Rich text editor with categories

## 🐛 Known Issues

Currently no known issues! All apps are functional and tested.

## 🏆 Achievements Unlocked

- 🎉 Built first iOS app
- 🎮 Created first game with logic
- 🏗️ Developed first utility app
- 📱 Mastered SwiftUI basics
- 🎨 Implemented custom UI components
- ⚡ Added animations and transitions
- ✅ Implemented input validation
- 💾 **Mastered data persistence with UserDefaults**
- 📋 **Built complete task management system**
- 🔄 **Implemented full CRUD operations (Create, Read, Update, Delete)**
- 📦 **Learned protocols and data encoding**

## 🤝 Contributing

While this is a personal learning repository, I'm open to:
- 💡 Suggestions for improvement
- 🐛 Bug reports
- 📚 Learning resources recommendations
- 🤝 Collaboration on practice projects

Feel free to open an issue or reach out!

## 📞 Connect With Me

- **GitHub:** [@DebugWithAryan](https://github.com/DebugWithAryan)
- **Email:** aryanjaiswal.work@gmail.com
- **Portfolio:** *Coming Soon*

## 💭 Reflections

### What I've Learned
Each project has taught me something valuable:
- **My First App** showed me how intuitive SwiftUI's declarative syntax is
- **War Card Game** taught me how state management makes apps interactive
- **BMI Calculator** demonstrated the power of component reusability and data modeling
- **To-Do List** revealed how data persistence works and how to build production-ready apps

### Challenges Overcome
- Understanding the difference between `@State` and `@Binding`
- Debugging layout issues with nested stacks
- Implementing proper input validation
- Managing optional values safely
- **Working with Codable protocol for JSON encoding/decoding**
- **Understanding UserDefaults lifecycle and data storage**
- **Implementing swipe-to-delete functionality**
- **Managing array indices safely during deletions**

### What's Next
I'm excited to explore networking and API integration to build a Weather App that fetches real-time data! After that, I'll dive deeper into Core Data for managing more complex data structures.

## 📄 License

This project is licensed under the MIT License - feel free to use any code for your own learning!

## 🙏 Acknowledgments

- **Paul Hudson** (Hacking with Swift) - Amazing tutorials
- **Apple Developer Documentation** - Comprehensive guides
- **iOS Development Community** - Endless support and inspiration
- **Stack Overflow** - Helping me debug those tricky issues!

---

<div align="center">

**⭐ Star this repo if you're also learning iOS development!**

*Let's learn together!*

**Last Updated:** October 10, 2024

Made with ❤️ and lots of ☕ by [Aryan Jaiswal](https://github.com/DebugWithAryan)

*"The journey of a thousand apps begins with a single View."* 🚀

</div>
