//
//  ComponentListView.swift
//  SwiftlyUI-DemoApp
//
//  Created by Ben Van Aken on 05/11/2025.
//

import SwiftUI

/// The main component list view that displays all available SwiftlyUI components.
struct ComponentListView: View {
    @State private var selectedComponent: ComponentDestination?

    let components = [
        Component(
            name: "Token Tag Field",
            description: "A customizable token-based input field for managing tags with auto-completion and inline editing.",
            systemImage: "tag.fill",
            destination: .tokenTagField
        )
    ]

    var body: some View {
        NavigationSplitView {
            List(components, selection: $selectedComponent) { component in
                NavigationLink(value: component.destination) {
                    ComponentRow(component: component)
                }
            }
            .navigationTitle("SwiftlyUI")
            #if os(macOS)
            .navigationSplitViewColumnWidth(min: 280, ideal: 320, max: 400)
            #endif
        } detail: {
            if let selectedComponent {
                switch selectedComponent {
                case .tokenTagField:
                    TokenTagFieldDemo()
                }
            } else {
                if #available(macOS 14.0, iOS 17.0, *) {
                    ContentUnavailableView {
                        Label("Select a Component", systemImage: "sidebar.left")
                    } description: {
                        Text("Choose a component from the sidebar to view its demo")
                    }
                } else {
                    VStack(spacing: 16) {
                        Image(systemName: "sidebar.left")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)

                        VStack(spacing: 8) {
                            Text("Select a Component")
                                .font(.headline)
                            Text("Choose a component from the sidebar to view its demo")
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
}

/// A row view for displaying individual components in the list.
private struct ComponentRow: View {
    let component: Component

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: component.systemImage)
                .font(.title2)
                .foregroundStyle(.blue)
                .frame(width: 32, height: 32)

            VStack(alignment: .leading, spacing: 4) {
                Text(component.name)
                    .font(.headline)

                Text(component.description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 4)
    }
}

/// Represents a SwiftlyUI component for display in the list.
struct Component: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let systemImage: String
    let destination: ComponentDestination
}

/// Enum representing the different component demo destinations.
enum ComponentDestination: Hashable {
    case tokenTagField
}

#Preview {
    ComponentListView()
}