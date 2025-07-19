#!/bin/bash

echo "🚀 Pons Meat Website Deployment Script"
echo "======================================"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    exit 1
fi

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Not in a git repository. Please initialize git and add your remote repository."
    echo "Run these commands:"
    echo "  git init"
    echo "  git add ."
    echo "  git commit -m 'Initial commit'"
    echo "  git remote add origin YOUR_REPOSITORY_URL"
    echo "  git push -u origin main"
    exit 1
fi

echo "✅ Git repository found"

# Check if there are uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo "⚠️  You have uncommitted changes. Please commit them before deploying."
    echo "Run: git add . && git commit -m 'Your commit message'"
    exit 1
fi

echo "✅ All changes are committed"

# Push to remote repository
echo "📤 Pushing to remote repository..."
git push

echo ""
echo "🎉 Code pushed successfully!"
echo ""
echo "Next steps:"
echo "1. Go to https://dashboard.render.com"
echo "2. Click 'New' → 'Blueprint'"
echo "3. Connect your Git repository"
echo "4. Render will automatically detect the render.yaml file"
echo "5. Set up your environment variables:"
echo "   - MONGO_URI"
echo "   - JWT_SECRET"
echo "   - EMAIL_USER"
echo "   - EMAIL_PASS"
echo ""
echo "📖 For detailed instructions, see DEPLOYMENT.md" 