//
//  UserTokenFieldDemo.swift
//  SwiftlyUI-DemoApp
//
//  Created by Claude on 06/11/2025.
//

import SwiftUI
import SwiftlyUI

/// Comprehensive demo of the User Token Field component.
struct UserTokenFieldDemo: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                VStack(spacing: 8) {
                    Text("A search-based user selection component with avatar display, auto-completion, and support for custom user types.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)

                // Basic Example
                DemoSection(title: "Basic Usage", description: "Simple user selection from a list") {
                    BasicUserFieldExample()
                }

                // Search & Filter Demo
                DemoSection(title: "Search & Filter", description: "Real-time search by name or email") {
                    SearchFilterExample()
                }

                // Avatar Varieties
                DemoSection(title: "Avatar Varieties", description: "Different avatar types: images, URLs, and initials") {
                    AvatarVarietiesExample()
                }

                // Team Selection Example
                DemoSection(title: "Team Selection", description: "Limited user selection with realistic constraints") {
                    TeamSelectionExample()
                }

                // Custom User Type Example
                DemoSection(title: "Custom User Type", description: "Using your own user model with UserRepresentable") {
                    CustomUserTypeExample()
                }

                // Features Overview
                FeaturesOverview()
            }
            .padding(.bottom, 32)
        }
        .navigationTitle("User Token Field")
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

/// Basic user field example.
private struct BasicUserFieldExample: View {
    @State private var selectedUsers: [SwiftlyUIUser] = []
    @State private var searchText = ""

    let availableUsers: [SwiftlyUIUser] = [
        SwiftlyUIUser(firstName: "John", lastName: "Doe", email: "john@example.com"),
        SwiftlyUIUser(firstName: "Jane", lastName: "Smith", email: "jane@example.com"),
        SwiftlyUIUser(firstName: "Bob", lastName: "Johnson", email: "bob@example.com"),
        SwiftlyUIUser(firstName: "Alice", lastName: "Williams", email: "alice@example.com"),
        SwiftlyUIUser(firstName: "Charlie", lastName: "Brown", email: "charlie@example.com")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            UserTokenField(
                selectedUsers: $selectedUsers,
                searchText: $searchText,
                availableUsers: availableUsers,
                onAdd: { user in
                    selectedUsers.append(user)
                },
                onRemove: { user in
                    selectedUsers.removeAll { $0.id == user.id }
                }
            )

            if !selectedUsers.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Selected Users:")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    ForEach(selectedUsers) { user in
                        Text("• \(user.displayName) (\(user.email))")
                            .font(.caption)
                    }
                }
                .padding(.top, 8)
            }
        }
    }
}

/// Search and filter example with more users.
private struct SearchFilterExample: View {
    @State private var selectedUsers: [SwiftlyUIUser] = []
    @State private var searchText = ""

    let availableUsers: [SwiftlyUIUser] = [
        SwiftlyUIUser(firstName: "Emma", lastName: "Davis", email: "emma.davis@company.com"),
        SwiftlyUIUser(firstName: "Michael", lastName: "Wilson", email: "michael.wilson@company.com"),
        SwiftlyUIUser(firstName: "Sophia", lastName: "Moore", email: "sophia.moore@company.com"),
        SwiftlyUIUser(firstName: "James", lastName: "Taylor", email: "james.taylor@company.com"),
        SwiftlyUIUser(firstName: "Olivia", lastName: "Anderson", email: "olivia.anderson@company.com"),
        SwiftlyUIUser(firstName: "William", lastName: "Thomas", email: "william.thomas@company.com"),
        SwiftlyUIUser(firstName: "Ava", lastName: "Jackson", email: "ava.jackson@company.com"),
        SwiftlyUIUser(firstName: "Benjamin", lastName: "White", email: "benjamin.white@company.com"),
        SwiftlyUIUser(firstName: "Isabella", lastName: "Harris", email: "isabella.harris@company.com"),
        SwiftlyUIUser(firstName: "Lucas", lastName: "Martin", email: "lucas.martin@company.com")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            UserTokenField(
                selectedUsers: $selectedUsers,
                searchText: $searchText,
                availableUsers: availableUsers,
                placeholder: "Search by name or email...",
                onAdd: { user in
                    selectedUsers.append(user)
                },
                onRemove: { user in
                    selectedUsers.removeAll { $0.id == user.id }
                }
            )

            Text("Try searching for 'emma', 'wilson', or 'company.com'")
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.top, 4)
        }
    }
}

/// Avatar varieties example showing different avatar types.
private struct AvatarVarietiesExample: View {
    @State private var selectedUsers: [SwiftlyUIUser] = []
    @State private var searchText = ""

    let availableUsers: [SwiftlyUIUser] = [
        SwiftlyUIUser(
            firstName: "Sarah",
            lastName: "Connor",
            email: "sarah@example.com",
            avatarImage: Image(systemName: "person.crop.circle.fill")
        ),
        SwiftlyUIUser(
            firstName: "John",
            lastName: "Connor",
            email: "john@example.com",
            avatarImage: Image(systemName: "person.circle")
        ),
        SwiftlyUIUser(
            firstName: "Kyle",
            lastName: "Reese",
            email: "kyle@example.com"
        ),
        SwiftlyUIUser(
            firstName: "Miles",
            lastName: "Dyson",
            email: "miles@example.com"
        ),
        SwiftlyUIUser(
            firstName: "Kate",
            lastName: "Brewster",
            email: "kate@example.com",
            avatarImage: Image(systemName: "star.circle.fill")
        )
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            UserTokenField(
                selectedUsers: $selectedUsers,
                searchText: $searchText,
                availableUsers: availableUsers,
                onAdd: { user in
                    selectedUsers.append(user)
                },
                onRemove: { user in
                    selectedUsers.removeAll { $0.id == user.id }
                }
            )

            VStack(alignment: .leading, spacing: 4) {
                Text("Some users have avatar images, others show initials")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("Each user without an avatar gets a unique color")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 4)
        }
    }
}

/// Team selection example with user limit.
private struct TeamSelectionExample: View {
    @State private var selectedUsers: [SwiftlyUIUser] = []
    @State private var searchText = ""

    let teamMembers: [SwiftlyUIUser] = [
        SwiftlyUIUser(firstName: "David", lastName: "Chen", email: "david.chen@team.com"),
        SwiftlyUIUser(firstName: "Maria", lastName: "Garcia", email: "maria.garcia@team.com"),
        SwiftlyUIUser(firstName: "Ahmed", lastName: "Hassan", email: "ahmed.hassan@team.com"),
        SwiftlyUIUser(firstName: "Priya", lastName: "Sharma", email: "priya.sharma@team.com"),
        SwiftlyUIUser(firstName: "Elena", lastName: "Petrov", email: "elena.petrov@team.com"),
        SwiftlyUIUser(firstName: "Yuki", lastName: "Tanaka", email: "yuki.tanaka@team.com"),
        SwiftlyUIUser(firstName: "Carlos", lastName: "Rodriguez", email: "carlos.rodriguez@team.com"),
        SwiftlyUIUser(firstName: "Fatima", lastName: "Al-Rashid", email: "fatima.alrashid@team.com")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Select Development Team Members")
                .font(.headline)

            UserTokenField(
                selectedUsers: $selectedUsers,
                searchText: $searchText,
                availableUsers: teamMembers,
                maxUsers: 5,
                placeholder: "Add team member...",
                onAdd: { user in
                    selectedUsers.append(user)
                },
                onRemove: { user in
                    selectedUsers.removeAll { $0.id == user.id }
                }
            )

            Text("Maximum 5 team members can be selected")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

/// Custom user type example.
private struct CustomUserTypeExample: View {
    @State private var selectedUsers: [CustomUser] = []
    @State private var searchText = ""

    struct CustomUser: UserRepresentable {
        let id: UUID
        let firstName: String?
        let lastName: String?
        let email: String
        let department: String
        var avatarURL: URL?
        var avatarImage: Image?
    }

    let availableUsers: [CustomUser] = [
        CustomUser(id: UUID(), firstName: "Alice", lastName: "Johnson", email: "alice@corp.com", department: "Engineering"),
        CustomUser(id: UUID(), firstName: "Robert", lastName: "Smith", email: "robert@corp.com", department: "Design"),
        CustomUser(id: UUID(), firstName: "Linda", lastName: "Martinez", email: "linda@corp.com", department: "Marketing"),
        CustomUser(id: UUID(), firstName: "Thomas", lastName: "Lee", email: "thomas@corp.com", department: "Sales")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            UserTokenField(
                selectedUsers: $selectedUsers,
                searchText: $searchText,
                availableUsers: availableUsers,
                onAdd: { user in
                    selectedUsers.append(user)
                },
                onRemove: { user in
                    selectedUsers.removeAll { $0.id == user.id }
                }
            )

            if !selectedUsers.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Selected (with custom department field):")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    ForEach(selectedUsers) { user in
                        HStack {
                            Text("• \(user.displayName)")
                                .font(.caption)
                            Text("(\(user.department))")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(.top, 8)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("This example uses a custom user type:")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.secondary)

                Text("struct CustomUser: UserRepresentable {")
                    .font(.caption2)
                    .monospaced()
                    .foregroundStyle(.secondary)

                Text("    let firstName: String")
                    .font(.caption2)
                    .monospaced()
                    .foregroundStyle(.secondary)

                Text("    let lastName: String")
                    .font(.caption2)
                    .monospaced()
                    .foregroundStyle(.secondary)

                Text("    let email: String")
                    .font(.caption2)
                    .monospaced()
                    .foregroundStyle(.secondary)

                Text("    let department: String // Custom field")
                    .font(.caption2)
                    .monospaced()
                    .foregroundStyle(.secondary)

                Text("    // ... other required properties")
                    .font(.caption2)
                    .monospaced()
                    .foregroundStyle(.secondary)

                Text("}")
                    .font(.caption2)
                    .monospaced()
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 8)
            .padding(12)
            .background(Color.controlBackground)
            .cornerRadius(8)
        }
    }
}

/// Features overview grid.
private struct FeaturesOverview: View {
    let features = [
        Feature(icon: "magnifyingglass", title: "Search by Name/Email", description: "Intelligent filtering as you type"),
        Feature(icon: "person.crop.circle", title: "Avatar Display", description: "Images, URLs, or auto-generated initials"),
        Feature(icon: "photo.circle", title: "Image & URL Support", description: "Flexible avatar sources"),
        Feature(icon: "number.circle", title: "User Limit Control", description: "Set maximum number of selections"),
        Feature(icon: "keyboard", title: "Keyboard Navigation", description: "Full keyboard support"),
        Feature(icon: "paintbrush.pointed", title: "Custom Types", description: "Works with any UserRepresentable type")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Features")
                .font(.title2)
                .bold()
                .padding(.horizontal)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(features) { feature in
                    FeatureCard(feature: feature)
                }
            }
            .padding(.horizontal)
        }
    }
}

/// Feature card for the features grid.
private struct FeatureCard: View {
    let feature: Feature

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: feature.icon)
                .font(.title2)
                .foregroundStyle(.blue)

            Text(feature.title)
                .font(.subheadline)
                .bold()

            Text(feature.description)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.controlBackground)
        .cornerRadius(12)
    }
}

/// Feature model for the features grid.
private struct Feature: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let description: String
}

#Preview {
    NavigationStack {
        UserTokenFieldDemo()
    }
}
