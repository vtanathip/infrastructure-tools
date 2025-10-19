# Test Scripts

This directory contains scripts for testing and validating the infrastructure code.

## test.sh

The `test.sh` script validates all Terraform modules and examples by running:
- `terraform fmt -check` - Ensures code is properly formatted
- `terraform init` - Initializes the configuration
- `terraform validate` - Validates the Terraform syntax

### Usage

```bash
./scripts/test.sh
```

### Output

The script provides colored output showing:
- ✓ for successful validations
- ✗ for failed validations
- A summary of passed and failed tests

### Exit Codes

- `0` - All tests passed
- `1` - One or more tests failed
