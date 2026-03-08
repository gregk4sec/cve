#!/bin/bash

# ============================================================
# Auto-create a new CVE or Security Finding repository
# Author: gregk4sec
# ============================================================

# Usage:
#   ./create-repo.sh cve 2026-21962 "Oracle OHS Path Traversal" public
#   ./create-repo.sh finding msrc-123456 "Windows Auth Logic Issue" private
#
# Arguments:
#   $1 = type: cve | finding
#   $2 = id: CVE-YYYY-XXXX or vendor-case-id
#   $3 = title: short title
#   $4 = visibility: public | private
# ============================================================

TYPE=$1
ID=$2
TITLE=$3
VISIBILITY=$4

if [ -z "$TYPE" ] || [ -z "$ID" ] || [ -z "$TITLE" ] || [ -z "$VISIBILITY" ]; then
    echo "Usage: ./create-repo.sh <cve|finding> <id> <title> <public|private>"
    exit 1
fi

# Normalize repo name
REPO_NAME=$(echo "$TYPE-$ID" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

echo "Creating repository: $REPO_NAME"
mkdir "../$REPO_NAME"
cd "..$REPO_NAME"

# Copy template
if [ "$TYPE" = "cve" ]; then
    cp -R ../cve/templates/cve-template/* .
else
    cp -R ../cvetemplates/security-finding-template/* .
fi

# Insert metadata.json
cat <<EOF > metadata.json
{
    "type": "$TYPE",
    "id": "$ID",
    "title": "$TITLE",
    "vendor": "",
    "product": "",
    "severity": "",
    "status": "Private",
    "discoverer": "gregk4sec (https://github.com/gregk4sec/cve)",
    "discovery_date": "",
    "public_date": null,
    "repository": "https://github.com/gregk4sec/$REPO_NAME"
}
EOF

# Insert badges into README.md
BADGES=""

if [ "$TYPE" = "cve" ]; then
BADGES=$(cat <<'EOF'
![Type: CVE](https://img.shields.io/badge/Type-CVE-critical?style=for-the-badge&logo=cve)
![Discoverer: gregk4sec](https://img.shields.io/badge/Discoverer-gregk4sec-black?style=for-the-badge&logo=github)
EOF
)
else
BADGES=$(cat <<'EOF'
![Type: Security Finding](https://img.shields.io/badge/Type-Security%20Finding-blue?style=for-the-badge)
![Discoverer: gregk4sec](https://img.shields.io/badge/Discoverer-gregk4sec-black?style=for-the-badge&logo=github)
EOF
)
fi

# Prepend badges to README.md
echo "$BADGES" | cat - README.md > temp && mv temp README.md

# Initialize git
git init
git add .
git commit -m "Initial commit for $ID"

# Create GitHub repo
gh repo create "gregk4sec/$REPO_NAME" --$VISIBILITY --source=. --remote=origin --push

echo "Repository created: https://github.com/gregk4sec/$REPO_NAME"
