//
//  ComponentListView.swift
//  SwiftlyUI-DemoApp
//
//  Created by Ben Van Aken on 05/11/2025.
//

import SwiftUI

/// The main component list view that displays all available SwiftlyUI components.
struct ComponentListView: View {
    @State private var selectedDestination: DemoDestination?

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedDestination) {
                Section {
                    ForEach(tokenTagFieldExamples) { example in
                        NavigationLink(value: example.destination) {
                            Label(example.title, systemImage: example.icon)
                        }
                    }
                } header: {
                    Label("Token Tag Field", systemImage: "tag.fill")
                        .font(.headline)
                }

                Section {
                    ForEach(userTokenFieldExamples) { example in
                        NavigationLink(value: example.destination) {
                            Label(example.title, systemImage: example.icon)
                        }
                    }
                } header: {
                    Label("User Token Field", systemImage: "person.2.fill")
                        .font(.headline)
                }

                Section {
                    ForEach(multiPickerExamples) { example in
                        NavigationLink(value: example.destination) {
                            Label(example.title, systemImage: example.icon)
                        }
                    }
                } header: {
                    Label("MultiPicker", systemImage: "checklist")
                        .font(.headline)
                }

                Section {
                    ForEach(timelineExamples) { example in
                        NavigationLink(value: example.destination) {
                            Label(example.title, systemImage: example.icon)
                        }
                    }
                } header: {
                    Label("Timeline", systemImage: "clock.fill")
                        .font(.headline)
                }
            }
            .navigationTitle("SwiftlyUI")
            #if os(macOS)
            .navigationSplitViewColumnWidth(min: 280, ideal: 320, max: 400)
            #endif
        } detail: {
            if let selectedDestination {
                destinationView(for: selectedDestination)
            } else {
                if #available(macOS 14.0, iOS 17.0, *) {
                    ContentUnavailableView {
                        Label("Select an Example", systemImage: "sidebar.left")
                    } description: {
                        Text("Choose an example from the sidebar to view its demo")
                    }
                } else {
                    VStack(spacing: 16) {
                        Image(systemName: "sidebar.left")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)

                        VStack(spacing: 8) {
                            Text("Select an Example")
                                .font(.headline)
                            Text("Choose an example from the sidebar to view its demo")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationSplitViewStyle(.balanced)
    }

    @ViewBuilder
    private func destinationView(for destination: DemoDestination) -> some View {
        switch destination {
        // TokenTagField
        case .tokenTagFieldOverview:
            TokenTagFieldDemo()
        case .tokenTagFieldBasic:
            DemoDetailWrapper(title: "Basic Usage", description: "Simple tag field with common programming languages") {
                BasicTagFieldExample()
            }
        case .tokenTagFieldCustom:
            DemoDetailWrapper(title: "Custom Styling", description: "Tags with predefined colors and custom maximum limit") {
                CustomColorTagFieldExample()
            }
        case .tokenTagFieldSuggestions:
            DemoDetailWrapper(title: "With Suggestions", description: "Auto-completion with suggested tags from a predefined list") {
                SuggestionsTagFieldExample()
            }

        // UserTokenField
        case .userTokenFieldOverview:
            UserTokenFieldDemo()
        case .userTokenFieldBasic:
            DemoDetailWrapper(title: "Basic Usage", description: "Simple user selection from a list") {
                BasicUserFieldExample()
            }
        case .userTokenFieldSearch:
            DemoDetailWrapper(title: "Search & Filter", description: "Real-time search by name or email") {
                SearchFilterExample()
            }
        case .userTokenFieldAvatars:
            DemoDetailWrapper(title: "Avatar Varieties", description: "Different avatar types: images, URLs, and initials") {
                AvatarVarietiesExample()
            }
        case .userTokenFieldTeam:
            DemoDetailWrapper(title: "Team Selection", description: "Limited user selection with realistic constraints") {
                TeamSelectionExample()
            }
        case .userTokenFieldCustom:
            DemoDetailWrapper(title: "Custom User Type", description: "Using your own user model with UserRepresentable") {
                CustomUserTypeExample()
            }

        // MultiPicker
        case .multiPickerOverview:
            MultiPickerDemo()
        case .multiPickerBasic:
            DemoDetailWrapper(title: "Basic Examples", description: "Simple multi-selection pickers") {
                BasicMultiPickerExamples()
            }
        case .multiPickerSearchable:
            DemoDetailWrapper(title: "Searchable Examples", description: "Multi-pickers with search functionality") {
                SearchableMultiPickerExamples()
            }
        case .multiPickerGrouped:
            DemoDetailWrapper(title: "Grouped Examples", description: "Multi-pickers with sectioned data") {
                GroupedMultiPickerExamples()
            }
        case .multiPickerStyles:
            DemoDetailWrapper(title: "Style Variations", description: "Different presentation styles") {
                StyleVariationsExamples()
            }
        case .multiPickerLimits:
            DemoDetailWrapper(title: "Selection Limits", description: "Min/max selection constraints") {
                SelectionLimitsExamples()
            }
        case .multiPickerBulk:
            DemoDetailWrapper(title: "Bulk Actions", description: "Select All and Clear All functionality") {
                BulkActionsExamples()
            }

        // Timeline
        case .timelineOverview:
            TimelineDemo()
        case .timelineVertical:
            DemoDetailWrapper(title: "Vertical Timeline", description: "Traditional vertical timeline with events") {
                VerticalTimelineExample()
            }
        case .timelineHorizontal:
            DemoDetailWrapper(title: "Horizontal Timeline", description: "Horizontal milestone timeline") {
                HorizontalTimelineExample()
            }
        case .timelineCompact:
            DemoDetailWrapper(title: "Compact Timeline", description: "Compact notification-style timeline") {
                CompactTimelineExample()
            }
        case .timelineGitHub:
            DemoDetailWrapper(title: "GitHub Branching", description: "Git-style branch and merge visualization") {
                GitHubBranchingExample()
            }
        case .timelineCustom:
            DemoDetailWrapper(title: "Custom Styling", description: "Customized indicators and connectors") {
                CustomStylingExample()
            }
        }
    }

    // Example definitions
    private let tokenTagFieldExamples = [
        ExampleItem(title: "Overview", icon: "info.circle", destination: .tokenTagFieldOverview),
        ExampleItem(title: "Basic Usage", icon: "1.circle", destination: .tokenTagFieldBasic),
        ExampleItem(title: "Custom Styling", icon: "paintbrush", destination: .tokenTagFieldCustom),
        ExampleItem(title: "With Suggestions", icon: "lightbulb", destination: .tokenTagFieldSuggestions)
    ]

    private let userTokenFieldExamples = [
        ExampleItem(title: "Overview", icon: "info.circle", destination: .userTokenFieldOverview),
        ExampleItem(title: "Basic Usage", icon: "1.circle", destination: .userTokenFieldBasic),
        ExampleItem(title: "Search & Filter", icon: "magnifyingglass", destination: .userTokenFieldSearch),
        ExampleItem(title: "Avatar Varieties", icon: "person.crop.circle", destination: .userTokenFieldAvatars),
        ExampleItem(title: "Team Selection", icon: "person.3", destination: .userTokenFieldTeam),
        ExampleItem(title: "Custom User Type", icon: "gearshape", destination: .userTokenFieldCustom)
    ]

    private let multiPickerExamples = [
        ExampleItem(title: "Overview", icon: "info.circle", destination: .multiPickerOverview),
        ExampleItem(title: "Basic Examples", icon: "1.circle", destination: .multiPickerBasic),
        ExampleItem(title: "Searchable", icon: "magnifyingglass", destination: .multiPickerSearchable),
        ExampleItem(title: "Grouped", icon: "square.stack.3d.up", destination: .multiPickerGrouped),
        ExampleItem(title: "Style Variations", icon: "paintbrush", destination: .multiPickerStyles),
        ExampleItem(title: "Selection Limits", icon: "number", destination: .multiPickerLimits),
        ExampleItem(title: "Bulk Actions", icon: "checkmark.circle", destination: .multiPickerBulk)
    ]

    private let timelineExamples = [
        ExampleItem(title: "Overview", icon: "info.circle", destination: .timelineOverview),
        ExampleItem(title: "Vertical Timeline", icon: "arrow.down", destination: .timelineVertical),
        ExampleItem(title: "Horizontal Timeline", icon: "arrow.right", destination: .timelineHorizontal),
        ExampleItem(title: "Compact Timeline", icon: "list.bullet", destination: .timelineCompact),
        ExampleItem(title: "GitHub Branching", icon: "arrow.triangle.branch", destination: .timelineGitHub),
        ExampleItem(title: "Custom Styling", icon: "paintbrush", destination: .timelineCustom)
    ]
}

/// Represents an example item in the sidebar.
private struct ExampleItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let destination: DemoDestination
}

/// Enum representing all possible demo destinations.
enum DemoDestination: Hashable {
    // TokenTagField
    case tokenTagFieldOverview
    case tokenTagFieldBasic
    case tokenTagFieldCustom
    case tokenTagFieldSuggestions

    // UserTokenField
    case userTokenFieldOverview
    case userTokenFieldBasic
    case userTokenFieldSearch
    case userTokenFieldAvatars
    case userTokenFieldTeam
    case userTokenFieldCustom

    // MultiPicker
    case multiPickerOverview
    case multiPickerBasic
    case multiPickerSearchable
    case multiPickerGrouped
    case multiPickerStyles
    case multiPickerLimits
    case multiPickerBulk

    // Timeline
    case timelineOverview
    case timelineVertical
    case timelineHorizontal
    case timelineCompact
    case timelineGitHub
    case timelineCustom
}

/// A wrapper view for demo detail pages with consistent styling.
struct DemoDetailWrapper<Content: View>: View {
    let title: String
    let description: String
    let content: Content

    init(title: String, description: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.description = description
        self.content = content()
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
                .padding(.top)

                // Content
                content
                    .padding(.horizontal)
            }
            .padding(.bottom, 32)
        }
    }
}

#Preview {
    ComponentListView()
}