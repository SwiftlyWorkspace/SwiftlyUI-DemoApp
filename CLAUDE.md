# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SwiftlyUI-DemoApp is a comprehensive demonstration application showcasing all SwiftlyUI components and their capabilities. This is an executable Swift Package Manager project that demonstrates real-world usage patterns and integration examples for the SwiftlyUI component library.

## Development Commands

### Building and Running
- **Build the app**: `swift build`
- **Run the app**: `swift run SwiftlyUI-DemoApp`
- **Clean build**: `swift package clean`

**Note**: Package.swift should never be included in Xcode's Sources build phase. If you see "No such module 'PackageDescription'" errors during Xcode builds, check that Package.swift is not in the "Compile Sources" build phase in Xcode.

### Xcode Development
The app can also be opened and run through Xcode:
1. Open `SwiftlyUI-DemoApp.xcodeproj` in Xcode
2. Build and run the project (⌘+R)
3. Use Xcode previews for individual view development

## Project Structure

### Core Application (`SwiftlyUI-DemoApp/`)
- **`SwiftlyUI_DemoAppApp.swift`** - App entry point with main App struct
- **`ContentView.swift`** - Root view that displays ComponentListView
- **`Views/`** - All demo views and examples
  - `ComponentListView.swift` - Main navigation showing all available components
  - `TokenTagFieldDemo.swift` - Comprehensive TokenTagField examples and usage patterns

### Configuration
- **`Package.swift`** - Swift Package Manager configuration with SwiftlyUI dependency
- **`SwiftlyUI-DemoApp.xcodeproj`** - Xcode project file for GUI development

## Platform Requirements

- **Target Platforms**: iOS 16.0+ / macOS 13.0+
- **Swift**: 5.7+
- **Xcode**: 14.0+
- **SwiftlyUI Library**: Depends on SwiftlyUI framework (see `/Users/benvanaken/Developer/SwiftlyUI`)

## Architecture Notes

This is an executable SwiftUI application that serves as both a demo and integration example for the SwiftlyUI component library. The app follows a simple navigation-based architecture:

- **ComponentListView**: Acts as the main hub showing all available components
- **Individual Demo Views**: Each component has its own dedicated demo view (e.g., TokenTagFieldDemo) that showcases multiple usage scenarios
- **SPM Integration**: Demonstrates how to properly integrate SwiftlyUI as a package dependency

The demo app requires higher minimum OS versions (iOS 16+/macOS 13+) than the library itself to showcase modern SwiftUI features like NavigationStack.

## Development Patterns

### Adding New Component Demos
1. Create a new demo view in `Views/` (e.g., `NewComponentDemo.swift`)
2. Add navigation entry in `ComponentListView.swift`
3. Include multiple usage examples showing different configurations
4. Add proper documentation and code examples within the demo view

### Working with SwiftlyUI Dependency
- The app depends on SwiftlyUI via Package.swift
- For local development, ensure the SwiftlyUI framework at `/Users/benvanaken/Developer/SwiftlyUI` is properly built
- Changes to SwiftlyUI components will require rebuilding the demo app

## Cross-References

- **SwiftlyUI Framework**: `/Users/benvanaken/Developer/SwiftlyUI` - The main component library
- **Framework CLAUDE.md**: `/Users/benvanaken/Developer/SwiftlyUI/CLAUDE.md` - Development guidance for the component library