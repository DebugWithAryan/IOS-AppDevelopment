# 📘 SwiftUI Interview Questions - Complete Solutions

A comprehensive answer guide for SwiftUI interview preparation covering beginner to advanced concepts.

---

## 🧩 Section 1: My First App – SwiftUI Basics

### 🟢 Basic Questions

**1. What is SwiftUI, and how does it differ from UIKit?**

SwiftUI is Apple's modern declarative UI framework introduced in 2019. Key differences:

- **Declarative vs Imperative**: SwiftUI describes *what* the UI should look like, while UIKit describes *how* to build it step-by-step
- **Syntax**: SwiftUI uses Swift structs and body properties, UIKit uses classes and methods
- **State Management**: SwiftUI has built-in property wrappers (@State, @Binding), UIKit requires manual updates
- **Cross-platform**: SwiftUI works across iOS, macOS, watchOS, tvOS with minimal code changes
- **Preview**: SwiftUI has live canvas previews, UIKit requires running the simulator
- **Performance**: SwiftUI automatically optimizes view updates, UIKit requires manual optimization

**2. What is the role of the `View` protocol in SwiftUI?**

The `View` protocol is the fundamental building block of SwiftUI. Every UI component must conform to it by implementing a `body` property that returns `some View`. It defines:

- A blueprint for creating reusable UI components
- The contract that all SwiftUI views must fulfill
- Type-safe view composition through associated types
- Automatic view diffing and update mechanisms

```swift
struct MyView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

**3. How does `ZStack`, `VStack`, and `HStack` differ? Give real examples.**

- **VStack**: Arranges views vertically (top to bottom)
- **HStack**: Arranges views horizontally (left to right)
- **ZStack**: Layers views on top of each other (front to back, z-axis)

```swift
// VStack - Login form
VStack(spacing: 20) {
    TextField("Email", text: $email)
    SecureField("Password", text: $password)
    Button("Login") { }
}

// HStack - Navigation bar items
HStack {
    Button("Back") { }
    Spacer()
    Text("Title")
    Spacer()
    Button("Menu") { }
}

// ZStack - Profile picture with badge
ZStack(alignment: .topTrailing) {
    Image("profile")
        .resizable()
        .frame(width: 100, height: 100)
    Circle()
        .fill(Color.green)
        .frame(width: 20, height: 20)
}
```

**4. Why do we use `.ignoresSafeArea()` in SwiftUI layouts?**

`.ignoresSafeArea()` allows content to extend beyond the safe area boundaries (avoiding notches, status bars, home indicators). Use cases:

- Background images that should cover the entire screen
- Full-screen videos or immersive experiences
- Custom navigation bars or toolbars
- Splash screens

```swift
ZStack {
    Image("background")
        .resizable()
        .ignoresSafeArea() // Extends to screen edges
    
    VStack {
        Text("Content respects safe area")
    }
}
```

**5. Explain the difference between `.resizable()` and `.aspectRatio(contentMode:)`**

- **`.resizable()`**: Makes an image scalable (without it, images display at their original size)
- **`.aspectRatio(contentMode:)`**: Controls how the image fits within its frame
  - `.fit`: Scales to fit within bounds while maintaining aspect ratio
  - `.fill`: Scales to fill bounds, potentially cropping content

```swift
// Without resizable - shows original size
Image("photo")

// Resizable with fit - scales down proportionally
Image("photo")
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: 200, height: 200)

// Resizable with fill - crops to fill frame
Image("photo")
    .resizable()
    .aspectRatio(contentMode: .fill)
    .frame(width: 200, height: 200)
    .clipped()
```

**6. What does `.cornerRadius()` do, and how is it applied?**

`.cornerRadius()` rounds the corners of a view by the specified radius. It can be applied to any view including images, rectangles, and containers.

```swift
// Rounded image
Image("profile")
    .resizable()
    .frame(width: 100, height: 100)
    .cornerRadius(20)

// Rounded button
Button("Click Me") { }
    .padding()
    .background(Color.blue)
    .foregroundColor(.white)
    .cornerRadius(10)
```

**7. Why do we use `.foregroundColor()` and `.font()` modifiers, and what is the order of modifiers' importance?**

- **`.foregroundColor()`**: Sets the color of text, icons, and other foreground elements
- **`.font()`**: Sets the text font, size, and weight

**Modifier order matters**: Modifiers are applied from top to bottom, creating a chain of transformations.

```swift
// Order matters example
Text("Hello")
    .padding()           // First: adds padding
    .background(Color.blue)  // Second: blue background covers padding
    .cornerRadius(10)    // Third: rounds the background

Text("Hello")
    .background(Color.blue)  // First: tight background
    .padding()           // Second: padding outside blue background
    .cornerRadius(10)    // Third: doesn't affect background
```

**8. What is the purpose of `.shadow(radius:)`, and how does it affect the UI?**

`.shadow()` adds a drop shadow effect to create depth and visual hierarchy. Parameters:

- **radius**: Blur amount (larger = softer shadow)
- **x/y**: Shadow offset
- **color**: Shadow color

```swift
Text("Elevated Card")
    .padding()
    .background(Color.white)
    .cornerRadius(15)
    .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
```

**9. What's the difference between `Spacer()` and `padding()`?**

- **`Spacer()`**: Flexible space that expands to push views apart (used inside stacks)
- **`padding()`**: Fixed space added around a view's edges

```swift
// Spacer - pushes button to bottom
VStack {
    Text("Top")
    Spacer()  // Takes all available space
    Button("Bottom") { }
}

// Padding - adds space around view
Text("Padded")
    .padding()  // Adds fixed space on all sides
    .padding(.horizontal, 20)  // Additional horizontal padding
```

### 🟡 Intermediate Questions

**1. How do SF Symbols work in SwiftUI? What are their benefits?**

SF Symbols are Apple's icon library with over 5,000 symbols that:

- Scale automatically with text
- Support multiple weights and sizes
- Work across all Apple platforms
- Maintain consistent design language
- Support multicolor variants
- Adapt to Dark Mode automatically

```swift
// Basic usage
Image(systemName: "heart.fill")
    .foregroundColor(.red)

// With text alignment
Label("Favorites", systemImage: "star.fill")

// Custom size and weight
Image(systemName: "gear")
    .font(.system(size: 40, weight: .bold))
    .symbolRenderingMode(.multicolor)
```

**2. What is the use of alignment and spacing parameters in stacks?**

- **alignment**: Controls how views align perpendicular to stack direction
- **spacing**: Sets fixed distance between views

```swift
// VStack alignment (horizontal alignment)
VStack(alignment: .leading, spacing: 12) {
    Text("Title")
        .font(.headline)
    Text("Subtitle")
        .font(.subheadline)
}

// HStack alignment (vertical alignment)
HStack(alignment: .top, spacing: 20) {
    Image(systemName: "person.circle")
        .font(.largeTitle)
    VStack(alignment: .leading) {
        Text("John Doe")
        Text("Developer")
    }
}
```

**3. How do you make a card-style UI reusable for other destinations?**

Create a custom view struct that accepts parameters:

```swift
struct DestinationCard: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

// Usage
DestinationCard(
    imageName: "paris",
    title: "Paris",
    description: "The City of Light"
)
```

**4. What is the significance of `#Preview` in SwiftUI?**

`#Preview` (previously `PreviewProvider`) enables:

- Live canvas preview without running the app
- Multiple preview configurations
- Different device previews
- Light/Dark mode testing
- Various data states

```swift
#Preview {
    ContentView()
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}

#Preview("iPhone SE") {
    ContentView()
        .previewDevice("iPhone SE (3rd generation)")
}
```

**5. Explain the concept of Declarative UI using "My First App"**

Declarative UI means describing *what* the UI should look like, not *how* to build it:

```swift
// Declarative (SwiftUI) - What the UI should be
struct MyFirstApp: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Welcome to Paris")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

// vs Imperative (UIKit) - How to build the UI
class MyFirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        // ... manual frame calculations, constraints, etc.
        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        blueView.addSubview(imageView)
        // ... more manual layout code
    }
}
```

---

## 🎮 Section 2: War Card Game – State & Logic

### 🟢 Basic Questions

**1. What is the role of the `@State` property wrapper?**

`@State` creates a source of truth for view data that:

- Triggers view re-rendering when changed
- Is owned by the view
- Should be private to the view
- Persists across view updates
- Is stored in SwiftUI's memory, not the struct

```swift
struct GameView: View {
    @State private var score = 0  // Source of truth
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
            Button("Increase") {
                score += 1  // Automatically refreshes view
            }
        }
    }
}
```

**2. Why use `@State var playerCard` instead of regular variable?**

Regular variables in structs are immutable and can't trigger UI updates:

```swift
// ❌ Won't work - struct properties are immutable
struct GameView: View {
    var playerCard = "card7"  // Error: can't mutate
    
    var body: some View {
        Button("Deal") {
            playerCard = "card8"  // Compilation error
        }
    }
}

// ✅ Works - @State allows mutation and updates UI
struct GameView: View {
    @State private var playerCard = "card7"
    
    var body: some View {
        Button("Deal") {
            playerCard = "card8"  // UI automatically updates
        }
    }
}
```

**3. What is the function of ZStack in game layout?**

In the card game, `ZStack` layers the background image behind the game content:

```swift
ZStack {
    // Background layer
    Image("background")
        .resizable()
        .ignoresSafeArea()
    
    // Game content layer on top
    VStack {
        // Score, cards, button
    }
}
```

**4. How does SwiftUI automatically re-render when state changes?**

SwiftUI's rendering mechanism:

1. `@State` variable changes
2. SwiftUI marks the view as "dirty"
3. SwiftUI calls the `body` property
4. SwiftUI performs diffing on the old and new view trees
5. Only changed parts of the UI are updated
6. Changes are animated smoothly

This happens automatically without manual `reloadData()` or `setNeedsLayout()` calls.

### 🟡 Intermediate Questions

**1. Explain how the `deal()` function works**

```swift
@State private var playerCard = "card7"
@State private var cpuCard = "card8"
@State private var playerScore = 0
@State private var cpuScore = 0

func deal() {
    // Generate random card values (2-14, where 11=Jack, 12=Queen, etc.)
    let playerValue = Int.random(in: 2...14)
    let cpuValue = Int.random(in: 2...14)
    
    // Update card images
    playerCard = "card\(playerValue)"
    cpuCard = "card\(cpuValue)"
    
    // Compare and update scores
    if playerValue > cpuValue {
        playerScore += 1
    } else if cpuValue > playerValue {
        cpuScore += 1
    }
    // Tie: no score change
}
```

**2. Why use `Int.random(in: 2...14)` in game logic?**

Card values represent:
- 2-10: Number cards
- 11: Jack
- 12: Queen
- 13: King
- 14: Ace (highest value in War)

This range ensures we use standard playing card values and can directly map to image names like "card2", "card11", etc.

**3. How is score updated dynamically?**

Scores are `@State` variables that automatically trigger UI updates when modified:

```swift
@State private var playerScore = 0
@State private var cpuScore = 0

// In body
Text("Player: \(playerScore)")  // Automatically updates
Text("CPU: \(cpuScore)")        // Automatically updates

// When deal() changes these values, SwiftUI re-renders
```

**4. What happens internally when button is pressed?**

1. User taps button
2. Button's action closure executes (`deal()`)
3. State variables change inside `deal()`
4. SwiftUI detects state changes
5. `body` is re-evaluated
6. SwiftUI diffs the new view tree with old tree
7. Only changed elements (card images, scores) are updated
8. UI smoothly reflects new state

**5. How to show winner after each round?**

```swift
@State private var roundResult = ""

func deal() {
    let playerValue = Int.random(in: 2...14)
    let cpuValue = Int.random(in: 2...14)
    
    playerCard = "card\(playerValue)"
    cpuCard = "card\(cpuValue)"
    
    if playerValue > cpuValue {
        playerScore += 1
        roundResult = "Player Wins!"
    } else if cpuValue > playerValue {
        cpuScore += 1
        roundResult = "CPU Wins!"
    } else {
        roundResult = "Tie!"
    }
}

// In body
Text(roundResult)
    .font(.title)
    .foregroundColor(roundResult == "Player Wins!" ? .green : .red)
```

**6. How to persist player's score after app restart?**

Use `@AppStorage` instead of `@State`:

```swift
@AppStorage("playerScore") private var playerScore = 0
@AppStorage("cpuScore") private var cpuScore = 0

// Or use UserDefaults
@State private var playerScore = UserDefaults.standard.integer(forKey: "playerScore")

func deal() {
    // Update score logic
    playerScore += 1
    UserDefaults.standard.set(playerScore, forKey: "playerScore")
}
```

### 🔴 Advanced Questions

**1. Potential race conditions or performance issues?**

Issues:
- **Rapid button tapping**: Multiple `deal()` calls before animations complete
- **Random number generation**: Not cryptographically secure (use `SystemRandomNumberGenerator` for security)
- **View re-rendering**: Entire view re-renders on any state change

Solutions:
```swift
@State private var isDealing = false

func deal() {
    guard !isDealing else { return }
    isDealing = true
    
    // Deal logic with animation
    withAnimation(.spring()) {
        // Update cards
    }
    
    // Delay to prevent rapid tapping
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        isDealing = false
    }
}
```

**2. Refactor using MVVM architecture**

```swift
// Model
struct Card {
    let value: Int
    var imageName: String {
        "card\(value)"
    }
}

// ViewModel
class GameViewModel: ObservableObject {
    @Published var playerCard = Card(value: 7)
    @Published var cpuCard = Card(value: 8)
    @Published var playerScore = 0
    @Published var cpuScore = 0
    @Published var roundResult = ""
    
    func deal() {
        let playerValue = Int.random(in: 2...14)
        let cpuValue = Int.random(in: 2...14)
        
        playerCard = Card(value: playerValue)
        cpuCard = Card(value: cpuValue)
        
        if playerValue > cpuValue {
            playerScore += 1
            roundResult = "Player Wins!"
        } else if cpuValue > playerValue {
            cpuScore += 1
            roundResult = "CPU Wins!"
        } else {
            roundResult = "Tie!"
        }
    }
}

// View
struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            Text("Player: \(viewModel.playerScore)")
            Image(viewModel.playerCard.imageName)
            
            Button("Deal") {
                viewModel.deal()
            }
            
            Image(viewModel.cpuCard.imageName)
            Text("CPU: \(viewModel.cpuScore)")
        }
    }
}
```

**3. Animate card dealing with `withAnimation`**

```swift
func deal() {
    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
        let playerValue = Int.random(in: 2...14)
        let cpuValue = Int.random(in: 2...14)
        
        playerCard = "card\(playerValue)"
        cpuCard = "card\(cpuValue)"
    }
    
    // Delay score update for dramatic effect
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        withAnimation {
            if playerValue > cpuValue {
                playerScore += 1
            } else if cpuValue > playerValue {
                cpuScore += 1
            }
        }
    }
}

// Add rotation effect to cards
Image(playerCard)
    .rotation3DEffect(
        .degrees(isDealing ? 180 : 0),
        axis: (x: 0, y: 1, z: 0)
    )
```

**4. Structure for multiplayer gameplay over network**

```swift
// Network Manager
class NetworkManager: ObservableObject {
    @Published var opponentCard: Card?
    @Published var opponentScore = 0
    
    func sendCard(_ card: Card) {
        // Send to server via URLSession or WebSocket
    }
    
    func receiveCard() {
        // Receive from server and update opponentCard
    }
}

// Updated ViewModel
class MultiplayerGameViewModel: ObservableObject {
    @Published var localCard: Card?
    @Published var localScore = 0
    let networkManager: NetworkManager
    
    func deal() {
        let value = Int.random(in: 2...14)
        localCard = Card(value: value)
        networkManager.sendCard(localCard!)
        
        // Wait for opponent's card
        networkManager.receiveCard()
    }
}
```

**5. Difference between @State, @Binding, and @ObservedObject**

- **`@State`**: Source of truth owned by the view (private, local data)
  ```swift
  @State private var count = 0
  ```

- **`@Binding`**: Reference to a `@State` owned by parent view (two-way connection)
  ```swift
  struct ChildView: View {
      @Binding var count: Int
  }
  
  struct ParentView: View {
      @State private var count = 0
      var body: some View {
          ChildView(count: $count)  // Pass binding with $
      }
  }
  ```

- **`@ObservedObject`**: Reference to an external observable object (shared data)
  ```swift
  class GameData: ObservableObject {
      @Published var score = 0
  }
  
  struct GameView: View {
      @ObservedObject var gameData: GameData
  }
  ```

- **`@StateObject`**: Like `@ObservedObject` but view owns the object
  ```swift
  @StateObject private var gameData = GameData()
  ```

---

## 🧮 Section 3: BMI Calculator

### 🟢 Basic Questions

**1. Role of NavigationView in BMI Calculator**

`NavigationView` (now `NavigationStack` in iOS 16+) provides:
- Navigation bar at the top
- Title display
- Navigation between views
- Consistent navigation UI

```swift
NavigationView {
    VStack {
        // BMI input fields
    }
    .navigationTitle("BMI Calculator")
    .navigationBarTitleDisplayMode(.large)
}
```

**2. Why use `@State private var` for weight, height, selectedUnit?**

- **`@State`**: Makes variables mutable and triggers UI updates
- **`private`**: Encapsulates data within the view
- These values change based on user input and must re-render the UI

```swift
@State private var weight = ""
@State private var height = ""
@State private var selectedUnit = 0
```

**3. Purpose of computed properties like `isInputValid`**

Computed properties calculate values on-demand without storing them:

```swift
var isInputValid: Bool {
    guard let w = Double(weight), let h = Double(height) else {
        return false
    }
    return w > 0 && h > 0
}

// Used to disable button
Button("Calculate") { }
    .disabled(!isInputValid)
```

Benefits: No need to manually update validation, automatically recalculates when weight/height changes.

**4. What does Picker component do and how does it bind?**

`Picker` creates a selection interface bound to a state variable:

```swift
@State private var selectedUnit = 0
let units = ["Metric (kg/cm)", "Imperial (lb/in)"]

Picker("Unit System", selection: $selectedUnit) {
    ForEach(0..<units.count, id: \.self) { index in
        Text(units[index])
    }
}
.pickerStyle(.segmented)
```

The `$selectedUnit` binding means Picker can read AND write to the variable.

**5. Use of `.disabled()` and `.background()` modifiers**

```swift
Button("Calculate BMI") {
    calculateBMI()
}
.disabled(!isInputValid)  // Grays out and prevents interaction
.background(isInputValid ? Color.blue : Color.gray)  // Visual feedback
.foregroundColor(.white)
.cornerRadius(10)
```

---

### 🟡 Intermediate Questions

**1. BMI calculation logic for Metric vs Imperial**

```swift
func calculateBMI() {
    guard let w = Double(weight), let h = Double(height) else { return }
    
    var bmiValue: Double
    
    if selectedUnit == 0 {  // Metric
        // BMI = weight(kg) / height(m)²
        let heightInMeters = h / 100
        bmiValue = w / (heightInMeters * heightInMeters)
    } else {  // Imperial
        // BMI = (weight(lb) / height(in)²) × 703
        bmiValue = (w / (h * h)) * 703
    }
    
    bmi = bmiValue
}
```

**2. What does `guard let` ensure in `calculateBMI()`?**

`guard let` safely unwraps optionals and exits early if conversion fails:

```swift
func calculateBMI() {
    guard let w = Double(weight), let h = Double(height) else {
        // If weight or height can't convert to Double
        // Exit function immediately
        return
    }
    
    // Continue only if both conversions succeeded
    let bmi = w / (h * h)
}
```

Without `guard let`, the app would crash on invalid input.

**3. What is `withAnimation(.spring())` and how does it enhance UX?**

`withAnimation` animates state changes with smooth transitions:

```swift
@State private var showResult = false

Button("Calculate") {
    calculateBMI()
    withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
        showResult = true
    }
}

// Result card slides in smoothly
if showResult {
    ResultCardView(bmi: bmi)
        .transition(.move(edge: .bottom))
}
```

Spring animation adds bounce for natural feel, improving perceived app quality.

**4. Structure and purpose of BMIResult model**

```swift
struct BMIResult {
    let value: Double
    let category: String
    let color: Color
    let advice: String
    
    init(bmi: Double) {
        self.value = bmi
        
        switch bmi {
        case ..<18.5:
            category = "Underweight"
            color = .blue
            advice = "Consider eating more nutritious meals"
        case 18.5..<25:
            category = "Normal"
            color = .green
            advice = "Great! Keep maintaining your healthy lifestyle"
        case 25..<30:
            category = "Overweight"
            color = .orange
            advice = "Consider more exercise and balanced diet"
        default:
            category = "Obese"
            color = .red
            advice = "Consult a healthcare professional"
        }
    }
}
```

Benefits:
- Encapsulates BMI logic
- Separates data from UI
- Makes testing easier
- Reusable across views

**5. Why create `ResultCardView` as separate struct?**

Advantages of modularization:

```swift
struct ResultCardView: View {
    let result: BMIResult
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(result.value, specifier: "%.1f")")
                .font(.system(size: 60, weight: .bold))
            Text(result.category)
                .font(.title)
            Text(result.advice)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(result.color.opacity(0.2))
        .cornerRadius(20)
    }
}
```

Benefits:
- **Reusability**: Use in multiple screens
- **Testability**: Test result card independently
- **Readability**: Main view is cleaner
- **Maintainability**: Changes only affect one component
- **Performance**: SwiftUI can optimize rendering

**6. Role of optional binding (`if let`) in showing result card**

```swift
@State private var bmiResult: BMIResult?

var body: some View {
    VStack {
        // Input fields
        
        if let result = bmiResult {
            ResultCardView(result: result)
        }
    }
}

func calculateBMI() {
    let bmi = // calculation
    bmiResult = BMIResult(bmi: bmi)  // Shows card
}
```

Benefits:
- Card only appears when result exists
- Safe unwrapping prevents crashes
- Clean conditional UI rendering

---

### 🔴 Advanced Questions

**1. Refactor BMI Calculator using MVVM pattern**

```swift
// Model
struct BMIResult {
    let value: Double
    let category: String
    let color: Color
    let advice: String
}

// ViewModel
class BMICalculatorViewModel: ObservableObject {
    @Published var weight = ""
    @Published var height = ""
    @Published var selectedUnit = 0
    @Published var bmiResult: BMIResult?
    
    let units = ["Metric (kg/cm)", "Imperial (lb/in)"]
    
    var isInputValid: Bool {
        guard let w = Double(weight), let h = Double(height) else {
            return false
        }
        return w > 0 && h > 0
    }
    
    func calculateBMI() {
        guard let w = Double(weight), let h = Double(height) else { return }
        
        let bmiValue: Double
        if selectedUnit == 0 {
            let heightInMeters = h / 100
            bmiValue = w / (heightInMeters * heightInMeters)
        } else {
            bmiValue = (w / (h * h)) * 703
        }
        
        bmiResult = createBMIResult(from: bmiValue)
    }
    
    private func createBMIResult(from bmi: Double) -> BMIResult {
        let category: String
        let color: Color
        let advice: String
        
        switch bmi {
        case ..<18.5:
            category = "Underweight"
            color = .blue
            advice = "Consider eating more nutritious meals"
        case 18.5..<25:
            category = "Normal"
            color = .green
            advice = "Great! Keep it up!"
        case 25..<30:
            category = "Overweight"
            color = .orange
            advice = "Consider more exercise"
        default:
            category = "Obese"
            color = .red
            advice = "Consult a healthcare professional"
        }
        
        return BMIResult(value: bmi, category: category, color: color, advice: advice)
    }
    
    func reset() {
        weight = ""
        height = ""
        bmiResult = nil
    }
}

// View
struct BMICalculatorView: View {
    @StateObject private var viewModel = BMICalculatorViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Picker("Unit", selection: $viewModel.selectedUnit) {
                    ForEach(0..<viewModel.units.count, id: \.self) { i in
                        Text(viewModel.units[i])
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Weight", text: $viewModel.weight)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Height", text: $viewModel.height)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                
                Button("Calculate BMI") {
                    viewModel.calculateBMI()
                }
                .disabled(!viewModel.isInputValid)
                .buttonStyle(.borderedProminent)
                
                if let result = viewModel.bmiResult {
                    ResultCardView(result: result)
                        .transition(.scale.combined(with: .opacity))
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("BMI Calculator")
        }
    }
}
```

**2. Validate numeric input in real-time while typing**

```swift
class BMICalculatorViewModel: ObservableObject {
    @Published var weight = "" {
        didSet {
            weight = sanitizeInput(weight, maxLength: 6)
        }
    }
    
    @Published var height = "" {
        didSet {
            height = sanitizeInput(height, maxLength: 6)
        }
    }
    
    private func sanitizeInput(_ input: String, maxLength: Int) -> String {
        // Remove non-numeric characters except decimal point
        let filtered = input.filter { $0.isNumber || $0 == "." }
        
        // Ensure only one decimal point
        let components = filtered.components(separatedBy: ".")
        if components.count > 2 {
            return String(filtered.dropLast())
        }
        
        // Limit length
        if filtered.count > maxLength {
            return String(filtered.prefix(maxLength))
        }
        
        return filtered
    }
    
    var weightError: String? {
        guard !weight.isEmpty else { return nil }
        guard let w = Double(weight), w > 0 else {
            return "Please enter valid weight"
        }
        if selectedUnit == 0 && w > 500 {
            return "Weight seems too high"
        }
        return nil
    }
}

// In View
VStack(alignment: .leading) {
    TextField("Weight", text: $viewModel.weight)
        .keyboardType(.decimalPad)
        .textFieldStyle(.roundedBorder)
    
    if let error = viewModel.weightError {
        Text(error)
            .font(.caption)
            .foregroundColor(.red)
    }
}
```

**3. Persist previous BMI result using AppStorage or UserDefaults**

```swift
// Using @AppStorage (simpler)
class BMICalculatorViewModel: ObservableObject {
    @AppStorage("lastBMI") private var lastBMI: Double?
    @AppStorage("lastWeight") private var lastWeight = ""
    @AppStorage("lastHeight") private var lastHeight = ""
    
    @Published var weight = ""
    @Published var height = ""
    @Published var bmiResult: BMIResult?
    
    init() {
        // Load saved values
        weight = lastWeight
        height = lastHeight
        if let savedBMI = lastBMI {
            bmiResult = createBMIResult(from: savedBMI)
        }
    }
    
    func calculateBMI() {
        // ... calculation logic
        
        // Save values
        lastBMI = bmiValue
        lastWeight = weight
        lastHeight = height
    }
}

// Using UserDefaults with Codable (for complex data)
struct BMIHistory: Codable {
    let date: Date
    let bmi: Double
    let weight: String
    let height: String
}

class BMICalculatorViewModel: ObservableObject {
    @Published var history: [BMIHistory] = []
    
    init() {
        loadHistory()
    }
    
    func saveResult() {
        let entry = BMIHistory(
            date: Date(),
            bmi: bmiResult?.value ?? 0,
            weight: weight,
            height: height
        )
        history.insert(entry, at: 0)
        
        if let encoded = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(encoded, forKey: "bmiHistory")
        }
    }
    
    func loadHistory() {
        if let data = UserDefaults.standard.data(forKey: "bmiHistory"),
           let decoded = try? JSONDecoder().decode([BMIHistory].self, from: data) {
            history = decoded
        }
    }
}
```

**4. Add chart view to visualize BMI history**

```swift
import Charts

struct BMIHistoryView: View {
    let history: [BMIHistory]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("BMI History")
                .font(.headline)
            
            Chart(history) { entry in
                LineMark(
                    x: .value("Date", entry.date),
                    y: .value("BMI", entry.bmi)
                )
                .foregroundStyle(.blue)
                .interpolationMethod(.catmullRom)
                
                PointMark(
                    x: .value("Date", entry.date),
                    y: .value("BMI", entry.bmi)
                )
                .foregroundStyle(.blue)
            }
            .frame(height: 200)
            .chartYScale(domain: 15...35)
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartXAxis {
                AxisMarks(values: .automatic) { value in
                    AxisValueLabel(format: .dateTime.month().day())
                }
            }
            
            // BMI category reference lines
            RuleMark(y: .value("Normal Min", 18.5))
                .foregroundStyle(.green.opacity(0.3))
            RuleMark(y: .value("Normal Max", 25))
                .foregroundStyle(.green.opacity(0.3))
        }
        .padding()
    }
}

// In main view
if !viewModel.history.isEmpty {
    BMIHistoryView(history: viewModel.history)
}
```

**5. Explain data flow in SwiftUI**

SwiftUI has a unidirectional data flow:

```swift
// @State - Single view ownership
struct CounterView: View {
    @State private var count = 0  // Source of truth
    
    var body: some View {
        Button("Count: \(count)") {
            count += 1  // Modifies state → triggers re-render
        }
    }
}

// @Binding - Parent-child communication
struct ParentView: View {
    @State private var count = 0  // Parent owns data
    
    var body: some View {
        VStack {
            Text("Total: \(count)")
            ChildView(count: $count)  // Pass binding
        }
    }
}

struct ChildView: View {
    @Binding var count: Int  // Two-way binding
    
    var body: some View {
        Button("Increment") {
            count += 1  // Updates parent's state
        }
    }
}

// @ObservedObject - External reference object
class UserSettings: ObservableObject {
    @Published var username = ""  // Published triggers updates
    @Published var isDarkMode = false
}

struct SettingsView: View {
    @ObservedObject var settings: UserSettings  // Passed from parent
    
    var body: some View {
        TextField("Name", text: $settings.username)
    }
}

// @StateObject - View owns the observable object
struct AppView: View {
    @StateObject private var settings = UserSettings()  // View creates and owns
    
    var body: some View {
        SettingsView(settings: settings)  // Pass to children
    }
}

// @EnvironmentObject - Shared across view hierarchy
class AppState: ObservableObject {
    @Published var isLoggedIn = false
}

@main
struct MyApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)  // Inject at root
        }
    }
}

struct DeepChildView: View {
    @EnvironmentObject var appState: AppState  // Access anywhere
    
    var body: some View {
        Text(appState.isLoggedIn ? "Welcome" : "Login")
    }
}
```

**Flow Summary:**
1. **@State** → Single view data
2. **@Binding** → Child receives reference to parent's @State
3. **@StateObject** → View creates and owns ObservableObject
4. **@ObservedObject** → View receives ObservableObject reference
5. **@EnvironmentObject** → Global shared data across hierarchy

**6. Test BMI logic separately from UI**

```swift
import XCTest

class BMICalculatorTests: XCTestCase {
    var viewModel: BMICalculatorViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = BMICalculatorViewModel()
    }
    
    func testMetricBMICalculation() {
        // Given
        viewModel.weight = "70"
        viewModel.height = "175"
        viewModel.selectedUnit = 0
        
        // When
        viewModel.calculateBMI()
        
        // Then
        XCTAssertNotNil(viewModel.bmiResult)
        XCTAssertEqual(viewModel.bmiResult?.value ?? 0, 22.86, accuracy: 0.01)
        XCTAssertEqual(viewModel.bmiResult?.category, "Normal")
    }
    
    func testImperialBMICalculation() {
        // Given
        viewModel.weight = "154"  // ~70kg
        viewModel.height = "69"   // ~175cm
        viewModel.selectedUnit = 1
        
        // When
        viewModel.calculateBMI()
        
        // Then
        XCTAssertNotNil(viewModel.bmiResult)
        XCTAssertEqual(viewModel.bmiResult?.value ?? 0, 22.74, accuracy: 0.1)
    }
    
    func testInvalidInputValidation() {
        // Given
        viewModel.weight = "abc"
        viewModel.height = "175"
        
        // Then
        XCTAssertFalse(viewModel.isInputValid)
    }
    
    func testUnderweightCategory() {
        // Given
        viewModel.weight = "50"
        viewModel.height = "175"
        viewModel.selectedUnit = 0
        
        // When
        viewModel.calculateBMI()
        
        // Then
        XCTAssertEqual(viewModel.bmiResult?.category, "Underweight")
    }
    
    func testOverweightCategory() {
        // Given
        viewModel.weight = "85"
        viewModel.height = "175"
        viewModel.selectedUnit = 0
        
        // When
        viewModel.calculateBMI()
        
        // Then
        XCTAssertEqual(viewModel.bmiResult?.category, "Overweight")
    }
}
```

**7. Difference between computed properties and functions**

```swift
// Computed Property
struct Person {
    var firstName: String
    var lastName: String
    
    // Computed property - no parameters, accessed like property
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    // Usage
    let person = Person(firstName: "John", lastName: "Doe")
    print(person.fullName)  // No parentheses
}

// Function
struct Calculator {
    // Function - can take parameters, must use parentheses
    func add(_ a: Int, _ b: Int) -> Int {
        a + b
    }
    
    // Usage
    let calc = Calculator()
    print(calc.add(5, 3))  // Requires parentheses
}

// When to use what:
// Computed Property:
// ✓ Logically a property of the object
// ✓ No parameters needed
// ✓ Fast computation (no heavy work)
// ✓ Deterministic (same input → same output)
var isInputValid: Bool {
    !weight.isEmpty && !height.isEmpty
}

// Function:
// ✓ Performs an action or operation
// ✓ Requires parameters
// ✓ May have side effects
// ✓ May be expensive computation
func calculateBMI(weight: Double, height: Double) -> Double {
    weight / (height * height)
}
```

**8. How SwiftUI manages view lifecycle when states update**

```swift
struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        // This is called EVERY time count changes
        print("Body evaluated")  // For debugging only
        
        return VStack {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1  // Triggers re-evaluation
            }
        }
    }
    
    // This is NOT called again (struct is value type)
    init() {
        print("View initialized")  // Called once
    }
}
```

**Lifecycle Flow:**

1. **Initial Render:**
   - View struct is created
   - `body` is evaluated
   - View tree is built
   - UI is rendered

2. **State Change:**
   - State variable modified
   - SwiftUI marks view as dirty
   - `body` is re-evaluated (NOT the entire struct)
   - New view tree is created
   - Diffing algorithm compares old vs new tree
   - Only changed elements are updated in UI

3. **View Identity:**
   - SwiftUI tracks views by their position and type
   - `.id()` modifier can force new identity
   - Identity changes cause view to be destroyed and recreated

```swift
// Example of view lifecycle with onAppear/onDisappear
struct LifecycleView: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Button("Toggle") {
                showDetails.toggle()
            }
            
            if showDetails {
                DetailView()
                    .onAppear {
                        print("DetailView appeared")
                    }
                    .onDisappear {
                        print("DetailView disappeared")
                    }
            }
        }
    }
}
```

---

## 🧠 Bonus: Conceptual & Logical Mixed Questions

**1. Key principles of reactive programming in SwiftUI**

Reactive programming principles:

- **Data as Streams**: State changes flow through the app
- **Automatic Updates**: UI reacts to data changes automatically
- **Declarative**: Describe what, not how
- **Immutability**: State changes create new values, don't mutate
- **Unidirectional Flow**: Data flows one direction (down), events flow up

```swift
// Reactive example
class DataStore: ObservableObject {
    @Published var items: [String] = []  // Stream of data
    
    func addItem(_ item: String) {
        items.append(item)  // Emit new value
        // All subscribers automatically notified
    }
}

struct ListView: View {
    @StateObject private var store = DataStore()
    
    var body: some View {
        // UI automatically reacts to items changes
        List(store.items, id: \.self) { item in
            Text(item)
        }
    }
}
```

**2. How SwiftUI handles diffing and view identity**

SwiftUI uses a sophisticated diffing algorithm:

```swift
// View identity is based on type and position
VStack {
    Text("First")   // Identity: VStack[0]
    Text("Second")  // Identity: VStack[1]
}

// When content changes:
VStack {
    Text("Updated First")  // Same identity → Update in place
    Text("Second")         // Same identity → No change
}

// Explicit identity with .id()
struct ContentView: View {
    @State private var userId = 0
    
    var body: some View {
        UserProfileView(userId: userId)
            .id(userId)  // New identity when userId changes
            // Forces complete recreation of UserProfileView
    }
}

// ForEach identity
struct ItemList: View {
    let items: [Item]
    
    var body: some View {
        ForEach(items) { item in  // Uses item.id for identity
            ItemRow(item: item)
        }
    }
}

// Without proper identity
ForEach(items.indices, id: \.self) { index in
    // ⚠️ Can cause issues if array changes
    ItemRow(item: items[index])
}

// Correct identity
ForEach(items, id: \.id) { item in
    // ✅ Stable identity even if array reorders
    ItemRow(item: item)
}
```

**3. Debug state changes in SwiftUI effectively**

Debugging techniques:

```swift
// 1. Print statements in computed properties
var body: some View {
    let _ = print("Body evaluated, count: \(count)")
    return Text("Count: \(count)")
}

// 2. Custom binding with logging
extension Binding {
    func log(_ message: String) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: {
                print("\(message): \($0)")
                self.wrappedValue = $0
            }
        )
    }
}

// Usage
TextField("Name", text: $name.log("Name changed"))

// 3. View modifiers for debugging
extension View {
    func debug() -> Self {
        print("View updated: \(type(of: self))")
        return self
    }
}

// 4. Instruments and SwiftUI Inspector
// Use Xcode's Debug View Hierarchy
// Time Profiler to check performance
// SwiftUI Inspector (Cmd + Click on simulator)

// 5. Custom environment values for debug mode
struct DebugModeKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    var debugMode: Bool {
        get { self[DebugModeKey.self] }
        set { self[DebugModeKey.self] = newValue }
    }
}

// Usage
struct ContentView: View {
    @Environment(\.debugMode) var debugMode
    
    var body: some View {
        VStack {
            if debugMode {
                Text("Debug: State count = \(count)")
                    .foregroundColor(.red)
            }
        }
    }
}
```

**4. Explain binding between parent and child views**

```swift
// Parent owns the source of truth
struct ParentView: View {
    @State private var username = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack {
            // Pass binding to child with $ prefix
            InputField(text: $username)
            
            // Child can read and modify parent's state
            LoginButton(isLoggedIn: $isLoggedIn)
            
            // Parent sees changes immediately
            if isLoggedIn {
                Text("Welcome, \(username)!")
            }
        }
    }
}

// Child receives binding
struct InputField: View {
    @Binding var text: String  // Two-way binding
    
    var body: some View {
        TextField("Username", text: $text)
            // Changes here update parent's @State
    }
}

struct LoginButton: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        Button("Login") {
            isLoggedIn = true  // Modifies parent's state
        }
    }
}

// Custom binding example
struct ParentView: View {
    @State private var celsius: Double = 0
    
    // Computed binding for Fahrenheit
    private var fahrenheitBinding: Binding<Double> {
        Binding(
            get: { celsius * 9/5 + 32 },
            set: { celsius = ($0 - 32) * 5/9 }
        )
    }
    
    var body: some View {
        VStack {
            TemperatureInput(title: "Celsius", value: $celsius)
            TemperatureInput(title: "Fahrenheit", value: fahrenheitBinding)
        }
    }
}
```

**5. Best practices for clean, reusable SwiftUI components**

```swift
// 1. Single Responsibility
// ❌ Bad - does too much
struct UserView: View {
    var body: some View {
        VStack {
            // Profile image logic
            // Bio text logic
            // Posts list logic
            // Settings button logic
        }
    }
}

// ✅ Good - separated concerns
struct UserView: View {
    var body: some View {
        VStack {
            ProfileHeader()
            PostsList()
            SettingsButton()
        }
    }
}

// 2. Parameterization for reusability
struct CardView: View {
    let title: String
    let subtitle: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        VStack {
            Image(image)
            Text(title)
            Text(subtitle)
            Button("Action", action: action)
        }
    }
}

// 3. View modifiers for consistent styling
extension View {
    func cardStyle() -> some View {
        self
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
    }
}

// 4. Composition over inheritance
struct Button: View {
    let style: ButtonStyle
    let action: () -> Void
    
    enum ButtonStyle {
        case primary, secondary, destructive
        
        var color: Color {
            switch self {
            case .primary: return .blue
            case .secondary: return .gray
            case .destructive: return .red
            }
        }
    }
}

// 5. Environment values for theming
struct Theme {
    var primaryColor: Color
    var fontSize: CGFloat
}

struct ThemeKey: EnvironmentKey {
    static let defaultValue = Theme(primaryColor: .blue, fontSize: 16)
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

// 6. PreferenceKeys for child-to-parent communication
struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
```

**6. Performance optimization with frequent state changes**

```swift
// 1. Use @State only for UI-specific data
// ❌ Bad
@State private var apiData: [HeavyObject] = []

// ✅ Good
@StateObject private var viewModel = ViewModel()

// 2. Minimize body re-evaluations
// ❌ Bad - recreates on every change
var body: some View {
    let processedData = heavyComputation(data)
    return List(processedData) { item in }
}

// ✅ Good - cache computed values
@State private var processedData: [Item] = []

func updateData() {
    processedData = heavyComputation(data)
}

// 3. Use Equatable to prevent unnecessary updates
struct Item: Identifiable, Equatable {
    let id: UUID
    let name: String
    // SwiftUI only updates if Item actually changed
}

// 4. LazyVStack/LazyHStack for long lists
// ❌ Bad - loads all items immediately
ScrollView {
    VStack {
        ForEach(1000items) { item in
            ItemView(item: item)
        }
    }
}

// ✅ Good - loads items on demand
ScrollView {
    LazyVStack {
        ForEach(items) { item in
            ItemView(item: item)
        }
    }
}

// 5. @ViewBuilder for conditional views
@ViewBuilder
func contentView() -> some View {
    if condition {
        ViewA()
    } else {
        ViewB()
    }
}

// 6. Task cancellation for async work
.task(id: searchText) {
    // Automatically cancelled when searchText changes
    await performSearch(searchText)
}

// 7. Debouncing rapid changes
class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] text in
                self?.performSearch(text)
            }
            .store(in: &cancellables)
    }
}
```

**7. Implement dark mode compatibility**

```swift
// 1. Use semantic colors
// ❌ Bad - doesn't adapt
.foregroundColor(.black)

// ✅ Good - adapts to color scheme
.foregroundColor(.primary)  // Black in light, white in dark
.foregroundColor(.secondary)

// 2. Custom colors with dark mode support
extension Color {
    static let customBackground = Color("CustomBackground")
    // In Assets.xcassets, set Appearance: Any, Dark
}

// 3. Environment color scheme
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("Hello")
            .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}

// 4. Force override color scheme
ContentView()
    .preferredColorScheme(.dark)  // Always dark

// 5. Preview both modes
#Preview("Light") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}

// 6. Dynamic images
Image("logo")  // In Assets, set Appearance variations
```

**8. @State vs @Binding vs @StateObject vs @EnvironmentObject**

Complete comparison:

```swift
// @State - View owns simple value
struct CounterView: View {
    @State private var count = 0  // Owned by this view
    
    var body: some View {
        Button("Count: \(count)") {
            count += 1
        }
    }
}
// Use when: Simple value types, owned by single view

// @Binding - Reference to parent's @State
struct ParentView: View {
    @State private var isOn = false
    
    var body: some View {
        ToggleView(isOn: $isOn)  // Pass binding
    }
}

struct ToggleView: View {
    @Binding var isOn: Bool  // Doesn't own, just references
    
    var body: some View {
        Toggle("Switch", isOn: $isOn)
    }
}
// Use when: Child needs to modify parent's state

// @StateObject - View owns ObservableObject
struct RootView: View {
    @StateObject private var store = DataStore()  // Created here
    
    var body: some View {
        ChildView(store: store)
    }
}
// Use when: View creates and owns the object

// @ObservedObject - Reference to ObservableObject
struct ChildView: View {
    @ObservedObject var store: DataStore  // Passed from parent
    
    var body: some View {
        Text(store.data)
    }
}
// Use when: Object passed from parent, view doesn't own it

// @EnvironmentObject - Shared across hierarchy
@main
struct MyApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
        }
    }
}

struct DeepChildView: View {
    @EnvironmentObject var appState: AppState
    // No need to pass through intermediate views
}
// Use when: Global state needed across many views

// Summary table:
// @State          | Owns value      | Simple types  | Single view
// @Binding        | References      | Any type      | Parent-child
// @StateObject    | Owns object     | ObservableObject | View lifecycle
// @ObservedObject | References obj  | ObservableObject | Passed reference
// @EnvironmentObject | References  | ObservableObject | Global access
```

---

## 🎯 Final Tips for Interviews

1. **Understand the "Why"**: Don't just memorize syntax, understand why SwiftUI was designed this way
2. **Compare with UIKit**: Show you understand both paradigms
3. **Code Examples**: Always provide practical examples
4. **Trade-offs**: Discuss pros and cons of different approaches
5. **Real-world**: Relate answers to production app considerations
6. **Stay Current**: SwiftUI evolves rapidly, mention latest features when relevant

---

## ✅ Section 4: To-Do List App – Data Persistence, Lists & Advanced Concepts

### 🟢 Basic Questions

**1. What is the `Identifiable` protocol, and why is it important in SwiftUI?**

`Identifiable` is a protocol that requires a unique `id` property. It's crucial for SwiftUI to:
- Track individual items in collections (List, ForEach)
- Perform efficient updates and animations
- Maintain view identity across state changes
- Enable features like swipe-to-delete

```swift
// Without Identifiable - manual ID specification
struct Task {
    var id: UUID
    var title: String
}

ForEach(tasks, id: \.id) { task in  // Must specify id
    Text(task.title)
}

// With Identifiable - automatic tracking
struct Task: Identifiable {
    var id: UUID
    var title: String
}

ForEach(tasks) { task in  // No id needed
    Text(task.title)
}
```

**2. What is the `Codable` protocol, and why is it used in the Task model?**

`Codable` is a type alias for `Encodable & Decodable` protocols that enable:
- Converting Swift objects to JSON, PropertyList, or other formats
- Saving data to UserDefaults, files, or network
- Loading saved data back into Swift objects
- Automatic serialization/deserialization

```swift
struct Task: Codable {
    var id: UUID
    var title: String
    var isCompleted: Bool
}

// Encoding (Swift → JSON)
let task = Task(id: UUID(), title: "Learn SwiftUI", isCompleted: false)
if let encoded = try? JSONEncoder().encode(task) {
    // Save encoded data
}

// Decoding (JSON → Swift)
if let decoded = try? JSONDecoder().decode(Task.self, from: data) {
    // Use decoded task
}
```

**3. What is the difference between `@State` in this app vs previous apps?**

In the To-Do List app, `@State` manages more complex data:

```swift
// Simple value (previous apps)
@State private var count = 0
@State private var name = ""

// Collection of custom types (To-Do List)
@State private var tasks: [Task] = []

// Array mutations trigger UI updates
tasks.append(newTask)  // Entire list re-renders
tasks[0].isCompleted.toggle()  // Specific row updates
tasks.remove(at: 0)  // Row removed with animation
```

All array operations automatically trigger view updates because `@State` observes the entire array.

**4. What is `NavigationView`, and what does it provide?**

`NavigationView` (deprecated in iOS 16+, use `NavigationStack`) creates a navigation container that provides:

- **Navigation bar** at the top
- **Title display** via `.navigationTitle()`
- **Toolbar items** via `.toolbar()`
- **Navigation between screens** via `NavigationLink`
- **Back button** automatically

```swift
NavigationView {
    List(items) { item in
        Text(item.name)
    }
    .navigationTitle("Items")
    .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button("Add") { }
        }
    }
}

// iOS 16+ modern approach
NavigationStack {
    List(items) { item in
        NavigationLink(item.name, value: item)
    }
    .navigationDestination(for: Item.self) { item in
        DetailView(item: item)
    }
}
```

**5. How does the `TextField` binding work with `$newTaskTitle`?**

The `# 📘 SwiftUI Interview Questions - Complete Solutions

A comprehensive answer guide for SwiftUI interview preparation covering beginner to advanced concepts.

---

## 🧩 Section 1: My First App – SwiftUI Basics

### 🟢 Basic Questions

**1. What is SwiftUI, and how does it differ from UIKit?**

SwiftUI is Apple's modern declarative UI framework introduced in 2019. Key differences:

- **Declarative vs Imperative**: SwiftUI describes *what* the UI should look like, while UIKit describes *how* to build it step-by-step
- **Syntax**: SwiftUI uses Swift structs and body properties, UIKit uses classes and methods
- **State Management**: SwiftUI has built-in property wrappers (@State, @Binding), UIKit requires manual updates
- **Cross-platform**: SwiftUI works across iOS, macOS, watchOS, tvOS with minimal code changes
- **Preview**: SwiftUI has live canvas previews, UIKit requires running the simulator
- **Performance**: SwiftUI automatically optimizes view updates, UIKit requires manual optimization

**2. What is the role of the `View` protocol in SwiftUI?**

The `View` protocol is the fundamental building block of SwiftUI. Every UI component must conform to it by implementing a `body` property that returns `some View`. It defines:

- A blueprint for creating reusable UI components
- The contract that all SwiftUI views must fulfill
- Type-safe view composition through associated types
- Automatic view diffing and update mechanisms

```swift
struct MyView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

**3. How does `ZStack`, `VStack`, and `HStack` differ? Give real examples.**

- **VStack**: Arranges views vertically (top to bottom)
- **HStack**: Arranges views horizontally (left to right)
- **ZStack**: Layers views on top of each other (front to back, z-axis)

```swift
// VStack - Login form
VStack(spacing: 20) {
    TextField("Email", text: $email)
    SecureField("Password", text: $password)
    Button("Login") { }
}

// HStack - Navigation bar items
HStack {
    Button("Back") { }
    Spacer()
    Text("Title")
    Spacer()
    Button("Menu") { }
}

// ZStack - Profile picture with badge
ZStack(alignment: .topTrailing) {
    Image("profile")
        .resizable()
        .frame(width: 100, height: 100)
    Circle()
        .fill(Color.green)
        .frame(width: 20, height: 20)
}
```

**4. Why do we use `.ignoresSafeArea()` in SwiftUI layouts?**

`.ignoresSafeArea()` allows content to extend beyond the safe area boundaries (avoiding notches, status bars, home indicators). Use cases:

- Background images that should cover the entire screen
- Full-screen videos or immersive experiences
- Custom navigation bars or toolbars
- Splash screens

```swift
ZStack {
    Image("background")
        .resizable()
        .ignoresSafeArea() // Extends to screen edges
    
    VStack {
        Text("Content respects safe area")
    }
}
```

**5. Explain the difference between `.resizable()` and `.aspectRatio(contentMode:)`**

- **`.resizable()`**: Makes an image scalable (without it, images display at their original size)
- **`.aspectRatio(contentMode:)`**: Controls how the image fits within its frame
  - `.fit`: Scales to fit within bounds while maintaining aspect ratio
  - `.fill`: Scales to fill bounds, potentially cropping content

```swift
// Without resizable - shows original size
Image("photo")

// Resizable with fit - scales down proportionally
Image("photo")
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: 200, height: 200)

// Resizable with fill - crops to fill frame
Image("photo")
    .resizable()
    .aspectRatio(contentMode: .fill)
    .frame(width: 200, height: 200)
    .clipped()
```

**6. What does `.cornerRadius()` do, and how is it applied?**

`.cornerRadius()` rounds the corners of a view by the specified radius. It can be applied to any view including images, rectangles, and containers.

```swift
// Rounded image
Image("profile")
    .resizable()
    .frame(width: 100, height: 100)
    .cornerRadius(20)

// Rounded button
Button("Click Me") { }
    .padding()
    .background(Color.blue)
    .foregroundColor(.white)
    .cornerRadius(10)
```

**7. Why do we use `.foregroundColor()` and `.font()` modifiers, and what is the order of modifiers' importance?**

- **`.foregroundColor()`**: Sets the color of text, icons, and other foreground elements
- **`.font()`**: Sets the text font, size, and weight

**Modifier order matters**: Modifiers are applied from top to bottom, creating a chain of transformations.

```swift
// Order matters example
Text("Hello")
    .padding()           // First: adds padding
    .background(Color.blue)  // Second: blue background covers padding
    .cornerRadius(10)    // Third: rounds the background

Text("Hello")
    .background(Color.blue)  // First: tight background
    .padding()           // Second: padding outside blue background
    .cornerRadius(10)    // Third: doesn't affect background
```

**8. What is the purpose of `.shadow(radius:)`, and how does it affect the UI?**

`.shadow()` adds a drop shadow effect to create depth and visual hierarchy. Parameters:

- **radius**: Blur amount (larger = softer shadow)
- **x/y**: Shadow offset
- **color**: Shadow color

```swift
Text("Elevated Card")
    .padding()
    .background(Color.white)
    .cornerRadius(15)
    .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
```

**9. What's the difference between `Spacer()` and `padding()`?**

- **`Spacer()`**: Flexible space that expands to push views apart (used inside stacks)
- **`padding()`**: Fixed space added around a view's edges

```swift
// Spacer - pushes button to bottom
VStack {
    Text("Top")
    Spacer()  // Takes all available space
    Button("Bottom") { }
}

// Padding - adds space around view
Text("Padded")
    .padding()  // Adds fixed space on all sides
    .padding(.horizontal, 20)  // Additional horizontal padding
```

### 🟡 Intermediate Questions

**1. How do SF Symbols work in SwiftUI? What are their benefits?**

SF Symbols are Apple's icon library with over 5,000 symbols that:

- Scale automatically with text
- Support multiple weights and sizes
- Work across all Apple platforms
- Maintain consistent design language
- Support multicolor variants
- Adapt to Dark Mode automatically

```swift
// Basic usage
Image(systemName: "heart.fill")
    .foregroundColor(.red)

// With text alignment
Label("Favorites", systemImage: "star.fill")

// Custom size and weight
Image(systemName: "gear")
    .font(.system(size: 40, weight: .bold))
    .symbolRenderingMode(.multicolor)
```

**2. What is the use of alignment and spacing parameters in stacks?**

- **alignment**: Controls how views align perpendicular to stack direction
- **spacing**: Sets fixed distance between views

```swift
// VStack alignment (horizontal alignment)
VStack(alignment: .leading, spacing: 12) {
    Text("Title")
        .font(.headline)
    Text("Subtitle")
        .font(.subheadline)
}

// HStack alignment (vertical alignment)
HStack(alignment: .top, spacing: 20) {
    Image(systemName: "person.circle")
        .font(.largeTitle)
    VStack(alignment: .leading) {
        Text("John Doe")
        Text("Developer")
    }
}
```

**3. How do you make a card-style UI reusable for other destinations?**

Create a custom view struct that accepts parameters:

```swift
struct DestinationCard: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

// Usage
DestinationCard(
    imageName: "paris",
    title: "Paris",
    description: "The City of Light"
)
```

**4. What is the significance of `#Preview` in SwiftUI?**

`#Preview` (previously `PreviewProvider`) enables:

- Live canvas preview without running the app
- Multiple preview configurations
- Different device previews
- Light/Dark mode testing
- Various data states

```swift
#Preview {
    ContentView()
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}

#Preview("iPhone SE") {
    ContentView()
        .previewDevice("iPhone SE (3rd generation)")
}
```

**5. Explain the concept of Declarative UI using "My First App"**

Declarative UI means describing *what* the UI should look like, not *how* to build it:

```swift
// Declarative (SwiftUI) - What the UI should be
struct MyFirstApp: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Welcome to Paris")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

// vs Imperative (UIKit) - How to build the UI
class MyFirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        // ... manual frame calculations, constraints, etc.
        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        blueView.addSubview(imageView)
        // ... more manual layout code
    }
}
```

---

## 🎮 Section 2: War Card Game – State & Logic

### 🟢 Basic Questions

**1. What is the role of the `@State` property wrapper?**

`@State` creates a source of truth for view data that:

- Triggers view re-rendering when changed
- Is owned by the view
- Should be private to the view
- Persists across view updates
- Is stored in SwiftUI's memory, not the struct

```swift
struct GameView: View {
    @State private var score = 0  // Source of truth
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
            Button("Increase") {
                score += 1  // Automatically refreshes view
            }
        }
    }
}
```

**2. Why use `@State var playerCard` instead of regular variable?**

Regular variables in structs are immutable and can't trigger UI updates:

```swift
// ❌ Won't work - struct properties are immutable
struct GameView: View {
    var playerCard = "card7"  // Error: can't mutate
    
    var body: some View {
        Button("Deal") {
            playerCard = "card8"  // Compilation error
        }
    }
}

// ✅ Works - @State allows mutation and updates UI
struct GameView: View {
    @State private var playerCard = "card7"
    
    var body: some View {
        Button("Deal") {
            playerCard = "card8"  // UI automatically updates
        }
    }
}
```

**3. What is the function of ZStack in game layout?**

In the card game, `ZStack` layers the background image behind the game content:

```swift
ZStack {
    // Background layer
    Image("background")
        .resizable()
        .ignoresSafeArea()
    
    // Game content layer on top
    VStack {
        // Score, cards, button
    }
}
```

**4. How does SwiftUI automatically re-render when state changes?**

SwiftUI's rendering mechanism:

1. `@State` variable changes
2. SwiftUI marks the view as "dirty"
3. SwiftUI calls the `body` property
4. SwiftUI performs diffing on the old and new view trees
5. Only changed parts of the UI are updated
6. Changes are animated smoothly

This happens automatically without manual `reloadData()` or `setNeedsLayout()` calls.

### 🟡 Intermediate Questions

**1. Explain how the `deal()` function works**

```swift
@State private var playerCard = "card7"
@State private var cpuCard = "card8"
@State private var playerScore = 0
@State private var cpuScore = 0

func deal() {
    // Generate random card values (2-14, where 11=Jack, 12=Queen, etc.)
    let playerValue = Int.random(in: 2...14)
    let cpuValue = Int.random(in: 2...14)
    
    // Update card images
    playerCard = "card\(playerValue)"
    cpuCard = "card\(cpuValue)"
    
    // Compare and update scores
    if playerValue > cpuValue {
        playerScore += 1
    } else if cpuValue > playerValue {
        cpuScore += 1
    }
    // Tie: no score change
}
```

**2. Why use `Int.random(in: 2...14)` in game logic?**

Card values represent:
- 2-10: Number cards
- 11: Jack
- 12: Queen
- 13: King
- 14: Ace (highest value in War)

This range ensures we use standard playing card values and can directly map to image names like "card2", "card11", etc.

**3. How is score updated dynamically?**

Scores are `@State` variables that automatically trigger UI updates when modified:

```swift
@State private var playerScore = 0
@State private var cpuScore = 0

// In body
Text("Player: \(playerScore)")  // Automatically updates
Text("CPU: \(cpuScore)")        // Automatically updates

// When deal() changes these values, SwiftUI re-renders
```

**4. What happens internally when button is pressed?**

1. User taps button
2. Button's action closure executes (`deal()`)
3. State variables change inside `deal()`
4. SwiftUI detects state changes
5. `body` is re-evaluated
6. SwiftUI diffs the new view tree with old tree
7. Only changed elements (card images, scores) are updated
8. UI smoothly reflects new state

**5. How to show winner after each round?**

```swift
@State private var roundResult = ""

func deal() {
    let playerValue = Int.random(in: 2...14)
    let cpuValue = Int.random(in: 2...14)
    
    playerCard = "card\(playerValue)"
    cpuCard = "card\(cpuValue)"
    
    if playerValue > cpuValue {
        playerScore += 1
        roundResult = "Player Wins!"
    } else if cpuValue > playerValue {
        cpuScore += 1
        roundResult = "CPU Wins!"
    } else {
        roundResult = "Tie!"
    }
}

// In body
Text(roundResult)
    .font(.title)
    .foregroundColor(roundResult == "Player Wins!" ? .green : .red)
```

**6. How to persist player's score after app restart?**

Use `@AppStorage` instead of `@State`:

```swift
@AppStorage("playerScore") private var playerScore = 0
@AppStorage("cpuScore") private var cpuScore = 0

// Or use UserDefaults
@State private var playerScore = UserDefaults.standard.integer(forKey: "playerScore")

func deal() {
    // Update score logic
    playerScore += 1
    UserDefaults.standard.set(playerScore, forKey: "playerScore")
}
```

### 🔴 Advanced Questions

**1. Potential race conditions or performance issues?**

Issues:
- **Rapid button tapping**: Multiple `deal()` calls before animations complete
- **Random number generation**: Not cryptographically secure (use `SystemRandomNumberGenerator` for security)
- **View re-rendering**: Entire view re-renders on any state change

Solutions:
```swift
@State private var isDealing = false

func deal() {
    guard !isDealing else { return }
    isDealing = true
    
    // Deal logic with animation
    withAnimation(.spring()) {
        // Update cards
    }
    
    // Delay to prevent rapid tapping
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        isDealing = false
    }
}
```

**2. Refactor using MVVM architecture**

```swift
// Model
struct Card {
    let value: Int
    var imageName: String {
        "card\(value)"
    }
}

// ViewModel
class GameViewModel: ObservableObject {
    @Published var playerCard = Card(value: 7)
    @Published var cpuCard = Card(value: 8)
    @Published var playerScore = 0
    @Published var cpuScore = 0
    @Published var roundResult = ""
    
    func deal() {
        let playerValue = Int.random(in: 2...14)
        let cpuValue = Int.random(in: 2...14)
        
        playerCard = Card(value: playerValue)
        cpuCard = Card(value: cpuValue)
        
        if playerValue > cpuValue {
            playerScore += 1
            roundResult = "Player Wins!"
        } else if cpuValue > playerValue {
            cpuScore += 1
            roundResult = "CPU Wins!"
        } else {
            roundResult = "Tie!"
        }
    }
}

// View
struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            Text("Player: \(viewModel.playerScore)")
            Image(viewModel.playerCard.imageName)
            
            Button("Deal") {
                viewModel.deal()
            }
            
            Image(viewModel.cpuCard.imageName)
            Text("CPU: \(viewModel.cpuScore)")
        }
    }
}
```

**3. Animate card dealing with `withAnimation`**

```swift
func deal() {
    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
        let playerValue = Int.random(in: 2...14)
        let cpuValue = Int.random(in: 2...14)
        
        playerCard = "card\(playerValue)"
        cpuCard = "card\(cpuValue)"
    }
    
    // Delay score update for dramatic effect
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        withAnimation {
            if playerValue > cpuValue {
                playerScore += 1
            } else if cpuValue > playerValue {
                cpuScore += 1
            }
        }
    }
}

// Add rotation effect to cards
Image(playerCard)
    .rotation3DEffect(
        .degrees(isDealing ? 180 : 0),
        axis: (x: 0, y: 1, z: 0)
    )
```

**4. Structure for multiplayer gameplay over network**

```swift
// Network Manager
class NetworkManager: ObservableObject {
    @Published var opponentCard: Card?
    @Published var opponentScore = 0
    
    func sendCard(_ card: Card) {
        // Send to server via URLSession or WebSocket
    }
    
    func receiveCard() {
        // Receive from server and update opponentCard
    }
}

// Updated ViewModel
class MultiplayerGameViewModel: ObservableObject {
    @Published var localCard: Card?
    @Published var localScore = 0
    let networkManager: NetworkManager
    
    func deal() {
        let value = Int.random(in: 2...14)
        localCard = Card(value: value)
        networkManager.sendCard(localCard!)
        
        // Wait for opponent's card
        networkManager.receiveCard()
    }
}
```

**5. Difference between @State, @Binding, and @ObservedObject**

- **`@State`**: Source of truth owned by the view (private, local data)
  ```swift
  @State private var count = 0
  ```

- **`@Binding`**: Reference to a `@State` owned by parent view (two-way connection)
  ```swift
  struct ChildView: View {
      @Binding var count: Int
  }
  
  struct ParentView: View {
      @State private var count = 0
      var body: some View {
          ChildView(count: $count)  // Pass binding with $
      }
  }
  ```

- **`@ObservedObject`**: Reference to an external observable object (shared data)
  ```swift
  class GameData: ObservableObject {
      @Published var score = 0
  }
  
  struct GameView: View {
      @ObservedObject var gameData: GameData
  }
  ```

- **`@StateObject`**: Like `@ObservedObject` but view owns the object
  ```swift
  @StateObject private var gameData = GameData()
  ```

---

## 🧮 Section 3: BMI Calculator

### 🟢 Basic Questions

**1. Role of NavigationView in BMI Calculator**

`NavigationView` (now `NavigationStack` in iOS 16+) provides:
- Navigation bar at the top
- Title display
- Navigation between views
- Consistent navigation UI

```swift
NavigationView {
    VStack {
        // BMI input fields
    }
    .navigationTitle("BMI Calculator")
    .navigationBarTitleDisplayMode(.large)
}
```

**2. Why use `@State private var` for weight, height, selectedUnit?**

- **`@State`**: Makes variables mutable and triggers UI updates
- **`private`**: Encapsulates data within the view
- These values change based on user input and must re-render the UI

```swift
@State private var weight = ""
@State private var height = ""
@State private var selectedUnit = 0
```

**3. Purpose of computed properties like `isInputValid`**

Computed properties calculate values on-demand without storing them:

```swift
var isInputValid: Bool {
    guard let w = Double(weight), let h = Double(height) else {
        return false
    }
    return w > 0 && h > 0
}

// Used to disable button
Button("Calculate") { }
    .disabled(!isInputValid)
```

Benefits: No need to manually update validation, automatically recalculates when weight/height changes.

**4. What does Picker component do and how does it bind?**

`Picker` creates a selection interface bound to a state variable:

```swift
@State private var selectedUnit = 0
let units = ["Metric (kg/cm)", "Imperial (lb/in)"]

Picker("Unit System", selection: $selectedUnit) {
    ForEach(0..<units.count, id: \.self) { index in
        Text(units[index])
    }
}
.pickerStyle(.segmented)
```

The `$selectedUnit` binding means Picker can read AND write to the variable.

**5. Use of `.disabled()` and `.background()` modifiers**

```swift
Button("Calculate BMI") {
    calculateBMI()
}
.disabled(!isInputValid)  // Grays out and prevents interaction
.background(isInputValid ? Color.blue : Color.gray)  // Visual feedback
.foregroundColor(.white)
.cornerRadius(10)
```

---

### 🟡 Intermediate Questions

**1. BMI calculation logic for Metric vs Imperial**

```swift
func calculateBMI() {
    guard let w = Double(weight), let h = Double(height) else { return }
    
    var bmiValue: Double
    
    if selectedUnit == 0 {  // Metric
        // BMI = weight(kg) / height(m)²
        let heightInMeters = h / 100
        bmiValue = w / (heightInMeters * heightInMeters)
    } else {  // Imperial
        // BMI = (weight(lb) / height(in)²) × 703
        bmiValue = (w / (h * h)) * 703
    }
    
    bmi = bmiValue
}
```

**2. What does `guard let` ensure in `calculateBMI()`?**

`guard let` safely unwraps optionals and exits early if conversion fails:

```swift
func calculateBMI() {
    guard let w = Double(weight), let h = Double(height) else {
        // If weight or height can't convert to Double
        // Exit function immediately
        return
    }
    
    // Continue only if both conversions succeeded
    let bmi = w / (h * h)
}
```

Without `guard let`, the app would crash on invalid input.

**3. What is `withAnimation(.spring())` and how does it enhance UX?**

`withAnimation` animates state changes with smooth transitions:

```swift
@State private var showResult = false

Button("Calculate") {
    calculateBMI()
    withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
        showResult = true
    }
}

// Result card slides in smoothly
if showResult {
    ResultCardView(bmi: bmi)
        .transition(.move(edge: .bottom))
}
```

Spring animation adds bounce for natural feel, improving perceived app quality.

**4. Structure and purpose of BMIResult model**

```swift
struct BMIResult {
    let value: Double
    let category: String
    let color: Color
    let advice: String
    
    init(bmi: Double) {
        self.value = bmi
        
        switch bmi {
        case ..<18.5:
            category = "Underweight"
            color = .blue
            advice = "Consider eating more nutritious meals"
        case 18.5..<25:
            category = "Normal"
            color = .green
            advice = "Great! Keep maintaining your healthy lifestyle"
        case 25..<30:
            category = "Overweight"
            color = .orange
            advice = "Consider more exercise and balanced diet"
        default:
            category = "Obese"
            color = .red
            advice = "Consult a healthcare professional"
        }
    }
}
```

Benefits:
- Encapsulates BMI logic
- Separates data from UI
- Makes testing easier
- Reusable across views

**5. Why create `ResultCardView` as separate struct?**

Advantages of modularization:

```swift
struct ResultCardView: View {
    let result: BMIResult
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(result.value, specifier: "%.1f")")
                .font(.system(size: 60, weight: .bold))
            Text(result.category)
                .font(.title)
            Text(result.advice)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(result.color.opacity(0.2))
        .cornerRadius(20)
    }
}
```

Benefits:
- **Reusability**: Use in multiple screens
- **Testability**: Test result card independently
- **Readability**: Main view is cleaner
- **Maintainability**: Changes only affect one component
- **Performance**: SwiftUI can optimize rendering

**6. Role of optional binding (`if let`) in showing result card**

```swift
@State private var bmiResult: BMIResult?

var body: some View {
    VStack {
        // Input fields
        
        if let result = bmiResult {
            ResultCardView(result: result)
        }
    }
}

func calculateBMI() {
    let bmi = // calculation
    bmiResult = BMIResult(bmi: bmi)  // Shows card
}
```

Benefits:
- Card only appears when result exists
- Safe unwrapping prevents crashes
- Clean conditional UI rendering

---

### 🔴 Advanced Questions

**1. Refactor BMI Calculator using MVVM pattern**

```swift
// Model
struct BMIResult {
    let value: Double
    let category: String
    let color: Color
    let advice: String
}

// ViewModel
class BMICalculatorViewModel: ObservableObject {
    @Published var weight = ""
    @Published var height = ""
    @Published var selectedUnit = 0
    @Published var bmiResult: BMIResult?
    
    let units = ["Metric (kg/cm)", "Imperial (lb/in)"]
    
    var isInputValid: Bool {
        guard let w = Double(weight), let h = Double(height) else {
            return false
        }
        return w > 0 && h > 0
    }
    
    func calculateBMI() {
        guard let w = Double(weight), let h = Double(height) else { return }
        
        let bmiValue: Double
        if selectedUnit == 0 {
            let heightInMeters = h / 100
            bmiValue = w / (heightInMeters * heightInMeters)
        } else {
            bmiValue = (w / (h * h)) * 703
        }
        
        bmiResult = createBMIResult(from: bmiValue)
    }
    
    private func createBMIResult(from bmi: Double) -> BMIResult {
        let category: String
        let color: Color
        let advice: String
        
        switch bmi {
        case ..<18.5:
            category = "Underweight"
            color = .blue
            advice = "Consider eating more nutritious meals"
        case 18.5..<25:
            category = "Normal"
            color = .green
            advice = "Great! Keep it up!"
        case 25..<30:
            category = "Overweight"
            color = .orange
            advice = "Consider more exercise"
        default:
            category = "Obese"
            color = .red
            advice = "Consult a healthcare professional"
        }
        
        return BMIResult(value: bmi, category: category, color: color, advice: advice)
    }
    
    func reset() {
        weight = ""
        height = ""
        bmiResult = nil
    }
}

// View
struct BMICalculatorView: View {
    @StateObject private var viewModel = BMICalculatorViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Picker("Unit", selection: $viewModel.selectedUnit) {
                    ForEach(0..<viewModel.units.count, id: \.self) { i in
                        Text(viewModel.units[i])
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Weight", text: $viewModel.weight)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Height", text: $viewModel.height)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                
                Button("Calculate BMI") {
                    viewModel.calculateBMI()
                }
                .disabled(!viewModel.isInputValid)
                .buttonStyle(.borderedProminent)
                
                if let result = viewModel.bmiResult {
                    ResultCardView(result: result)
                        .transition(.scale.combined(with: .opacity))
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("BMI Calculator")
        }
    }
}
```

**2. Validate numeric input in real-time while typing**

```swift
class BMICalculatorViewModel: ObservableObject {
    @Published var weight = "" {
        didSet {
            weight = sanitizeInput(weight, maxLength: 6)
        }
    }
    
    @Published var height = "" {
        didSet {
            height = sanitizeInput(height, maxLength: 6)
        }
    }
    
    private func sanitizeInput(_ input: String, maxLength: Int) -> String {
        // Remove non-numeric characters except decimal point
        let filtered = input.filter { $0.isNumber || $0 == "." }
        
        // Ensure only one decimal point
        let components = filtered.components(separatedBy: ".")
        if components.count > 2 {
            return String(filtered.dropLast())
        }
        
        // Limit length
        if filtered.count > maxLength {
            return String(filtered.prefix(maxLength))
        }
        
        return filtered
    }
    
    var weightError: String? {
        guard !weight.isEmpty else { return nil }
        guard let w = Double(weight), w > 0 else {
            return "Please enter valid weight"
        }
        if selectedUnit == 0 && w > 500 {
            return "Weight seems too high"
        }
        return nil
    }
}

// In View
VStack(alignment: .leading) {
    TextField("Weight", text: $viewModel.weight)
        .keyboardType(.decimalPad)
        .textFieldStyle(.roundedBorder)
    
    if let error = viewModel.weightError {
        Text(error)
            .font(.caption)
            .foregroundColor(.red)
    }
}
```

**3. Persist previous BMI result using AppStorage or UserDefaults**

```swift
// Using @AppStorage (simpler)
class BMICalculatorViewModel: ObservableObject {
    @AppStorage("lastBMI") private var lastBMI: Double?
    @AppStorage("lastWeight") private var lastWeight = ""
    @AppStorage("lastHeight") private var lastHeight = ""
    
    @Published var weight = ""
    @Published var height = ""
    @Published var bmiResult: BMIResult?
    
    init() {
        // Load saved values
        weight = lastWeight
        height = lastHeight
        if let savedBMI = lastBMI {
            bmiResult = createBMIResult(from: savedBMI)
        }
    }
    
    func calculateBMI() {
        // ... calculation logic
        
        // Save values
        lastBMI = bmiValue
        lastWeight = weight
        lastHeight = height
    }
}

// Using UserDefaults with Codable (for complex data)
struct BMIHistory: Codable {
    let date: Date
    let bmi: Double
    let weight: String
    let height: String
}

class BMICalculatorViewModel: ObservableObject {
    @Published var history: [BMIHistory] = []
    
    init() {
        loadHistory()
    }
    
    func saveResult() {
        let entry = BMIHistory(
            date: Date(),
            bmi: bmiResult?.value ?? 0,
            weight: weight,
            height: height
        )
        history.insert(entry, at: 0)
        
        if let encoded = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(encoded, forKey: "bmiHistory")
        }
    }
    
    func loadHistory() {
        if let data = UserDefaults.standard.data(forKey: "bmiHistory"),
           let decoded = try? JSONDecoder().decode([BMIHistory].self, from: data) {
            history = decoded
        }
    }
}
```

**4. Add chart view to visualize BMI history**

```swift
import Charts

struct BMIHistoryView: View {
    let history: [BMIHistory]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("BMI History")
                .font(.headline)
            
            Chart(history) { entry in
                LineMark(
                    x: .value("Date", entry.date),
                    y: .value("BMI", entry.bmi)
                )
                .foregroundStyle(.blue)
                .interpolationMethod(.catmullRom)
                
                PointMark(
                    x: .value("Date", entry.date),
                    y: .value("BMI", entry.bmi)
                )
                .foregroundStyle(.blue)
            }
            .frame(height: 200)
            .chartYScale(domain: 15...35)
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartXAxis {
                AxisMarks(values: .automatic) { value in
                    AxisValueLabel(format: .dateTime.month().day())
                }
            }
            
            // BMI category reference lines
            RuleMark(y: .value("Normal Min", 18.5))
                .foregroundStyle(.green.opacity(0.3))
            RuleMark(y: .value("Normal Max", 25))
                .foregroundStyle(.green.opacity(0.3))
        }
        .padding()
    }
}

// In main view
if !viewModel.history.isEmpty {
    BMIHistoryView(history: viewModel.history)
}
```

**5. Explain data flow in SwiftUI**

SwiftUI has a unidirectional data flow:

```swift
// @State - Single view ownership
struct CounterView: View {
    @State private var count = 0  // Source of truth
    
    var body: some View {
        Button("Count: \(count)") {
            count += 1  // Modifies state → triggers re-render
        }
    }
}

// @Binding - Parent-child communication
struct ParentView: View {
    @State private var count = 0  // Parent owns data
    
    var body: some View {
        VStack {
            Text("Total: \(count)")
            ChildView(count: $count)  // Pass binding
        }
    }
}

struct ChildView: View {
    @Binding var count: Int  // Two-way binding
    
    var body: some View {
        Button("Increment") {
            count += 1  // Updates parent's state
        }
    }
}

// @ObservedObject - External reference object
class UserSettings: ObservableObject {
    @Published var username = ""  // Published triggers updates
    @Published var isDarkMode = false
}

struct SettingsView: View {
    @ObservedObject var settings: UserSettings  // Passed from parent
    
    var body: some View {
        TextField("Name", text: $settings.username)
    }
}

// @StateObject - View owns the observable object
struct AppView: View {
    @StateObject private var settings = UserSettings()  // View creates and owns
    
    var body: some View {
        SettingsView(settings: settings)  // Pass to children
    }
}

// @EnvironmentObject - Shared across view hierarchy
class AppState: ObservableObject {
    @Published var isLoggedIn = false
}

@main
struct MyApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)  // Inject at root
        }
    }
}

struct DeepChildView: View {
    @EnvironmentObject var appState: AppState  // Access anywhere
    
    var body: some View {
        Text(appState.isLoggedIn ? "Welcome" : "Login")
    }
}
```

**Flow Summary:**
1. **@State** → Single view data
2. **@Binding** → Child receives reference to parent's @State
3. **@StateObject** → View creates and owns ObservableObject
4. **@ObservedObject** → View receives ObservableObject reference
5. **@EnvironmentObject** → Global shared data across hierarchy

**6. Test BMI logic separately from UI**

```swift
import XCTest

class BMICalculatorTests: XCTestCase {
    var viewModel: BMICalculatorViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = BMICalculatorViewModel()
    }
    
    func testMetricBMICalculation() {
        // Given
        viewModel.weight = "70"
        viewModel.height = "175"
        viewModel.selectedUnit = 0
        
        // When
        viewModel.calculateBMI()
        
        // Then
        XCTAssertNotNil(viewModel.bmiResult)
        XCTAssertEqual(viewModel.bmiResult?.value ?? 0, 22.86, accuracy: 0.01)
        XCTAssertEqual(viewModel.bmiResult?.category, "Normal")
    }
    
    func testImperialBMICalculation() {
        // Given
        viewModel.weight = "154"  // ~70kg
        viewModel.height = "69"   // ~175cm
        viewModel.selectedUnit = 1
        
        // When
        viewModel.calculateBMI()
        
        // Then
        XCTAssertNotNil(viewModel.bmiResult)
        XCTAssertEqual(viewModel.bmiResult?.value ?? 0, 22.74, accuracy: 0.1)
    }
    
    func testInvalidInputValidation() {
        // Given
        viewModel.weight = "abc"
        viewModel.height = "175"
        
        // Then
        XCTAssertFalse(viewModel.isInputValid)
    }
    
    func testUnderweightCategory() {
        // Given
        viewModel.weight = "50"
        viewModel.height = "175"
        viewModel.selectedUnit = 0
        
        // When
        viewModel.calculateBMI()
        
        // Then
        XCTAssertEqual(viewModel.bmiResult?.category, "Underweight")
    }
    
    func testOverweightCategory() {
        // Given
        viewModel.weight = "85"
        viewModel.height = "175"
        viewModel.selectedUnit = 0
        
        // When
        viewModel.calculateBMI()
        
        // Then
        XCTAssertEqual(viewModel.bmiResult?.category, "Overweight")
    }
}
```

**7. Difference between computed properties and functions**

```swift
// Computed Property
struct Person {
    var firstName: String
    var lastName: String
    
    // Computed property - no parameters, accessed like property
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    // Usage
    let person = Person(firstName: "John", lastName: "Doe")
    print(person.fullName)  // No parentheses
}

// Function
struct Calculator {
    // Function - can take parameters, must use parentheses
    func add(_ a: Int, _ b: Int) -> Int {
        a + b
    }
    
    // Usage
    let calc = Calculator()
    print(calc.add(5, 3))  // Requires parentheses
}

// When to use what:
// Computed Property:
// ✓ Logically a property of the object
// ✓ No parameters needed
// ✓ Fast computation (no heavy work)
// ✓ Deterministic (same input → same output)
var isInputValid: Bool {
    !weight.isEmpty && !height.isEmpty
}

// Function:
// ✓ Performs an action or operation
// ✓ Requires parameters
// ✓ May have side effects
// ✓ May be expensive computation
func calculateBMI(weight: Double, height: Double) -> Double {
    weight / (height * height)
}
```

**8. How SwiftUI manages view lifecycle when states update**

```swift
struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        // This is called EVERY time count changes
        print("Body evaluated")  // For debugging only
        
        return VStack {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1  // Triggers re-evaluation
            }
        }
    }
    
    // This is NOT called again (struct is value type)
    init() {
        print("View initialized")  // Called once
    }
}
```

**Lifecycle Flow:**

1. **Initial Render:**
   - View struct is created
   - `body` is evaluated
   - View tree is built
   - UI is rendered

2. **State Change:**
   - State variable modified
   - SwiftUI marks view as dirty
   - `body` is re-evaluated (NOT the entire struct)
   - New view tree is created
   - Diffing algorithm compares old vs new tree
   - Only changed elements are updated in UI

3. **View Identity:**
   - SwiftUI tracks views by their position and type
   - `.id()` modifier can force new identity
   - Identity changes cause view to be destroyed and recreated

```swift
// Example of view lifecycle with onAppear/onDisappear
struct LifecycleView: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Button("Toggle") {
                showDetails.toggle()
            }
            
            if showDetails {
                DetailView()
                    .onAppear {
                        print("DetailView appeared")
                    }
                    .onDisappear {
                        print("DetailView disappeared")
                    }
            }
        }
    }
}
```

---

## 🧠 Bonus: Conceptual & Logical Mixed Questions

**1. Key principles of reactive programming in SwiftUI**

Reactive programming principles:

- **Data as Streams**: State changes flow through the app
- **Automatic Updates**: UI reacts to data changes automatically
- **Declarative**: Describe what, not how
- **Immutability**: State changes create new values, don't mutate
- **Unidirectional Flow**: Data flows one direction (down), events flow up

```swift
// Reactive example
class DataStore: ObservableObject {
    @Published var items: [String] = []  // Stream of data
    
    func addItem(_ item: String) {
        items.append(item)  // Emit new value
        // All subscribers automatically notified
    }
}

struct ListView: View {
    @StateObject private var store = DataStore()
    
    var body: some View {
        // UI automatically reacts to items changes
        List(store.items, id: \.self) { item in
            Text(item)
        }
    }
}
```

**2. How SwiftUI handles diffing and view identity**

SwiftUI uses a sophisticated diffing algorithm:

```swift
// View identity is based on type and position
VStack {
    Text("First")   // Identity: VStack[0]
    Text("Second")  // Identity: VStack[1]
}

// When content changes:
VStack {
    Text("Updated First")  // Same identity → Update in place
    Text("Second")         // Same identity → No change
}

// Explicit identity with .id()
struct ContentView: View {
    @State private var userId = 0
    
    var body: some View {
        UserProfileView(userId: userId)
            .id(userId)  // New identity when userId changes
            // Forces complete recreation of UserProfileView
    }
}

// ForEach identity
struct ItemList: View {
    let items: [Item]
    
    var body: some View {
        ForEach(items) { item in  // Uses item.id for identity
            ItemRow(item: item)
        }
    }
}

// Without proper identity
ForEach(items.indices, id: \.self) { index in
    // ⚠️ Can cause issues if array changes
    ItemRow(item: items[index])
}

// Correct identity
ForEach(items, id: \.id) { item in
    // ✅ Stable identity even if array reorders
    ItemRow(item: item)
}
```

**3. Debug state changes in SwiftUI effectively**

Debugging techniques:

```swift
// 1. Print statements in computed properties
var body: some View {
    let _ = print("Body evaluated, count: \(count)")
    return Text("Count: \(count)")
}

// 2. Custom binding with logging
extension Binding {
    func log(_ message: String) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: {
                print("\(message): \($0)")
                self.wrappedValue = $0
            }
        )
    }
}

// Usage
TextField("Name", text: $name.log("Name changed"))

// 3. View modifiers for debugging
extension View {
    func debug() -> Self {
        print("View updated: \(type(of: self))")
        return self
    }
}

// 4. Instruments and SwiftUI Inspector
// Use Xcode's Debug View Hierarchy
// Time Profiler to check performance
// SwiftUI Inspector (Cmd + Click on simulator)

// 5. Custom environment values for debug mode
struct DebugModeKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    var debugMode: Bool {
        get { self[DebugModeKey.self] }
        set { self[DebugModeKey.self] = newValue }
    }
}

// Usage
struct ContentView: View {
    @Environment(\.debugMode) var debugMode
    
    var body: some View {
        VStack {
            if debugMode {
                Text("Debug: State count = \(count)")
                    .foregroundColor(.red)
            }
        }
    }
}
```

**4. Explain binding between parent and child views**

```swift
// Parent owns the source of truth
struct ParentView: View {
    @State private var username = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack {
            // Pass binding to child with $ prefix
            InputField(text: $username)
            
            // Child can read and modify parent's state
            LoginButton(isLoggedIn: $isLoggedIn)
            
            // Parent sees changes immediately
            if isLoggedIn {
                Text("Welcome, \(username)!")
            }
        }
    }
}

// Child receives binding
struct InputField: View {
    @Binding var text: String  // Two-way binding
    
    var body: some View {
        TextField("Username", text: $text)
            // Changes here update parent's @State
    }
}

struct LoginButton: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        Button("Login") {
            isLoggedIn = true  // Modifies parent's state
        }
    }
}

// Custom binding example
struct ParentView: View {
    @State private var celsius: Double = 0
    
    // Computed binding for Fahrenheit
    private var fahrenheitBinding: Binding<Double> {
        Binding(
            get: { celsius * 9/5 + 32 },
            set: { celsius = ($0 - 32) * 5/9 }
        )
    }
    
    var body: some View {
        VStack {
            TemperatureInput(title: "Celsius", value: $celsius)
            TemperatureInput(title: "Fahrenheit", value: fahrenheitBinding)
        }
    }
}
```

**5. Best practices for clean, reusable SwiftUI components**

```swift
// 1. Single Responsibility
// ❌ Bad - does too much
struct UserView: View {
    var body: some View {
        VStack {
            // Profile image logic
            // Bio text logic
            // Posts list logic
            // Settings button logic
        }
    }
}

// ✅ Good - separated concerns
struct UserView: View {
    var body: some View {
        VStack {
            ProfileHeader()
            PostsList()
            SettingsButton()
        }
    }
}

// 2. Parameterization for reusability
struct CardView: View {
    let title: String
    let subtitle: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        VStack {
            Image(image)
            Text(title)
            Text(subtitle)
            Button("Action", action: action)
        }
    }
}

// 3. View modifiers for consistent styling
extension View {
    func cardStyle() -> some View {
        self
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
    }
}

// 4. Composition over inheritance
struct Button: View {
    let style: ButtonStyle
    let action: () -> Void
    
    enum ButtonStyle {
        case primary, secondary, destructive
        
        var color: Color {
            switch self {
            case .primary: return .blue
            case .secondary: return .gray
            case .destructive: return .red
            }
        }
    }
}

// 5. Environment values for theming
struct Theme {
    var primaryColor: Color
    var fontSize: CGFloat
}

struct ThemeKey: EnvironmentKey {
    static let defaultValue = Theme(primaryColor: .blue, fontSize: 16)
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

// 6. PreferenceKeys for child-to-parent communication
struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
```

**6. Performance optimization with frequent state changes**

```swift
// 1. Use @State only for UI-specific data
// ❌ Bad
@State private var apiData: [HeavyObject] = []

// ✅ Good
@StateObject private var viewModel = ViewModel()

// 2. Minimize body re-evaluations
// ❌ Bad - recreates on every change
var body: some View {
    let processedData = heavyComputation(data)
    return List(processedData) { item in }
}

// ✅ Good - cache computed values
@State private var processedData: [Item] = []

func updateData() {
    processedData = heavyComputation(data)
}

// 3. Use Equatable to prevent unnecessary updates
struct Item: Identifiable, Equatable {
    let id: UUID
    let name: String
    // SwiftUI only updates if Item actually changed
}

// 4. LazyVStack/LazyHStack for long lists
// ❌ Bad - loads all items immediately
ScrollView {
    VStack {
        ForEach(1000items) { item in
            ItemView(item: item)
        }
    }
}

// ✅ Good - loads items on demand
ScrollView {
    LazyVStack {
        ForEach(items) { item in
            ItemView(item: item)
        }
    }
}

// 5. @ViewBuilder for conditional views
@ViewBuilder
func contentView() -> some View {
    if condition {
        ViewA()
    } else {
        ViewB()
    }
}

// 6. Task cancellation for async work
.task(id: searchText) {
    // Automatically cancelled when searchText changes
    await performSearch(searchText)
}

// 7. Debouncing rapid changes
class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] text in
                self?.performSearch(text)
            }
            .store(in: &cancellables)
    }
}
```

**7. Implement dark mode compatibility**

```swift
// 1. Use semantic colors
// ❌ Bad - doesn't adapt
.foregroundColor(.black)

// ✅ Good - adapts to color scheme
.foregroundColor(.primary)  // Black in light, white in dark
.foregroundColor(.secondary)

// 2. Custom colors with dark mode support
extension Color {
    static let customBackground = Color("CustomBackground")
    // In Assets.xcassets, set Appearance: Any, Dark
}

// 3. Environment color scheme
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("Hello")
            .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}

// 4. Force override color scheme
ContentView()
    .preferredColorScheme(.dark)  // Always dark

// 5. Preview both modes
#Preview("Light") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}

// 6. Dynamic images
Image("logo")  // In Assets, set Appearance variations
```

**8. @State vs @Binding vs @StateObject vs @EnvironmentObject**

Complete comparison:

```swift
// @State - View owns simple value
struct CounterView: View {
    @State private var count = 0  // Owned by this view
    
    var body: some View {
        Button("Count: \(count)") {
            count += 1
        }
    }
}
// Use when: Simple value types, owned by single view

// @Binding - Reference to parent's @State
struct ParentView: View {
    @State private var isOn = false
    
    var body: some View {
        ToggleView(isOn: $isOn)  // Pass binding
    }
}

struct ToggleView: View {
    @Binding var isOn: Bool  // Doesn't own, just references
    
    var body: some View {
        Toggle("Switch", isOn: $isOn)
    }
}
// Use when: Child needs to modify parent's state

// @StateObject - View owns ObservableObject
struct RootView: View {
    @StateObject private var store = DataStore()  // Created here
    
    var body: some View {
        ChildView(store: store)
    }
}
// Use when: View creates and owns the object

// @ObservedObject - Reference to ObservableObject
struct ChildView: View {
    @ObservedObject var store: DataStore  // Passed from parent
    
    var body: some View {
        Text(store.data)
    }
}
// Use when: Object passed from parent, view doesn't own it

// @EnvironmentObject - Shared across hierarchy
@main
struct MyApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
        }
    }
}

struct DeepChildView: View {
    @EnvironmentObject var appState: AppState
    // No need to pass through intermediate views
}
// Use when: Global state needed across many views

// Summary table:
// @State          | Owns value      | Simple types  | Single view
// @Binding        | References      | Any type      | Parent-child
// @StateObject    | Owns object     | ObservableObject | View lifecycle
// @ObservedObject | References obj  | ObservableObject | Passed reference
// @EnvironmentObject | References  | ObservableObject | Global access
```

---

## 🎯 Final Tips for Interviews

1. **Understand the "Why"**: Don't just memorize syntax, understand why SwiftUI was designed this way
2. **Compare with UIKit**: Show you understand both paradigms
3. **Code Examples**: Always provide practical examples
4. **Trade-offs**: Discuss pros and cons of different approaches
5. **Real-world**: Relate answers to production app considerations
6. **Stay Current**: SwiftUI evolves rapidly, mention latest features when relevant

 creates a two-way binding between TextField and the state variable:

```swift
@State private var newTaskTitle = ""

TextField("Enter task", text: $newTaskTitle)
// $ creates Binding<String> from @State var String

// Data flow:
// 1. User types → TextField updates $newTaskTitle
// 2. $newTaskTitle updates newTaskTitle @State
// 3. @State change triggers view refresh
// 4. TextField displays updated value

// Without $ (won't compile)
TextField("Enter task", text: newTaskTitle)  // ❌ Error

// With $ (correct)
TextField("Enter task", text: $newTaskTitle)  // ✅ Works
```

**6. What does `.disabled()` modifier do on the add button?**

`.disabled()` conditionally disables user interaction based on a Boolean:

```swift
Button(action: addTask) {
    Image(systemName: "plus.circle.fill")
}
.disabled(newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty)

// When disabled:
// - Button appears grayed out
// - Taps/clicks have no effect
// - Action closure doesn't execute
// - Provides visual feedback to user

// Practical use - prevent empty tasks
let trimmed = newTaskTitle.trimmingCharacters(in: .whitespaces)
.disabled(trimmed.isEmpty)  // Can't add whitespace-only tasks
```

**7. What is the purpose of conditional views using `if tasks.isEmpty`?**

SwiftUI's conditional views change UI based on state without manual show/hide logic:

```swift
if tasks.isEmpty {
    // Empty state view
    VStack {
        Image(systemName: "checkmark.circle")
        Text("No Tasks Yet")
    }
} else {
    // Tasks list
    List(tasks) { task in
        TaskRowView(task: task)
    }
}

// SwiftUI automatically:
// - Shows appropriate view based on condition
// - Animates transitions between states
// - Destroys/creates views as needed
// - Manages view lifecycle
```

**8. How does `List` differ from `ForEach` in SwiftUI?**

- **`List`**: Container view with built-in scrolling, styling, and row separators
- **`ForEach`**: Loop construct for creating multiple views, can be used anywhere

```swift
// List - scrollable container with iOS styling
List {
    ForEach(items) { item in
        Text(item.name)
    }
}

// ForEach alone - just creates views, no container
ScrollView {
    VStack {
        ForEach(items) { item in
            Text(item.name)
        }
    }
}

// List features ForEach doesn't have:
List {
    ForEach(items) { item in
        Text(item.name)
    }
    .onDelete { indexSet in }  // Swipe to delete
    .onMove { from, to in }     // Drag to reorder
}
.listStyle(.insetGrouped)      // Styling options
```

**9. What does the `onDelete` modifier do?**

`onDelete` enables swipe-to-delete gesture on List rows:

```swift
List {
    ForEach(tasks) { task in
        Text(task.title)
    }
    .onDelete(perform: deleteTasks)  // Attach to ForEach
}

func deleteTasks(at offsets: IndexSet) {
    // offsets contains indices of rows to delete
    tasks.remove(atOffsets: offsets)
}

// IndexSet example:
// If user swipes row 2: offsets = [2]
// If multiple selection: offsets = [1, 3, 5]

// Array extension for batch removal
extension Array {
    mutating func remove(atOffsets offsets: IndexSet) {
        self = enumerated().filter { !offsets.contains($0.offset) }.map { $0.element }
    }
}
```

### 🟡 Intermediate Questions

**1. Explain the complete data flow when adding a new task**

```swift
// Step-by-step flow:

// 1. User types in TextField
TextField("Enter task", text: $newTaskTitle)
// $newTaskTitle binding updates @State var newTaskTitle

// 2. User taps add button
Button(action: addTask) { }

// 3. addTask() function executes
private func addTask() {
    let trimmedTitle = newTaskTitle.trimmingCharacters(in: .whitespaces)
    guard !trimmedTitle.isEmpty else { return }
    
    // 4. Create new Task object
    let newTask = Task(title: trimmedTitle)
    
    // 5. Mutate @State array
    tasks.append(newTask)  // ← SwiftUI detects change
    
    // 6. SwiftUI marks view as dirty and re-renders body
    // List automatically shows new row with animation
    
    // 7. Clear input
    newTaskTitle = ""  // TextField automatically clears
    
    // 8. Persist to storage
    saveTasks()  // Save to UserDefaults
    
    // 9. Show confirmation
    showingAlert = true  // Alert appears
}
```

**2. How does UserDefaults work for data persistence?**

UserDefaults is a key-value store that persists data between app launches:

```swift
// UserDefaults workflow in To-Do app:

// SAVING
private func saveTasks() {
    // 1. Encode Swift array to JSON data
    if let encoded = try? JSONEncoder().encode(tasks) {
        // 2. Save to UserDefaults with key
        UserDefaults.standard.set(encoded, forKey: "SavedTasks")
        // 3. Data written to disk automatically
    }
}

// LOADING
private func loadTasks() {
    // 1. Retrieve data by key
    if let savedData = UserDefaults.standard.data(forKey: "SavedTasks") {
        // 2. Decode JSON back to Swift array
        if let decoded = try? JSONDecoder().decode([Task].self, from: savedData) {
            // 3. Update state
            tasks = decoded
        }
    }
}

// When it persists:
// ✓ App closes normally
// ✓ App crashes
// ✓ Device restarts
// ✓ App reinstalled (NO - UserDefaults cleared on uninstall)

// UserDefaults limitations:
// - Max ~1MB recommended (technically higher but slow)
// - Synchronous operations (blocks main thread if large)
// - Not encrypted (use Keychain for sensitive data)
// - Cleared on app uninstall
```

**3. What is the purpose of `onAppear` lifecycle method?**

`onAppear` executes code when a view appears on screen:

```swift
.onAppear {
    loadTasks()  // Load saved tasks when app launches
}

// Lifecycle flow:
// 1. View struct created
// 2. body evaluated
// 3. View rendered
// 4. onAppear closure executes ← Load data here

// Use cases:
struct ProfileView: View {
    @State private var userData: User?
    
    var body: some View {
        VStack {
            if let user = userData {
                Text(user.name)
            }
        }
        .onAppear {
            // Fetch data when view appears
            loadUserData()
            
            // Start animations
            startAnimation()
            
            // Track analytics
            Analytics.track("ProfileViewed")
        }
        .onDisappear {
            // Cleanup when view disappears
            cancelNetworkRequests()
        }
    }
}

// onAppear vs init():
// init() - Called when struct created (before rendering)
// onAppear() - Called after view rendered (visible to user)
```

**4. How does the `EditButton` work in the toolbar?**

`EditButton` is a built-in button that toggles List's edit mode:

```swift
.toolbar {
    ToolbarItem(placement: .navigationBarTrailing) {
        EditButton()  // Automatically manages edit state
    }
}

// What EditButton does:
// - Shows "Edit" when not editing
// - Shows "Done" when editing
// - Toggles List environment value
// - Enables delete/move UI

// Manual implementation (what EditButton does internally):
@State private var editMode: EditMode = .inactive

var body: some View {
    List { }
        .environment(\.editMode, $editMode)
        .toolbar {
            Button(editMode == .inactive ? "Edit" : "Done") {
                editMode = editMode == .inactive ? .active : .inactive
            }
        }
}

// Edit mode enables:
// - Delete indicators (red circles)
// - Reorder handles (if .onMove added)
// - Multi-selection
```

**5. Explain the TaskRowView component structure and reusability**

TaskRowView demonstrates view composition and separation of concerns:

```swift
struct TaskRowView: View {
    let task: Task              // Immutable data
    let onToggle: () -> Void    // Callback closure
    
    var body: some View {
        HStack {
            // Checkbox button
            Button(action: onToggle) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
            .buttonStyle(PlainButtonStyle())
            
            // Task title
            Text(task.title)
                .strikethrough(task.isCompleted)
                .foregroundColor(task.isCompleted ? .gray : .primary)
            
            Spacer()
        }
    }
}

// Benefits of this design:

// 1. REUSABILITY
// Can use TaskRowView anywhere
CompletedTasksView {
    ForEach(completedTasks) { task in
        TaskRowView(task: task, onToggle: { })
    }
}

// 2. TESTABILITY
// Test row independently
let task = Task(title: "Test", isCompleted: false)
let row = TaskRowView(task: task, onToggle: { })

// 3. MAINTAINABILITY
// Changes to row only affect one component
// Main view stays clean

// 4. IMMUTABILITY
// task is let (immutable)
// Parent manages mutations via onToggle callback
// Follows unidirectional data flow

// Usage pattern:
ForEach(tasks) { task in
    TaskRowView(
        task: task,
        onToggle: {
            toggleTaskCompletion(task)  // Parent handles logic
        }
    )
}
```

**6. What is the difference between `try`, `try?`, and `try!` in Swift?**

Swift's error handling mechanisms:

```swift
// try - Must handle errors explicitly
func saveTasks() {
    do {
        let encoded = try JSONEncoder().encode(tasks)
        UserDefaults.standard.set(encoded, forKey: "SavedTasks")
    } catch {
        print("Encoding failed: \(error)")
        // Handle error appropriately
    }
}

// try? - Converts errors to optionals (returns nil on error)
func saveTasks() {
    if let encoded = try? JSONEncoder().encode(tasks) {
        // Success - use encoded data
        UserDefaults.standard.set(encoded, forKey: "SavedTasks")
    }
    // Failure - silently ignored, encoded is nil
}

// try! - Force unwrap, crashes on error
func saveTasks() {
    let encoded = try! JSONEncoder().encode(tasks)  // ⚠️ Crashes if encoding fails
    UserDefaults.standard.set(encoded, forKey: "SavedTasks")
}

// When to use each:

// try - Production code where you need to handle errors
do {
    try fileManager.removeItem(at: url)
} catch {
    showError(error)
}

// try? - When failure is acceptable (optional behavior)
let savedData = try? JSONDecoder().decode([Task].self, from: data)
// If decoding fails, savedData is nil - that's ok

// try! - Only when error is impossible (use sparingly)
let url = try! URL(string: "https://example.com")  // URL is valid
// Still risky - prefer URL(string:) which returns optional
```

**7. How does `guard let` improve code readability?**

`guard` enables early exits and unwraps optionals safely:

```swift
// Without guard - nested if statements (Pyramid of Doom)
func addTask() {
    let trimmed = newTaskTitle.trimmingCharacters(in: .whitespaces)
    if !trimmed.isEmpty {
        let newTask = Task(title: trimmed)
        tasks.append(newTask)
        newTaskTitle = ""
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "SavedTasks")
            showingAlert = true
        }
    }
}

// With guard - flat structure, clear intent
func addTask() {
    let trimmed = newTaskTitle.trimmingCharacters(in: .whitespaces)
    guard !trimmed.isEmpty else { return }  // Exit early if invalid
    
    let newTask = Task(title: trimmed)
    tasks.append(newTask)
    newTaskTitle = ""
    
    guard let encoded = try? JSONEncoder().encode(tasks) else { return }
    UserDefaults.standard.set(encoded, forKey: "SavedTasks")
    showingAlert = true
}

// guard vs if for optionals:

// guard - value available for rest of scope
func loadTasks() {
    guard let data = UserDefaults.standard.data(forKey: "SavedTasks") else {
        return
    }
    // 'data' available here
    
    guard let tasks = try? JSONDecoder().decode([Task].self, from: data) else {
        return
    }
    // 'tasks' available here
    self.tasks = tasks
}

// if let - value only in block
func loadTasks() {
    if let data = UserDefaults.standard.data(forKey: "SavedTasks") {
        // 'data' available here
        if let tasks = try? JSONDecoder().decode([Task].self, from: data) {
            // 'tasks' available here (nested)
            self.tasks = tasks
        }
    }
    // data and tasks NOT available here
}
```

**8. Explain the alert modifier and its parameters**

Alerts display important messages that require user acknowledgment:

```swift
.alert("Task Added", isPresented: $showingAlert) {
    Button("OK", role: .cancel) { }
} message: {
    Text("Your task has been added successfully!")
}

// Parameter breakdown:

// 1. Title: "Task Added"
// - Main heading of alert

// 2. isPresented: $showingAlert
// - Binding to Bool @State
// - Alert shows when true
// - Automatically sets to false when dismissed

// 3. actions: closure with buttons
Button("OK", role: .cancel) { }
// - .cancel = default dismiss button
// - .destructive = red button for dangerous actions
// - no role = regular button

// 4. message: descriptive text
Text("Your task has been added successfully!")

// Multiple buttons example:
.alert("Delete Task?", isPresented: $showDeleteAlert) {
    Button("Cancel", role: .cancel) { }
    Button("Delete", role: .destructive) {
        deleteTasks(at: selectedIndex)
    }
} message: {
    Text("This action cannot be undone.")
}

// iOS 15+ with data:
@State private var taskToDelete: Task?

.alert("Delete Task?", isPresented: .constant(taskToDelete != nil)) {
    Button("Cancel", role: .cancel) {
        taskToDelete = nil
    }
    Button("Delete", role: .destructive) {
        if let task = taskToDelete {
            deleteTask(task)
        }
        taskToDelete = nil
    }
}
```

### 🔴 Advanced Questions

**1. How would you refactor the To-Do List app using MVVM architecture?**

Complete MVVM implementation:

```swift
// MARK: - Model
struct Task: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }
}

// MARK: - Repository (Data Layer)
protocol TaskRepositoryProtocol {
    func loadTasks() -> [Task]
    func saveTasks(_ tasks: [Task])
}

class UserDefaultsTaskRepository: TaskRepositoryProtocol {
    private let key = "SavedTasks"
    
    func loadTasks() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let tasks = try? JSONDecoder().decode([Task].self, from: data) else {
            return []
        }
        return tasks
    }
    
    func saveTasks(_ tasks: [Task]) {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}

// MARK: - ViewModel
class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var newTaskTitle: String = ""
    @Published var showingAlert = false
    @Published var alertMessage = ""
    
    private let repository: TaskRepositoryProtocol
    
    init(repository: TaskRepositoryProtocol = UserDefaultsTaskRepository()) {
        self.repository = repository
        loadTasks()
    }
    
    // MARK: - Computed Properties
    var incompleteTasks: [Task] {
        tasks.filter { !$0.isCompleted }
    }
    
    var completedTasks: [Task] {
        tasks.filter { $0.isCompleted }
    }
    
    var isAddButtonDisabled: Bool {
        newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    // MARK: - Task Operations
    func addTask() {
        let trimmed = newTaskTitle.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        
        let newTask = Task(title: trimmed)
        tasks.append(newTask)
        newTaskTitle = ""
        saveTasks()
        
        alertMessage = "Task '\(trimmed)' added successfully!"
        showingAlert = true
    }
    
    func toggleTaskCompletion(_ task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isCompleted.toggle()
        saveTasks()
    }
    
    func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }
    
    func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
        saveTasks()
    }
    
    func deleteTask(_ task: Task) {
        tasks.removeAll { $0.id == task.id }
        saveTasks()
    }
    
    // MARK: - Persistence
    private func saveTasks() {
        repository.saveTasks(tasks)
    }
    
    private func loadTasks() {
        tasks = repository.loadTasks()
    }
}

// MARK: - View
struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                inputSection
                taskListSection
            }
            .navigationTitle("My Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .alert(viewModel.alertMessage, isPresented: $viewModel.showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
    private var inputSection: some View {
        HStack {
            TextField("Enter new task", text: $viewModel.newTaskTitle)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .onSubmit {
                    viewModel.addTask()
                }
            
            Button(action: viewModel.addTask) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            .padding(.trailing)
            .disabled(viewModel.isAddButtonDisabled)
        }
    }
    
    private var taskListSection: some View {
        Group {
            if viewModel.tasks.isEmpty {
                emptyStateView
            } else {
                taskList
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 20) {
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
    }
    
    private var taskList: some View {
        List {
            ForEach(viewModel.tasks) { task in
                TaskRowView(
                    task: task,
                    onToggle: {
                        viewModel.toggleTaskCompletion(task)
                    }
                )
            }
            .onDelete(perform: viewModel.deleteTasks)
            .onMove(perform: viewModel.moveTask)
        }
        .listStyle(.insetGrouped)
    }
}

// Benefits of MVVM:
// ✓ Separation of concerns
// ✓ Testable business logic
// ✓ Reusable repository
// ✓ Easy to swap data sources
// ✓ Clean view code
```

**2. Implement task categories and filtering**

```swift
// MARK: - Enhanced Model
enum TaskCategory: String, Codable, CaseIterable {
    case personal = "Personal"
    case work = "Work"
    case shopping = "Shopping"
    case health = "Health"
    
    var icon: String {
        switch self {
        case .personal: return "person.fill"
        case .work: return "briefcase.fill"
        case .shopping: return "cart.fill"
        case .health: return "heart.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .personal: return .blue
        case .work: return .purple
        case .shopping: return .orange
        case .health: return .red
        }
    }
}

struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var category: TaskCategory
    var priority: TaskPriority
    var dueDate: Date?
    
    enum TaskPriority: Int, Codable, CaseIterable {
        case low = 0
        case medium = 1
        case high = 2
        
        var label: String {
            switch self {
            case .low: return "Low"
            case .medium: return "Medium"
            case .high: return "High"
            }
        }
        
        var color: Color {
            switch self {
            case .low: return .green
            case .medium: return .orange
            case .high: return .red
            }
        }
    }
}

// MARK: - Enhanced ViewModel with Filtering
class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var selectedCategory: TaskCategory?
    @Published var showOnlyIncomplete = false
    @Published var sortOption: SortOption = .dateCreated
    
    enum SortOption: String, CaseIterable {
        case dateCreated = "Date Created"
        case title = "Title"
        case priority = "Priority"
        case dueDate = "Due Date"
    }
    
    var filteredTasks: [Task] {
        var result = tasks
        
        // Filter by category
        if let category = selectedCategory {
            result = result.filter { $0.category == category }
        }
        
        // Filter by completion status
        if showOnlyIncomplete {
            result = result.filter { !$0.isCompleted }
        }
        
        // Sort
        switch sortOption {
        case .dateCreated:
            result.sort { $0.createdAt < $1.createdAt }
        case .title:
            result.sort { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }
        case .priority:
            result.sort { $0.priority.rawValue > $1.priority.rawValue }
        case .dueDate:
            result.sort { task1, task2 in
                guard let date1 = task1.dueDate else { return false }
                guard let date2 = task2.dueDate else { return true }
                return date1 < date2
            }
        }
        
        return result
    }
    
    var tasksByCategory: [TaskCategory: [Task]] {
        Dictionary(grouping: tasks) { $0.category }
    }
}

// MARK: - Filter View
struct TaskFilterView: View {
    @Binding var selectedCategory: TaskCategory?
    @Binding var showOnlyIncomplete: Bool
    @Binding var sortOption: TaskListViewModel.SortOption
    
    var body: some View {
        Form {
            Section("Category") {
                Picker("Filter by Category", selection: $selectedCategory) {
                    Text("All").tag(TaskCategory?.none)
                    ForEach(TaskCategory.allCases, id: \.self) { category in
                        Label(category.rawValue, systemImage: category.icon)
                            .tag(TaskCategory?.some(category))
                    }
                }
            }
            
            Section("Status") {
                Toggle("Show Only Incomplete", isOn: $showOnlyIncomplete)
            }
            
            Section("Sort By") {
                Picker("Sort", selection: $sortOption) {
                    ForEach(TaskListViewModel.SortOption.allCases, id: \.self) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}
```

**3. Add search functionality to the task list**

```swift
// MARK: - ViewModel with Search
class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var searchText = ""
    
    var searchResults: [Task] {
        if searchText.isEmpty {
            return tasks
        } else {
            return tasks.filter { task in
                task.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    // Highlighted search results
    func highlightedText(for task: Task) -> AttributedString {
        var attributedString = AttributedString(task.title)
        
        if !searchText.isEmpty {
            if let range = attributedString.range(of: searchText, options: .caseInsensitive) {
                attributedString[range].backgroundColor = .yellow
                attributedString[range].foregroundColor = .black
            }
        }
        
        return attributedString
    }
}

// MARK: - View with Search
struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.searchResults) { task in
                    TaskRowView(task: task, onToggle: {
                        viewModel.toggleTaskCompletion(task)
                    })
                }
                .onDelete(perform: viewModel.deleteTasks)
            }
            .searchable(text: $viewModel.searchText, prompt: "Search tasks")
            .navigationTitle("My Tasks")
        }
    }
}

// Advanced search with multiple criteria
class TaskListViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchInCompleted = true
    @Published var searchInIncomplete = true
    
    var searchResults: [Task] {
        var filtered = tasks
        
        // Filter by completion status
        if !searchInCompleted {
            filtered = filtered.filter { !$0.isCompleted }
        }
        if !searchInIncomplete {
            filtered = filtered.filter { $0.isCompleted }
        }
        
        // Apply search text
        if !searchText.isEmpty {
            filtered = filtered.filter { task in
                task.title.localizedCaseInsensitiveContains(searchText) ||
                task.category.rawValue.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return filtered
    }
}
```

**4. Implement undo/redo functionality for task operations**

```swift
// MARK: - Command Pattern for Undo/Redo
protocol TaskCommand {
    func execute()
    func undo()
}

class AddTaskCommand: TaskCommand {
    private weak var viewModel: TaskListViewModel?
    private let task: Task
    
    init(viewModel: TaskListViewModel, task: Task) {
        self.viewModel = viewModel
        self.task = task
    }
    
    func execute() {
        viewModel?.tasks.append(task)
    }
    
    func undo() {
        viewModel?.tasks.removeAll { $0.id == task.id }
    }
}

class DeleteTaskCommand: TaskCommand {
    private weak var viewModel: TaskListViewModel?
    private let task: Task
    private let index: Int
    
    init(viewModel: TaskListViewModel, task: Task, index: Int) {
        self.viewModel = viewModel
        self.task = task
        self.index = index
    }
    
    func execute() {
        viewModel?.tasks.removeAll { $0.id == task.id }
    }
    
    func undo() {
        viewModel?.tasks.insert(task, at: index)
    }
}

class ToggleTaskCommand: TaskCommand {
    private weak var viewModel: TaskListViewModel?
    private let taskId: UUID
    
    init(viewModel: TaskListViewModel, taskId: UUID) {
        self.viewModel = viewModel
        self.taskId = taskId
    }
    
    func execute() {
        toggleTask()
    }
    
    func undo() {
        toggleTask()
    }
    
    private func toggleTask() {
        guard let index = viewModel?.tasks.firstIndex(where: { $0.id == taskId }) else { return }
        viewModel?.tasks[index].isCompleted.toggle()
    }
}

// MARK: - Enhanced ViewModel with Undo/Redo
class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    private var commandHistory: [TaskCommand] = []
    private var currentCommandIndex = -1
    
    var canUndo: Bool {
        currentCommandIndex >= 0
    }
    
    var canRedo: Bool {
        currentCommandIndex < commandHistory.count - 1
    }
    
    func executeCommand(_ command: TaskCommand) {
        // Remove any commands after current index (clear redo history)
        if currentCommandIndex < commandHistory.count - 1 {
            commandHistory.removeSubrange((currentCommandIndex + 1)...)
        }
        
        command.execute()
        commandHistory.append(command)
        currentCommandIndex += 1
        saveTasks()
    }
    
    func undo() {
        guard canUndo else { return }
        commandHistory[currentCommandIndex].undo()
        currentCommandIndex -= 1
        saveTasks()
    }
    
    func redo() {
        guard canRedo else { return }
        currentCommandIndex += 1
        commandHistory[currentCommandIndex].execute()
        saveTasks()
    }
    
    // Updated operations to use commands
    func addTask() {
        let trimmed = newTaskTitle.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        
        let newTask = Task(title: trimmed)
        let command = AddTaskCommand(viewModel: self, task: newTask)
        executeCommand(command)
        newTaskTitle = ""
    }
    
    func toggleTaskCompletion(_ task: Task) {
        let command = ToggleTaskCommand(viewModel: self, taskId: task.id)
        executeCommand(command)
    }
}

// MARK: - View with Undo/Redo Buttons
struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Undo/Redo toolbar
                HStack {
                    Button(action: viewModel.undo) {
                        Label("Undo", systemImage: "arrow.uturn.backward")
                    }
                    .disabled(!viewModel.canUndo)
                    
                    Button(action: viewModel.redo) {
                        Label("Redo", systemImage: "arrow.uturn.forward")
                    }
                    .disabled(!viewModel.canRedo)
                    
                    Spacer()
                }
                .padding()
                
                // Rest of the UI
            }
        }
    }
}
```

**5. Add task reminders using local notifications**

```swift
import UserNotifications

// MARK: - Notification Manager
class NotificationManager: ObservableObject {
    static let shared = NotificationManager()
    
    func requestAuthorization() async -> Bool {
        do {
            return try await UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge])
        } catch {
            print("Notification authorization error: \(error)")
            return false
        }
    }
    
    func scheduleNotification(for task: Task, at date: Date) async {
        let content = UNMutableNotificationContent()
        content.title = "Task Reminder"
        content.body = task.title
        content.sound = .default
        content.categoryIdentifier = "TASK_REMINDER"
        
        // Create trigger
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        // Create request
        let request = UNNotificationRequest(
            identifier: task.id.uuidString,
            content: content,
            trigger: trigger
        )
        
        do {
            try await UNUserNotificationCenter.current().add(request)
        } catch {
            print("Failed to schedule notification: \(error)")
        }
    }
    
    func cancelNotification(for taskId: UUID) {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [taskId.uuidString])
    }
    
    func getPendingNotifications() async -> [UNNotificationRequest] {
        await UNUserNotificationCenter.current().pendingNotificationRequests()
    }
}

// MARK: - Enhanced Task Model
struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var reminderDate: Date?
    var hasReminder: Bool {
        reminderDate != nil
    }
}

// MARK: - ViewModel with Notifications
class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    private let notificationManager = NotificationManager.shared
    
    func toggleReminder(for task: Task, date: Date?) async {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        
        if let date = date {
            // Schedule notification
            await notificationManager.scheduleNotification(for: task, at: date)
            tasks[index].reminderDate = date
        } else {
            // Cancel notification
            notificationManager.cancelNotification(for: task.id)
            tasks[index].reminderDate = nil
        }
        
        saveTasks()
    }
    
    func completeTask(_ task: Task) async {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isCompleted = true
        
        // Cancel reminder when task completed
        if tasks[index].hasReminder {
            notificationManager.cancelNotification(for: task.id)
            tasks[index].reminderDate = nil
        }
        
        saveTasks()
    }
}

// MARK: - Reminder Picker View
struct ReminderPickerView: View {
    @Binding var reminderDate: Date?
    @State private var showingPicker = false
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            Button(action: {
                showingPicker.toggle()
            }) {
                HStack {
                    Image(systemName: reminderDate != nil ? "bell.fill" : "bell")
                    Text(reminderDate != nil ? "Reminder Set" : "Set Reminder")
                    Spacer()
                    if let date = reminderDate {
                        Text(date, style: .time)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            if showingPicker {
                DatePicker(
                    "Reminder Time",
                    selection: $selectedDate,
                    in: Date()...,
                    displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.graphical)
                
                HStack {
                    Button("Cancel") {
                        showingPicker = false
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                    
                    if reminderDate != nil {
                        Button("Remove", role: .destructive) {
                            reminderDate = nil
                            showingPicker = false
                        }
                        .buttonStyle(.bordered)
                    }
                    
                    Button("Set") {
                        reminderDate = selectedDate
                        showingPicker = false
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}
```

**6. Implement data synchronization with CloudKit**

```swift
import CloudKit

// MARK: - CloudKit Repository
class CloudKitTaskRepository: TaskRepositoryProtocol {
    private let container: CKContainer
    private let database: CKDatabase
    
    init() {
        container = CKContainer.default()
        database = container.privateCloudDatabase
    }
    
    func saveTasks(_ tasks: [Task]) async throws {
        let records = tasks.map { taskToRecord($0) }
        
        // Batch save with modify operation
        let operation = CKModifyRecordsOperation(recordsToSave: records)
        operation.savePolicy = .changedKeys
        
        try await withCheckedThrowingContinuation { continuation in
            operation.modifyRecordsResultBlock = { result in
                switch result {
                case .success:
                    continuation.resume()
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
            database.add(operation)
        }
    }
    
    func loadTasks() async throws -> [Task] {
        let query = CKQuery(recordType: "Task", predicate: NSPredicate(value: true))
        query.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
        
        let results = try await database.records(matching: query)
        
        return results.matchResults.compactMap { _, result in
            switch result {
            case .success(let record):
                return recordToTask(record)
            case .failure:
                return nil
            }
        }
    }
    
    private func taskToRecord(_ task: Task) -> CKRecord {
        let record = CKRecord(recordType: "Task", recordID: CKRecord.ID(recordName: task.id.uuidString))
        record["title"] = task.title as CKRecordValue
        record["isCompleted"] = task.isCompleted as CKRecordValue
        record["createdAt"] = task.createdAt as CKRecordValue
        return record
    }
    
    private func recordToTask(_ record: CKRecord) -> Task? {
        guard let title = record["title"] as? String,
              let isCompleted = record["isCompleted"] as? Bool,
              let createdAt = record["createdAt"] as? Date else {
            return nil
        }
        
        return Task(
            id: UUID(uuidString: record.recordID.recordName) ?? UUID(),
            title: title,
            isCompleted: isCompleted,
            createdAt: createdAt
        )
    }
}

// MARK: - Sync Manager
@MainActor
class SyncManager: ObservableObject {
    @Published var isSyncing = false
    @Published var lastSyncDate: Date?
    @Published var syncError: String?
    
    private let cloudRepository: CloudKitTaskRepository
    private let localRepository: UserDefaultsTaskRepository
    
    init(cloudRepository: CloudKitTaskRepository, localRepository: UserDefaultsTaskRepository) {
        self.cloudRepository = cloudRepository
        self.localRepository = localRepository
    }
    
    func sync() async {
        isSyncing = true
        syncError = nil
        
        do {
            // Load from cloud
            let cloudTasks = try await cloudRepository.loadTasks()
            let localTasks = localRepository.loadTasks()
            
            // Merge strategy: cloud wins for conflicts
            let mergedTasks = mergeTasks(local: localTasks, cloud: cloudTasks)
            
            // Save merged tasks to both locations
            try await cloudRepository.saveTasks(mergedTasks)
            localRepository.saveTasks(mergedTasks)
            
            lastSyncDate = Date()
        } catch {
            syncError = error.localizedDescription
        }
        
        isSyncing = false
    }
    
    private func mergeTasks(local: [Task], cloud: [Task]) -> [Task] {
        var taskDict: [UUID: Task] = [:]
        
        // Add local tasks
        for task in local {
            taskDict[task.id] = task
        }
        
        // Cloud tasks override local (cloud wins)
        for task in cloud {
            taskDict[task.id] = task
        }
        
        return Array(taskDict.values).sorted { $0.createdAt > $1.createdAt }
    }
}

// MARK: - View with Sync
struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    @StateObject private var syncManager = SyncManager(
        cloudRepository: CloudKitTaskRepository(),
        localRepository: UserDefaultsTaskRepository()
    )
    
    var body: some View {
        NavigationView {
            VStack {
                // Sync status banner
                if syncManager.isSyncing {
                    HStack {
                        ProgressView()
                        Text("Syncing...")
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                }
                
                if let error = syncManager.syncError {
                    Text("Sync failed: \(error)")
                        .foregroundColor(.red)
                        .padding()
                }
                
                // Task list
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        Task {
                            await syncManager.sync()
                        }
                    }) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                    }
                    .disabled(syncManager.isSyncing)
                }
            }
            .refreshable {
                await syncManager.sync()
            }
        }
    }
}
```

**7. Add animations and transitions for better UX**

```swift
// MARK: - Custom Animations
extension Animation {
    static let taskAdd = Animation.spring(response: 0.4, dampingFraction: 0.7)
    static let taskDelete = Animation.easeOut(duration: 0.3)
    static let taskComplete = Animation.interpolatingSpring(stiffness: 170, damping: 15)
}

// MARK: - Enhanced TaskRowView with Animations
struct TaskRowView: View {
    let task: Task
    let onToggle: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.taskComplete) {
                    onToggle()
                }
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    // Scale animation on tap
                    .scaleEffect(isPressed ? 0.8 : 1.0)
            }
            .buttonStyle(PlainButtonStyle())
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed = true
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed = false
                        }
                    }
            )
            
            Text(task.title)
                .strikethrough(task.isCompleted, color: .gray)
                .foregroundColor(task.isCompleted ? .gray : .primary)
                // Fade and scale when completed
                .opacity(task.isCompleted ? 0.6 : 1.0)
                .animation(.easeInOut, value: task.isCompleted)
            
            Spacer()
            
            // Priority indicator with pulse animation
            if task.priority == .high {
                Circle()
                    .fill(Color.red)
                    .frame(width: 8, height: 8)
                    .overlay(
                        Circle()
                            .stroke(Color.red, lineWidth: 1)
                            .scaleEffect(isPressed ? 1.5 : 1.0)
                            .opacity(isPressed ? 0 : 1)
                            .animation(
                                .easeOut(duration: 1.0)
                                .repeatForever(autoreverses: false),
                                value: isPressed
                            )
                    )
            }
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
    }
}

// MARK: - Task List with Transitions
struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    @Namespace private var animation
    
    var body: some View {
        List {
            ForEach(viewModel.tasks) { task in
                TaskRowView(task: task, onToggle: {
                    viewModel.toggleTaskCompletion(task)
                })
                .transition(.asymmetric(
                    insertion: .move(edge: .leading).combined(with: .opacity),
                    removal: .move(edge: .trailing).combined(with: .opacity)
                ))
                .matchedGeometryEffect(id: task.id, in: animation)
            }
            .onDelete(perform: viewModel.deleteTasks)
        }
        .animation(.taskAdd, value: viewModel.tasks)
    }
}

// MARK: - Celebration Animation on Task Completion
struct TaskCompletionView: View {
    @State private var showConfetti = false
    
    var body: some View {
        ZStack {
            // Task list
            
            if showConfetti {
                ConfettiView()
                    .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showConfetti = false
                            }
                        }
                    }
            }
        }
    }
}

struct ConfettiView: View {
    @State private var confettiPieces: [ConfettiPiece] = []
    
    struct ConfettiPiece: Identifiable {
        let id = UUID()
        var x: CGFloat
        var y: CGFloat
        var rotation: Double
        var color: Color
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(confettiPieces) { piece in
                    Circle()
                        .fill(piece.color)
                        .frame(width: 10, height: 10)
                        .position(x: piece.x, y: piece.y)
                        .rotationEffect(.degrees(piece.rotation))
                }
            }
            .onAppear {
                generateConfetti(in: geometry.size)
            }
        }
        .allowsHitTesting(false)
    }
    
    private func generateConfetti(in size: CGSize) {
        confettiPieces = (0..<50).map { _ in
            ConfettiPiece(
                x: CGFloat.random(in: 0...size.width),
                y: CGFloat.random(in: -100...0),
                rotation: Double.random(in: 0...360),
                color: [.red, .blue, .green, .yellow, .purple].randomElement()!
            )
        }
        
        withAnimation(.easeOut(duration: 2.0)) {
            confettiPieces = confettiPieces.map { piece in
                var newPiece = piece
                newPiece.y = size.height + 100
                newPiece.rotation += 720
                return newPiece
            }
        }
    }
}
```

**8. Implement widget extension for quick task viewing**

```swift
import WidgetKit
import SwiftUI

// MARK: - Widget Timeline Provider
struct TaskWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> TaskWidgetEntry {
        TaskWidgetEntry(date: Date(), tasks: placeholderTasks())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TaskWidgetEntry) -> Void) {
        let entry = TaskWidgetEntry(date: Date(), tasks: loadTasks())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TaskWidgetEntry>) -> Void) {
        let currentDate = Date()
        let entry = TaskWidgetEntry(date: currentDate, tasks: loadTasks())
        
        // Update widget every hour
        let nextUpdate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        
        completion(timeline)
    }
    
    private func loadTasks() -> [Task] {
        guard let sharedDefaults = UserDefaults(suiteName: "group.com.yourapp.tasks"),
              let data = sharedDefaults.data(forKey: "SavedTasks"),
              let tasks = try? JSONDecoder().decode([Task].self, from: data) else {
            return []
        }
        return tasks.filter { !$0.isCompleted }.prefix(5).map { $0 }
    }
    
    private func placeholderTasks() -> [Task] {
        [
            Task(title: "Sample Task 1", isCompleted: false),
            Task(title: "Sample Task 2", isCompleted: false),
            Task(title: "Sample Task 3", isCompleted: false)
        ]
    }
}

// MARK: - Widget Entry
struct TaskWidgetEntry: TimelineEntry {
    let date: Date
    let tasks: [Task]
}

// MARK: - Widget View
struct TaskWidgetView: View {
    var entry: TaskWidgetProvider.Entry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("My Tasks")
                .font(.headline)
                .foregroundColor(.primary)
            
            if entry.tasks.isEmpty {
                Text("No pending tasks")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                ForEach(entry.tasks.prefix(taskLimit)) { task in
                    HStack {
                        Image(systemName: "circle")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(task.title)
                            .font(.subheadline)
                            .lineLimit(1)
                        Spacer()
                    }
                }
                Spacer()
            }
        }
        .padding()
    }
    
    private var taskLimit: Int {
        switch family {
        case .systemSmall: return 3
        case .systemMedium: return 5
        case .systemLarge: return 10
        default: return 3
        }
    }
}

// MARK: - Widget Configuration
@main
struct TaskWidget: Widget {
    let kind: String = "TaskWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TaskWidgetProvider()) { entry in
            TaskWidgetView(entry: entry)
        }
        .configurationDisplayName("Task List")
        .description("View your pending tasks at a glance")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

// Don't forget to enable App Groups in Capabilities
// and use shared UserDefaults suite name
```

---

## 🎯 Summary: Key Concepts from To-Do List App

### Data Management
- **Identifiable**: Unique tracking for list items
- **Codable**: JSON serialization for persistence
- **UserDefaults**: Simple key-value storage
- **Repository Pattern**: Separating data layer

### SwiftUI Lists
- **List**: Scrollable container with built-in styling
- **ForEach**: Dynamic view generation from collections
- **onDelete**: Swipe-to-delete gesture
- **onMove**: Drag-to-reorder functionality
- **EditButton**: Toggle edit mode

### State Management
- **@State with Collections**: Managing arrays of custom types
- **Computed Properties**: Derived values from state
- **@Published**: Observable object properties

### User Input
- **TextField**: Text input with binding
- **Button**: Actions and callbacks
- **Alert**: User notifications
- **.disabled()**: Conditional interaction

### Architecture Patterns
- **MVVM**: Separation of business logic and UI
- **Command Pattern**: Undo/redo functionality
- **Repository Pattern**: Data abstraction layer

### Advanced Features
- **Search**: Filtering and highlighting
- **Notifications**: Local reminders
- **CloudKit**: Cloud synchronization
- **Widgets**: Home screen extensions
- **Animations**: Enhanced user experience

---

**Prepared by:** Aryan Jaiswal  
**Purpose:** Comprehensive SwiftUI Interview Preparation  
**Last Updated:** October 2025
