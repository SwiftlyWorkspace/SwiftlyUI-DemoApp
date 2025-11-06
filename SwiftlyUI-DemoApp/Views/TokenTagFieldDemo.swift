//
//  TokenTagFieldDemo.swift
//  SwiftlyUI-DemoApp
//
//  Created by Ben Van Aken on 05/11/2025.
//

import SwiftUI
import SwiftlyUI

/// Comprehensive demo of the Token Tag Field component.
struct TokenTagFieldDemo: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                VStack(spacing: 8) {
                    Text("A powerful tag input component with auto-completion, inline editing, and customizable styling.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)

                // Basic Example
                DemoSection(title: "Basic Usage", description: "Simple tag field with common programming languages") {
                    BasicTagFieldExample()
                }

                // Custom Colors Example
                DemoSection(title: "Custom Styling", description: "Tags with predefined colors and custom maximum limit") {
                    CustomColorTagFieldExample()
                }

                // Suggestions Example
                DemoSection(title: "With Suggestions", description: "Auto-completion with suggested tags from a predefined list") {
                    SuggestionsTagFieldExample()
                }

                // Features Overview
                TokenTagFieldFeaturesOverview()
            }
            .padding(.bottom, 32)
        }
        .navigationTitle("Token Tag Field")
    }
}

/// A demo section wrapper with title and description.
private struct DemoSection<Content: View>: View {
    let title: String
    let description: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title2)
                    .bold()

                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

/// Basic tag field example.
private struct BasicTagFieldExample: View {
    @State private var tags: [Tag] = [
        Tag(name: "Swift", color: .orange),
        Tag(name: "SwiftUI", color: .blue),
        Tag(name: "iOS", color: .gray)
    ]
    @State private var inputText = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TokenTagField(
                tags: $tags,
                inputText: $inputText,
                onAdd: { newTag in
                    tags.append(newTag)
                },
                onRemove: { tagToRemove in
                    tags.removeAll { $0.id == tagToRemove.id }
                },
                onUpdate: { updatedTag in
                    if let index = tags.firstIndex(where: { $0.id == updatedTag.id }) {
                        tags[index] = updatedTag
                    }
                }
            )

            Text("Current tags: \(tags.map { $0.name }.joined(separator: ", "))")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

/// Custom color tag field example.
private struct CustomColorTagFieldExample: View {
    @State private var tags: [Tag] = [
        Tag(name: "Important", color: .red),
        Tag(name: "Work", color: .blue),
        Tag(name: "Personal", color: .green)
    ]
    @State private var inputText = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TokenTagField(
                tags: $tags,
                inputText: $inputText,
                maxTags: 5,
                onAdd: { newTag in
                    tags.append(newTag)
                },
                onRemove: { tagToRemove in
                    tags.removeAll { $0.id == tagToRemove.id }
                },
                onUpdate: { updatedTag in
                    if let index = tags.firstIndex(where: { $0.id == updatedTag.id }) {
                        tags[index] = updatedTag
                    }
                }
            )

            Text("Maximum 5 tags · \(tags.count) of 5 used")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

/// Suggestions tag field example.
private struct SuggestionsTagFieldExample: View {
    @State private var tags: [Tag] = []
    @State private var inputText = ""

    let suggestedTags: [Tag] = [
        Tag(name: "Swift", color: .orange),
        Tag(name: "SwiftUI", color: .blue),
        Tag(name: "UIKit", color: .purple),
        Tag(name: "Combine", color: .red),
        Tag(name: "Core Data", color: .green),
        Tag(name: "CloudKit", color: .cyan),
        Tag(name: "Xcode", color: .indigo),
        Tag(name: "iOS", color: .gray),
        Tag(name: "macOS", color: .pink),
        Tag(name: "watchOS", color: .teal)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TokenTagField(
                tags: $tags,
                inputText: $inputText,
                suggestedTags: suggestedTags,
                placeholder: "Start typing to see suggestions...",
                onAdd: { newTag in
                    tags.append(newTag)
                },
                onRemove: { tagToRemove in
                    tags.removeAll { $0.id == tagToRemove.id }
                },
                onUpdate: { updatedTag in
                    if let index = tags.firstIndex(where: { $0.id == updatedTag.id }) {
                        tags[index] = updatedTag
                    }
                }
            )

            Text("Try typing 'Swift', 'UI', or 'Core' to see suggestions")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

/// Features overview section.
private struct TokenTagFieldFeaturesOverview: View {
    private let features = [
        ("tag.fill", "Tag Management", "Add, edit, and remove tags with intuitive controls"),
        ("textformat", "Inline Editing", "Double-tap any tag to edit its name inline"),
        ("eyedropper", "Color Customization", "Choose from 10 predefined colors or set custom colors"),
        ("list.bullet", "Auto-completion", "Smart suggestions based on your input and predefined list"),
        ("keyboard", "Keyboard Navigation", "Full keyboard support including backspace to delete"),
        ("slider.horizontal.3", "Customizable Limits", "Set maximum number of tags and custom styling")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Key Features")
                .font(.title2)
                .bold()
                .padding(.horizontal)

            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], alignment: .leading, spacing: 16) {
                ForEach(features.indices, id: \.self) { index in
                    let feature = features[index]
                    FeatureCard(
                        icon: feature.0,
                        title: feature.1,
                        description: feature.2
                    )
                }
            }
            .padding(.horizontal)
        }
    }
}

/// Individual feature card.
private struct FeatureCard: View {
    let icon: String
    let title: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(.blue)
                Spacer()
            }

            Text(title)
                .font(.headline)

            Text(description)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)

            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .background(Color.secondary.opacity(0.05))
        .cornerRadius(12)
    }
}

#Preview {
    NavigationStack {
        TokenTagFieldDemo()
    }
}