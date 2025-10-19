#!/bin/bash
# Test script to validate all Terraform configurations
# This script runs terraform fmt, init, and validate on all modules and examples

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "🔍 Validating Terraform configurations..."
echo ""

# Check if terraform is installed
if ! command -v terraform &> /dev/null; then
    echo "❌ Terraform is not installed. Please install Terraform first."
    exit 1
fi

# Directories to validate
DIRS=(
    "modules/azure-vm-network"
    "modules/aws-vm-network"
    "modules/azure-file-storage"
    "modules/aws-s3-storage"
    "examples/azure-vm"
    "examples/aws-vm"
    "examples/azure-storage"
    "examples/aws-storage"
)

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Track results
PASSED=0
FAILED=0

# Run validation for each directory
for dir in "${DIRS[@]}"; do
    FULL_PATH="${REPO_ROOT}/${dir}"
    
    echo "📂 Validating: ${dir}"
    
    # Check if directory exists
    if [ ! -d "${FULL_PATH}" ]; then
        echo -e "${RED}❌ Directory not found: ${dir}${NC}"
        ((FAILED++))
        continue
    fi
    
    cd "${FULL_PATH}"
    
    # Format check
    if terraform fmt -check -recursive > /dev/null 2>&1; then
        echo "  ✓ Format check passed"
    else
        echo -e "${RED}  ✗ Format check failed${NC}"
        ((FAILED++))
        continue
    fi
    
    # Initialize
    if terraform init -backend=false > /dev/null 2>&1; then
        echo "  ✓ Initialization successful"
    else
        echo -e "${RED}  ✗ Initialization failed${NC}"
        ((FAILED++))
        continue
    fi
    
    # Validate
    if terraform validate > /dev/null 2>&1; then
        echo "  ✓ Validation successful"
        ((PASSED++))
    else
        echo -e "${RED}  ✗ Validation failed${NC}"
        ((FAILED++))
        continue
    fi
    
    echo ""
done

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Summary:"
echo -e "  ${GREEN}✓ Passed: ${PASSED}${NC}"
if [ ${FAILED} -gt 0 ]; then
    echo -e "  ${RED}✗ Failed: ${FAILED}${NC}"
    exit 1
else
    echo "  ✗ Failed: 0"
fi
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo ""
echo -e "${GREEN}🎉 All validations passed successfully!${NC}"
