# SwiftlyUI Demo App

A comprehensive demonstration app showcasing all SwiftlyUI components and their capabilities.

## 🚀 Overview

This demo app provides interactive examples of SwiftlyUI components, allowing you to:

- **Explore Components**: Browse all available SwiftlyUI components
- **See Usage Examples**: Multiple implementation scenarios for each component
- **Test Interactivity**: Fully functional examples you can interact with
- **Learn Best Practices**: Well-documented code showing proper integration

## 📱 Components Demonstrated

### Token Tag Field
- **Basic Usage**: Simple tag input with common programming languages
- **Custom Styling**: Tags with predefined colors and custom limits
- **Auto-completion**: Suggested tags with smart filtering
- **Interactive Features**: Inline editing, color customization, keyboard navigation

## 🛠️ Running the Demo

### Prerequisites
- **macOS** with Xcode 14.0+
- **Swift 5.7+**

### Using Swift Package Manager
```bash
git clone https://github.com/SwiftlyWorkspace/SwiftlyUI-DemoApp.git
cd SwiftlyUI-DemoApp
swift build
```

#### Local Development Setup
If you want to develop the demo app alongside changes to the SwiftlyUI library:

```bash
# Clone both repositories side by side
git clone https://github.com/SwiftlyWorkspace/SwiftlyUI.git
git clone https://github.com/SwiftlyWorkspace/SwiftlyUI-DemoApp.git

# Edit Package.swift in SwiftlyUI-DemoApp
# Comment out the GitHub URL and uncomment the local path:
# .package(path: "../SwiftlyUI"),

cd SwiftlyUI-DemoApp
swift build
```

### Using Xcode
1. Open `SwiftlyUI-DemoApp.xcodeproj`
2. Build and run the project
3. Explore the different component demos

## 🏗️ Project Structure

```
SwiftlyUI-DemoApp/
├── SwiftlyUI-DemoApp/
│   ├── SwiftlyUI_DemoAppApp.swift    # App entry point
│   ├── ContentView.swift             # Root view
│   ├── Views/
│   │   ├── ComponentListView.swift   # Main navigation
│   │   └── TokenTagFieldDemo.swift   # Tag field examples
│   └── Assets.xcassets               # App assets
├── Package.swift                     # SPM configuration
└── README.md                         # This file
```

## 🎯 Features Highlighted

### User Interface
- **NavigationStack**: Modern iOS 16+ navigation patterns
- **Responsive Design**: Adapts to different screen sizes
- **Dark Mode**: Full dark mode support

### Component Integration
- **Local Package Dependency**: Shows how to integrate SwiftlyUI locally
- **State Management**: Proper SwiftUI state handling patterns
- **Event Handling**: Complete examples of component callbacks

### Code Quality
- **Clean Architecture**: Well-organized, maintainable code
- **Documentation**: Comprehensive inline documentation
- **Best Practices**: Following SwiftUI conventions

## 📚 Learning Resources

Each demo includes:
- **Live Examples**: Functional components you can test
- **Code Snippets**: Copy-paste ready implementation code
- **Feature Explanations**: Detailed descriptions of capabilities
- **Usage Tips**: Best practices and common patterns

## 🤝 Contributing

Found an issue or want to improve the demos? Contributions are welcome!

1. Fork the repository
2. Create a feature branch
3. Make your improvements
4. Submit a pull request

## 📄 License

This demo app is part of the SwiftlyUI project and is available under the MIT License.

## 🔗 Links

- **[SwiftlyUI Library](https://github.com/SwiftlyWorkspace/SwiftlyUI)** - The main component library
- **[Documentation](https://github.com/SwiftlyWorkspace/SwiftlyUI#readme)** - Complete usage guide
- **[Contributing](https://github.com/SwiftlyWorkspace/SwiftlyUI/blob/main/CONTRIBUTING.md)** - How to contribute

---

**Built with ❤️ using SwiftlyUI**