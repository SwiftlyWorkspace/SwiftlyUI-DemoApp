//
//  TimelineDemo.swift
//  SwiftlyUI-DemoApp
//
//  Created by Claude Code on 07/11/2025.
//

import SwiftUI
import SwiftlyUI

/// Demo view showcasing all Timeline component capabilities.
struct TimelineDemo: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // Header
                VStack(spacing: 12) {
                    Text("Timeline")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("A chronological timeline component for displaying events with customizable styles and indicators.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top)

                // Features
                VStack(alignment: .leading, spacing: 16) {
                    Text("Key Features")
                        .font(.headline)

                    TimelineFeatureRow(icon: "list.bullet", title: "Multiple Styles", description: "Vertical, horizontal, compact, and GitHub branching")
                    TimelineFeatureRow(icon: "arrow.triangle.branch", title: "Branch Visualization", description: "GitHub-style branch and merge visualization")
                    TimelineFeatureRow(icon: "circle.fill", title: "Customizable Indicators", description: "Shape, size, color, and icons")
                    TimelineFeatureRow(icon: "line.diagonal", title: "Connector Styles", description: "Solid, dashed, or dotted lines")
                    TimelineFeatureRow(icon: "paintbrush", title: "Status Colors", description: "Automatic coloring based on status")
                    TimelineFeatureRow(icon: "calendar", title: "Auto-Sorting", description: "Chronological ordering by date")
                }
                .padding(.horizontal)

                Divider()
                    .padding(.horizontal)

                // Quick Examples
                VStack(alignment: .leading, spacing: 24) {
                    Text("Quick Examples")
                        .font(.headline)
                        .padding(.horizontal)

                    // Vertical Timeline
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Vertical Timeline")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal)

                        Timeline(items: sampleEvents)
                            .timelineStyle(.vertical)
                            .frame(height: 300)
                            .padding(.horizontal)
                    }

                    // GitHub Branching
                    VStack(alignment: .leading, spacing: 12) {
                        Text("GitHub Branching Timeline")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal)

                        Timeline(items: gitHistory)
                            .timelineStyle(.github)
                            .frame(height: 400)
                            .padding(.horizontal)
                    }
                }

                Divider()
                    .padding(.horizontal)

                // Code Example
                VStack(alignment: .leading, spacing: 12) {
                    Text("Basic Usage")
                        .font(.headline)
                        .padding(.horizontal)

                    CodeBlock("""
                    @State private var events: [TimelineItem] = [
                        TimelineItem(
                            date: date1,
                            title: "Task Started",
                            status: .inProgress
                        ),
                        TimelineItem(
                            date: date2,
                            title: "Task Completed",
                            status: .completed
                        )
                    ]

                    Timeline(items: events)
                        .timelineStyle(.vertical)
                    """)
                    .padding(.horizontal)
                }

                Divider()
                    .padding(.horizontal)

                // Git Branching Example
                VStack(alignment: .leading, spacing: 12) {
                    Text("Git Branching")
                        .font(.headline)
                        .padding(.horizontal)

                    CodeBlock("""
                    let main = TimelineItem(
                        date: date1,
                        title: "Initial commit"
                    )
                    let feature = TimelineItem(
                        date: date2,
                        title: "Feature work",
                        parentIds: [main.id]
                    )
                    let merge = TimelineItem(
                        date: date3,
                        title: "Merge feature",
                        parentIds: [main.id, feature.id]
                    )

                    Timeline(items: [main, feature, merge])
                        .timelineStyle(.github)
                    """)
                    .padding(.horizontal)
                }
            }
            .padding(.bottom, 32)
        }
    }

    // Sample data
    private var sampleEvents: [TimelineItem] {
        let now = Date()
        return [
            TimelineItem(
                date: now.addingTimeInterval(-7200),
                title: "Project Started",
                description: "Kicked off the new project",
                status: .completed
            ),
            TimelineItem(
                date: now.addingTimeInterval(-3600),
                title: "Development",
                description: "Currently implementing features",
                status: .inProgress
            ),
            TimelineItem(
                date: now,
                title: "Code Review",
                description: "Pending review",
                status: .review
            )
        ]
    }

    private var gitHistory: [TimelineItem] {
        let now = Date()
        let commit1Id = UUID()
        let commit2Id = UUID()
        let featureId = UUID()

        return [
            TimelineItem(
                id: commit1Id,
                date: now.addingTimeInterval(-10000),
                title: "Initial commit",
                description: "Set up project",
                status: .completed
            ),
            TimelineItem(
                id: commit2Id,
                date: now.addingTimeInterval(-8000),
                title: "Add core features",
                description: "Implement main functionality",
                status: .completed,
                parentIds: [commit1Id]
            ),
            TimelineItem(
                id: featureId,
                date: now.addingTimeInterval(-6000),
                title: "Feature: Dark mode",
                description: "Implement dark mode support",
                status: .inProgress,
                parentIds: [commit2Id]
            ),
            TimelineItem(
                date: now.addingTimeInterval(-4000),
                title: "Fix bugs",
                description: "Resolve issues",
                status: .completed,
                parentIds: [commit2Id]
            ),
            TimelineItem(
                date: now,
                title: "Merge feature",
                description: "Merge dark mode",
                status: .completed,
                parentIds: [commit2Id, featureId]
            )
        ]
    }
}

// MARK: - Vertical Timeline Example

struct VerticalTimelineExample: View {
    @State private var events: [TimelineItem] = []

    var body: some View {
        VStack(spacing: 20) {
            Timeline(items: events)
                .timelineStyle(.vertical)
                .timelineIndicator(shape: .circle, size: 14)
                .timelineConnector(width: 2, style: .solid)
                .frame(height: 400)

            Button("Add Event") {
                events.append(TimelineItem(
                    date: Date(),
                    title: "New Event \(events.count + 1)",
                    description: "Event description",
                    status: [.completed, .inProgress, .pending].randomElement()!
                ))
            }
        }
    }
}

// MARK: - Horizontal Timeline Example

struct HorizontalTimelineExample: View {
    private let milestones: [TimelineItem] = {
        let now = Date()
        return [
            TimelineItem(
                date: now.addingTimeInterval(-86400 * 30),
                title: "Q1 2024",
                description: "Planning phase",
                status: .completed
            ),
            TimelineItem(
                date: now.addingTimeInterval(-86400 * 20),
                title: "Q2 2024",
                description: "Development",
                status: .completed
            ),
            TimelineItem(
                date: now.addingTimeInterval(-86400 * 10),
                title: "Q3 2024",
                description: "Testing",
                status: .inProgress
            ),
            TimelineItem(
                date: now,
                title: "Q4 2024",
                description: "Launch",
                status: .pending
            )
        ]
    }()

    var body: some View {
        Timeline(items: milestones)
            .timelineStyle(.horizontal)
            .timelineIndicator(shape: .diamond, size: 16, color: .blue)
            .frame(height: 200)
    }
}

// MARK: - Compact Timeline Example

struct CompactTimelineExample: View {
    private let notifications: [TimelineItem] = {
        let now = Date()
        return [
            TimelineItem(
                date: now.addingTimeInterval(-300),
                title: "New message received",
                status: .completed
            ),
            TimelineItem(
                date: now.addingTimeInterval(-180),
                title: "File uploaded",
                status: .completed
            ),
            TimelineItem(
                date: now.addingTimeInterval(-60),
                title: "Task assigned",
                status: .inProgress
            ),
            TimelineItem(
                date: now,
                title: "Meeting reminder",
                status: .pending
            )
        ]
    }()

    var body: some View {
        Timeline(items: notifications)
            .timelineStyle(.compact)
            .timelineIndicator(size: 8)
            .frame(height: 250)
    }
}

// MARK: - GitHub Branching Example

struct GitHubBranchingExample: View {
    private var commits: [TimelineItem] {
        let now = Date()
        let mainCommit = UUID()
        let featureBranchStart = UUID()
        let mainContinue = UUID()
        let featureContinue = UUID()

        return [
            TimelineItem(
                id: mainCommit,
                date: now.addingTimeInterval(-20000),
                title: "Initial commit",
                description: "Set up project structure",
                status: .completed
            ),
            TimelineItem(
                id: mainContinue,
                date: now.addingTimeInterval(-15000),
                title: "Add authentication",
                description: "Implement user login",
                status: .completed,
                parentIds: [mainCommit]
            ),
            TimelineItem(
                id: featureBranchStart,
                date: now.addingTimeInterval(-12000),
                title: "Feature: Dark mode",
                description: "Start dark mode implementation",
                status: .inProgress,
                parentIds: [mainContinue]
            ),
            TimelineItem(
                id: featureContinue,
                date: now.addingTimeInterval(-8000),
                title: "Complete dark mode",
                description: "Finish dark mode styling",
                status: .completed,
                parentIds: [featureBranchStart]
            ),
            TimelineItem(
                date: now.addingTimeInterval(-5000),
                title: "Fix auth bug",
                description: "Resolve token issue",
                status: .completed,
                parentIds: [mainContinue]
            ),
            TimelineItem(
                date: now,
                title: "Merge dark mode",
                description: "Merge feature branch",
                status: .completed,
                parentIds: [mainContinue, featureContinue]
            )
        ]
    }

    var body: some View {
        Timeline(items: commits)
            .timelineStyle(.github)
            .frame(height: 500)
    }
}

// MARK: - Custom Styling Example

struct CustomStylingExample: View {
    private let tasks: [TimelineItem] = {
        let now = Date()
        return [
            TimelineItem(
                date: now.addingTimeInterval(-7200),
                title: "Design Review",
                description: "Reviewed UI mockups",
                status: .completed
            ),
            TimelineItem(
                date: now.addingTimeInterval(-3600),
                title: "Implementation",
                description: "Building features",
                status: .inProgress
            ),
            TimelineItem(
                date: now,
                title: "Testing",
                description: "QA validation",
                status: .pending
            )
        ]
    }()

    var body: some View {
        VStack(spacing: 32) {
            // Custom indicators
            Timeline(items: tasks)
                .timelineStyle(.vertical)
                .timelineIndicator(shape: .roundedSquare(), size: 18, color: .purple)
                .timelineConnector(width: 3, color: .purple.opacity(0.3), style: .dashed)
                .frame(height: 250)

            // With icons
            Timeline(items: tasks)
                .timelineStyle(.vertical)
                .timelineIndicator(shape: .circle, size: 24, icon: "checkmark")
                .timelineConnector(width: 2, style: .dotted)
                .frame(height: 250)
        }
    }
}

// MARK: - Helper Views

private struct TimelineFeatureRow: View {
    let icon: String
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(.blue)
                .frame(width: 24)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct CodeBlock: View {
    let code: String

    init(_ code: String) {
        self.code = code
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(code)
                .font(.system(.caption, design: .monospaced))
                .padding()
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview("Timeline Demo") {
    TimelineDemo()
}

#Preview("Vertical Timeline") {
    VerticalTimelineExample()
}

#Preview("Horizontal Timeline") {
    HorizontalTimelineExample()
}

#Preview("Compact Timeline") {
    CompactTimelineExample()
}

#Preview("GitHub Branching") {
    GitHubBranchingExample()
}

#Preview("Custom Styling") {
    CustomStylingExample()
}
