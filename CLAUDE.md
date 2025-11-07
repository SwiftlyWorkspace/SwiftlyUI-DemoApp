# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## ⚠️ CRITICAL RULES - READ FIRST

**NEVER KILL XCODE**: Do NOT use `killall Xcode` or any command that terminates Xcode. This is extremely disruptive to the developer's workflow. If Xcode needs to reload something, ask the user to do it manually or suggest they restart Xcode themselves. This rule is non-negotiable.

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
  - `ComponentListView.swift` - Main navigation with NavigationSplitView architecture, DemoDestination enum, and DemoDetailWrapper helper
  - `TokenTagFieldDemo.swift` - Comprehensive TokenTagField examples (basic usage, custom styling, auto-completion)
  - `UserTokenFieldDemo.swift` - UserTokenField demonstrations (search/filter, avatars, team selection, custom user types)
  - `MultiPickerDemo.swift` - MultiPicker system examples (basic, searchable, grouped, styles, limits, bulk actions)
- **`Assets.xcassets/`** - App icons and accent colors

### Configuration
- **`Package.swift`** - Swift Package Manager configuration with SwiftlyUI dependency
- **`SwiftlyUI-DemoApp.xcodeproj`** - Xcode project file for GUI development

## Platform Requirements

- **Target Platforms**: iOS 16.0+ / macOS 13.0+
- **Swift**: 5.7+
- **Xcode**: 14.0+
- **SwiftlyUI Library**: Depends on SwiftlyUI framework (see `/Users/benvanaken/Developer/SwiftlyUI`)

## Architecture Notes

This is an executable SwiftUI application that serves as both a demo and integration example for the SwiftlyUI component library. The app follows a navigation-based architecture:

- **NavigationSplitView Architecture**: Uses NavigationSplitView for a master-detail layout with sidebar navigation
- **ComponentListView**: Acts as the main hub showing all available components organized by category (Token Tag Field, User Token Field, MultiPicker)
- **DemoDestination Enum**: Type-safe navigation system defining all possible demo screens
- **DemoDetailWrapper**: Reusable wrapper view providing consistent styling for detail pages
- **Individual Demo Views**: Each component has its own dedicated demo view showcasing multiple usage scenarios:
  - **TokenTagFieldDemo**: Basic usage, custom styling, suggestions
  - **UserTokenFieldDemo**: Search/filter, avatar varieties, team selection, custom user types
  - **MultiPickerDemo**: Basic examples, searchable, grouped, styles, limits, bulk actions
- **SPM Integration**: Demonstrates how to properly integrate SwiftlyUI as a package dependency

The demo app requires higher minimum OS versions (iOS 16+/macOS 13+) than the library itself to showcase modern SwiftUI features like NavigationSplitView.

## Development Patterns

### Adding New Component Demos
1. Create a new demo view in `Views/` (e.g., `NewComponentDemo.swift`)
2. Add new cases to the `DemoDestination` enum in `ComponentListView.swift`
3. Add navigation entries to `ComponentListView.swift` (create new section or add to existing)
4. Update the `destinationView(for:)` switch statement to handle new destinations
5. Use `DemoDetailWrapper` for consistent styling of detail pages
6. Include multiple usage examples showing different configurations
7. Add proper documentation and code examples within the demo view

### Working with SwiftlyUI Dependency

The app depends on SwiftlyUI via Package.swift. There are three dependency modes:

#### Production Mode (Semantic Versioning)
```swift
.package(url: "https://github.com/SwiftlyWorkspace/SwiftlyUI.git", from: "1.0.0")
```
- Use this for stable releases
- Requires SwiftlyUI to have a tagged release (e.g., `1.0.0`)
- Best for production and when demo app is published

#### Development Mode (Main Branch)
```swift
.package(url: "https://github.com/SwiftlyWorkspace/SwiftlyUI.git", branch: "main")
```
- Currently active configuration
- Always pulls latest from main branch
- Good for keeping demo in sync with latest library changes

#### Local Development Mode
```swift
.package(path: "../SwiftlyUI")
```
- Uncomment this when developing both library and demo simultaneously
- Requires both repos to be cloned side by side
- Changes to SwiftlyUI are immediately available without pushing
- Run `swift package clean` after switching between modes

## Cross-References

- **SwiftlyUI Framework**: `/Users/benvanaken/Developer/SwiftlyUI` - The main component library
- **Framework CLAUDE.md**: `/Users/benvanaken/Developer/SwiftlyUI/CLAUDE.md` - Development guidance for the component library