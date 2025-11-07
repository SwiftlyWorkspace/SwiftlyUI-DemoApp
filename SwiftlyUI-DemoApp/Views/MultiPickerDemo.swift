import SwiftUI
import SwiftlyUI

struct MultiPickerDemo: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                VStack(spacing: 8) {
                    Text("MultiPicker")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("A flexible multi-selection picker component with search, sections, and multiple presentation styles.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
                .padding(.top)

                // Features Overview
                MultiPickerFeaturesOverview()
            }
            .padding(.bottom, 32)
        }
    }
}

// MARK: - Basic Examples

struct BasicMultiPickerExamples: View {
    @State private var simpleSelection: Set<Int> = []
    @State private var mediumSelection: Set<String> = []
    @State private var customTypeSelection: Set<UUID> = []

    let simpleItems = [
        (value: 1, label: "Option 1"),
        (value: 2, label: "Option 2"),
        (value: 3, label: "Option 3"),
        (value: 4, label: "Option 4"),
        (value: 5, label: "Option 5")
    ]

    let mediumItems = (1...20).map { (value: "item\($0)", label: "Item \($0)") }

    let customItems: [(value: UUID, label: String)] = (1...10).map {
        (value: UUID(), label: "Custom Item \($0)")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Simple List Example
            VStack(alignment: .leading, spacing: 12) {
                Text("Simple List (5 Items)")
                    .font(.headline)

                MultiPicker("Simple List", selection: $simpleSelection) {
                    ForEach(simpleItems, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.inline)

                if !simpleSelection.isEmpty {
                    Text("Selected: \(simpleSelection.sorted().map(String.init).joined(separator: ", "))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Medium List Example
            VStack(alignment: .leading, spacing: 12) {
                Text("Medium List (20 Items)")
                    .font(.headline)

                MultiPicker("Medium List", selection: $mediumSelection) {
                    ForEach(mediumItems, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.inline)

                if !mediumSelection.isEmpty {
                    Text("\(mediumSelection.count) selected")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Text("Demonstrates scrolling behavior with more items")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Custom Type Example
            VStack(alignment: .leading, spacing: 12) {
                Text("Custom Data Type (UUID)")
                    .font(.headline)

                MultiPicker("UUID-based Items", selection: $customTypeSelection) {
                    ForEach(customItems, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.inline)

                if !customTypeSelection.isEmpty {
                    Text("\(customTypeSelection.count) items selected")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Text("Works with any Hashable type")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }
}

// MARK: - Searchable Examples

struct SearchableMultiPickerExamples: View {
    @State private var selection: Set<String> = []
    @State private var searchText = ""
    @State private var largeSelection: Set<String> = []
    @State private var largeSearchText = ""

    let fruits = [
        "Apple", "Apricot", "Avocado", "Banana", "Blueberry", "Blackberry",
        "Cherry", "Coconut", "Cranberry", "Date", "Dragonfruit", "Elderberry",
        "Fig", "Grape", "Grapefruit", "Guava", "Honeydew", "Huckleberry",
        "Jackfruit", "Kiwi", "Kumquat", "Lemon", "Lime", "Lychee",
        "Mango", "Melon", "Mulberry", "Nectarine", "Orange", "Papaya",
        "Passionfruit", "Peach", "Pear", "Persimmon", "Pineapple", "Plum",
        "Pomegranate", "Quince", "Raspberry", "Starfruit", "Strawberry",
        "Tangerine", "Watermelon"
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Inline Search Example
            VStack(alignment: .leading, spacing: 12) {
                Text("Inline Search (\(fruits.count) items)")
                    .font(.headline)

                SearchableMultiPicker(
                    "Select Fruits",
                    selection: $selection,
                    searchText: $searchText,
                    showSelectAll: true,
                    showClearAll: true
                ) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit).multiPickerTag(fruit)
                    }
                }
                .multiPickerStyle(.inline)

                if !selection.isEmpty {
                    Text("Selected: \(selection.sorted().joined(separator: ", "))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(3)
                }

                Text("Search field appears at top, items shown inline")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Sheet Presentation Example
            VStack(alignment: .leading, spacing: 12) {
                Text("Sheet Presentation")
                    .font(.headline)

                SearchableMultiPicker(
                    "Select Fruits (Sheet)",
                    selection: $largeSelection,
                    searchText: $largeSearchText,
                    showSelectAll: true,
                    showClearAll: true
                ) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit).multiPickerTag(fruit)
                    }
                }
                .multiPickerStyle(.sheet)

                if !largeSelection.isEmpty {
                    Text("Selected: \(largeSelection.count) items")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Text("Search field appears inside the modal sheet")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Statistics
            VStack(alignment: .leading, spacing: 12) {
                Text("Statistics")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Inline Search: '\(searchText.isEmpty ? "(none)" : searchText)'")
                    Text("Inline Results: \(searchText.isEmpty ? fruits.count : fruits.filter { $0.localizedCaseInsensitiveContains(searchText) }.count)")
                    Text("Inline Selected: \(selection.count)")
                    Divider()
                    Text("Sheet Selected: \(largeSelection.count)")
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }
}

// MARK: - Grouped Examples

struct GroupedMultiPickerExamples: View {
    @State private var foodSelection: Set<String> = []
    @State private var categorySelection: Set<String> = []

    let foodSections = [
        (header: "Fruits", items: [
            (value: "apple", label: "Apple"),
            (value: "banana", label: "Banana"),
            (value: "orange", label: "Orange"),
            (value: "grape", label: "Grape")
        ]),
        (header: "Vegetables", items: [
            (value: "carrot", label: "Carrot"),
            (value: "broccoli", label: "Broccoli"),
            (value: "spinach", label: "Spinach"),
            (value: "tomato", label: "Tomato")
        ]),
        (header: "Grains", items: [
            (value: "rice", label: "Rice"),
            (value: "wheat", label: "Wheat"),
            (value: "oats", label: "Oats"),
            (value: "quinoa", label: "Quinoa")
        ]),
        (header: "Proteins", items: [
            (value: "chicken", label: "Chicken"),
            (value: "fish", label: "Fish"),
            (value: "tofu", label: "Tofu"),
            (value: "beans", label: "Beans")
        ])
    ]

    let categorySections = [
        (header: "Electronics", items: [
            (value: "laptop", label: "Laptop"),
            (value: "phone", label: "Phone"),
            (value: "tablet", label: "Tablet")
        ]),
        (header: "Clothing", items: [
            (value: "shirt", label: "Shirt"),
            (value: "pants", label: "Pants"),
            (value: "shoes", label: "Shoes")
        ]),
        (header: "Books", items: [
            (value: "fiction", label: "Fiction"),
            (value: "nonfiction", label: "Non-Fiction"),
            (value: "biography", label: "Biography")
        ])
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Food Categories Example
            VStack(alignment: .leading, spacing: 12) {
                Text("Food Categories")
                    .font(.headline)

                GroupedMultiPicker(
                    title: "Select Foods",
                    sections: foodSections,
                    selection: $foodSelection,
                    showSelectAll: true,
                    showClearAll: true,
                    collapsibleSections: true
                )

                if !foodSelection.isEmpty {
                    Text("Selected: \(foodSelection.sorted().joined(separator: ", "))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Text("Tap section headers to expand/collapse")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Shopping Categories Example
            VStack(alignment: .leading, spacing: 12) {
                Text("Shopping Categories")
                    .font(.headline)

                GroupedMultiPicker(
                    title: "Select Categories",
                    sections: categorySections,
                    selection: $categorySelection,
                    collapsibleSections: false
                )

                if !categorySelection.isEmpty {
                    Text("\(categorySelection.count) items selected")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Text("Non-collapsible sections")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }
}

// MARK: - Style Variations

struct StyleVariationsExamples: View {
    @State private var inlineSelection: Set<Int> = []
    @State private var navigationSelection: Set<Int> = []
    @State private var sheetSelection: Set<Int> = []
    @State private var menuSelection: Set<Int> = []

    let items = [
        (value: 1, label: "Option 1"),
        (value: 2, label: "Option 2"),
        (value: 3, label: "Option 3"),
        (value: 4, label: "Option 4"),
        (value: 5, label: "Option 5")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Inline Style
            VStack(alignment: .leading, spacing: 12) {
                Text("Inline Style")
                    .font(.headline)

                MultiPicker("Inline Style", selection: $inlineSelection) {
                    ForEach(items, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.inline)

                selectionDisplay(for: inlineSelection)

                Text("Items displayed directly in the view")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Navigation Link Style
            VStack(alignment: .leading, spacing: 12) {
                Text("Navigation Link Style")
                    .font(.headline)

                MultiPicker("Navigation Link Style", selection: $navigationSelection) {
                    ForEach(items, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.navigationLink)

                selectionDisplay(for: navigationSelection)

                Text("Navigates to a new screen")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Sheet Style
            VStack(alignment: .leading, spacing: 12) {
                Text("Sheet Style")
                    .font(.headline)

                MultiPicker("Sheet Style", selection: $sheetSelection) {
                    ForEach(items, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.sheet)

                selectionDisplay(for: sheetSelection)

                Text("Presents in a modal sheet")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Menu Style
            VStack(alignment: .leading, spacing: 12) {
                Text("Menu Style")
                    .font(.headline)

                MultiPicker("Menu Style", selection: $menuSelection) {
                    ForEach(items, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.menu)

                selectionDisplay(for: menuSelection)

                Text("Dropdown menu (best for macOS)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }

    @ViewBuilder
    private func selectionDisplay(for selection: Set<Int>) -> some View {
        if !selection.isEmpty {
            Text("Selected: \(selection.sorted().map(String.init).joined(separator: ", "))")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Selection Limits

struct SelectionLimitsExamples: View {
    @State private var minSelection: Set<Int> = []
    @State private var maxSelection: Set<Int> = []
    @State private var rangeSelection: Set<Int> = []

    let items = (1...10).map { (value: $0, label: "Option \($0)") }

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Minimum Selections
            VStack(alignment: .leading, spacing: 12) {
                Text("Minimum Selections")
                    .font(.headline)

                MultiPicker("Min 2 Selections", selection: $minSelection, minSelections: 2) {
                    ForEach(items, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.inline)

                validationDisplay(
                    selection: minSelection,
                    min: 2,
                    max: nil
                )

                Text("Must select at least 2 items")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Maximum Selections
            VStack(alignment: .leading, spacing: 12) {
                Text("Maximum Selections")
                    .font(.headline)

                MultiPicker("Max 3 Selections", selection: $maxSelection, maxSelections: 3) {
                    ForEach(items, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.inline)

                validationDisplay(
                    selection: maxSelection,
                    min: 0,
                    max: 3
                )

                Text("Can select up to 3 items")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Selection Range
            VStack(alignment: .leading, spacing: 12) {
                Text("Selection Range")
                    .font(.headline)

                MultiPicker("2-4 Selections Required", selection: $rangeSelection, minSelections: 2, maxSelections: 4) {
                    ForEach(items, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.inline)

                validationDisplay(
                    selection: rangeSelection,
                    min: 2,
                    max: 4
                )

                Text("Must select between 2 and 4 items")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }

    @ViewBuilder
    private func validationDisplay(selection: Set<Int>, min: Int, max: Int?) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Selected: \(selection.count)")

            if selection.count < min {
                Label("Need \(min - selection.count) more", systemImage: "exclamationmark.circle")
                    .foregroundStyle(.orange)
            } else if let max = max, selection.count >= max {
                Label("Maximum reached", systemImage: "checkmark.circle")
                    .foregroundStyle(.green)
            } else {
                Label("Valid selection", systemImage: "checkmark.circle")
                    .foregroundStyle(.green)
            }
        }
        .font(.caption)
    }
}

// MARK: - Bulk Actions

struct BulkActionsExamples: View {
    @State private var selectAllSelection: Set<String> = []
    @State private var clearAllSelection: Set<String> = []
    @State private var bothSelection: Set<String> = []

    let items = (1...15).map { (value: "item\($0)", label: "Item \($0)") }

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Select All Action
            VStack(alignment: .leading, spacing: 12) {
                Text("Select All Action")
                    .font(.headline)

                MultiPicker("With Select All", selection: $selectAllSelection, showSelectAll: true) {
                    ForEach(items, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.inline)

                Text("\(selectAllSelection.count) of \(items.count) selected")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text("Quickly select all available items")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Clear All Action
            VStack(alignment: .leading, spacing: 12) {
                Text("Clear All Action")
                    .font(.headline)

                MultiPicker("With Clear All", selection: $clearAllSelection, showClearAll: true) {
                    ForEach(items, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.inline)

                Text("\(clearAllSelection.count) of \(items.count) selected")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text("Quickly deselect all items")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)

            // Combined Actions with Limit
            VStack(alignment: .leading, spacing: 12) {
                Text("Combined Actions with Limit")
                    .font(.headline)

                MultiPicker("Both Actions", selection: $bothSelection, maxSelections: 10, showSelectAll: true, showClearAll: true) {
                    ForEach(items, id: \.value) { item in
                        Text(item.label).multiPickerTag(item.value)
                    }
                }
                .multiPickerStyle(.inline)

                VStack(alignment: .leading, spacing: 4) {
                    Text("\(bothSelection.count) of \(items.count) selected")
                    Text("Maximum: 10")
                        .foregroundStyle(.secondary)
                }
                .font(.caption)

                Text("Select All respects the maximum limit")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }
}

// MARK: - Features Overview

struct MultiPickerFeaturesOverview: View {
    var body: some View {
        List {
            FeatureRow(
                icon: "checkmark.circle.fill",
                title: "Multi-Selection",
                description: "Select multiple items simultaneously using checkboxes"
            )

            FeatureRow(
                icon: "magnifyingglass",
                title: "Search & Filter",
                description: "SearchableMultiPicker provides real-time filtering"
            )

            FeatureRow(
                icon: "slider.horizontal.3",
                title: "Selection Limits",
                description: "Set minimum and maximum selection constraints"
            )

            FeatureRow(
                icon: "square.stack.3d.up",
                title: "Bulk Actions",
                description: "Select All and Clear All for quick management"
            )

            FeatureRow(
                icon: "square.grid.2x2",
                title: "Multiple Styles",
                description: "Inline, navigation, sheet, and menu presentation"
            )

            FeatureRow(
                icon: "paintbrush.fill",
                title: "Customizable Display",
                description: "Badge, abbreviated, or tag-based selection display"
            )

            FeatureRow(
                icon: "laptopcomputer.and.iphone",
                title: "Cross-Platform",
                description: "Works on iOS, macOS, tvOS, and watchOS"
            )

            FeatureRow(
                icon: "folder.fill",
                title: "Section Support",
                description: "GroupedMultiPicker for categorized data"
            )

            FeatureRow(
                icon: "keyboard.fill",
                title: "Keyboard Navigation",
                description: "Full keyboard and accessibility support"
            )

            FeatureRow(
                icon: "swift",
                title: "Type-Safe",
                description: "Works with any Hashable type (Int, String, UUID, custom)"
            )
        }
        .navigationTitle("Features")
    }
}

struct FeatureRow: View {
    let icon: String
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.blue)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)

                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        MultiPickerDemo()
    }
}
