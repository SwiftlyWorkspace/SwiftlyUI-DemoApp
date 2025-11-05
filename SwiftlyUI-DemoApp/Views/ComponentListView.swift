//
//  ComponentListView.swift
//  SwiftlyUI-DemoApp
//
//  Created by Ben Van Aken on 05/11/2025.
//

import SwiftUI

/// The main component list view that displays all available SwiftlyUI components.
struct ComponentListView: View {
    let components = [
        Component(
            name: "Token Tag Field",
            description: "A customizable token-based input field for managing tags with auto-completion and inline editing.",
            systemImage: "tag.fill",
            destination: .tokenTagField
        )
    ]

    var body: some View {
        NavigationStack {
            List(components) { component in
                NavigationLink(value: component.destination) {
                    ComponentRow(component: component)
                }
            }
            .navigationTitle("SwiftlyUI Components")
            .navigationDestination(for: ComponentDestination.self) { destination in
                switch destination {
                case .tokenTagField:
                    TokenTagFieldDemo()
                }
            }
        }
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