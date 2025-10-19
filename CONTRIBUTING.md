# Contributing to Infrastructure Tools

Thank you for your interest in contributing to this project! This guide will help you get started.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- Git
- Azure CLI (for testing Azure modules)
- AWS CLI (for testing AWS modules)

## Development Workflow

1. **Fork and Clone**
   ```bash
   git fork https://github.com/vtanathip/infrastructure-tools.git
   cd infrastructure-tools
   ```

2. **Create a Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Changes**
   - Follow the existing code structure
   - Keep modules focused and reusable
   - Update documentation as needed

4. **Test Your Changes**
   ```bash
   # Run validation tests
   ./scripts/test.sh
   
   # Format code
   terraform fmt -recursive
   
   # Validate specific module
   cd modules/your-module
   terraform init -backend=false
   terraform validate
   ```

5. **Commit and Push**
   ```bash
   git add .
   git commit -m "Description of your changes"
   git push origin feature/your-feature-name
   ```

6. **Create Pull Request**
   - Go to GitHub and create a pull request
   - Describe your changes
   - Wait for CI checks to pass

## Code Standards

### Terraform

- Use consistent formatting (run `terraform fmt`)
- Include variables.tf, outputs.tf, and main.tf in each module
- Add README.md with usage examples
- Use descriptive variable and resource names
- Add descriptions to all variables and outputs

### Documentation

- Keep README files up to date
- Include examples in module documentation
- Document any prerequisites or special requirements

### Module Structure

```
module-name/
├── main.tf           # Main resource definitions
├── variables.tf      # Input variables
├── outputs.tf        # Output values
└── README.md         # Module documentation
```

### Example Structure

```
example-name/
├── main.tf           # Example usage
├── variables.tf      # Required variables
├── outputs.tf        # Outputs to display
└── README.md         # Usage instructions
```

## Testing

All changes must pass the validation tests:

1. **Formatting**: Code must be properly formatted
2. **Initialization**: Must initialize without errors
3. **Validation**: Must pass Terraform validation

The GitHub Actions workflow will automatically run these tests on pull requests.

## Adding New Modules

When adding a new module:

1. Create the module directory structure
2. Add all required Terraform files
3. Create an example in the examples/ directory
4. Add tests for the new module
5. Update the main README.md

## Questions?

If you have questions, please open an issue on GitHub.
