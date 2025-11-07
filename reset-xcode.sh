#!/bin/bash

echo "🧹 Cleaning Xcode caches for SwiftlyUI-DemoApp..."

# Close Xcode if it's running
echo "Closing Xcode..."
osascript -e 'quit app "Xcode"' 2>/dev/null || true
sleep 2

# Clean SPM build folder
echo "Cleaning .build folder..."
rm -rf .build

# Clean derived data for this project
echo "Cleaning derived data..."
rm -rf ~/Library/Developer/Xcode/DerivedData/*SwiftlyUI*

# Reset SPM packages
echo "Resetting Swift packages..."
swift package reset
swift package resolve
swift package update

echo ""
echo "✅ Done! You can now:"
echo "   1. Open the project in Xcode"
echo "   2. Wait for indexing to complete"
echo "   3. Build the project (Cmd+B)"
echo ""
echo "If you still see errors, try:"
echo "   - Xcode menu: Product → Clean Build Folder (Shift+Cmd+K)"
echo "   - Xcode menu: File → Packages → Reset Package Caches"
