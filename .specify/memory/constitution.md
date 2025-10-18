<!--
SYNC IMPACT REPORT
==================
Version Change: 1.0.0 → 1.1.0 (MINOR - New principle added)
Added hierarchical documentation structure principle

Modified/Added Principles:
- NEW: V. Hierarchical Documentation (Folder-level documentation structure)
- EXISTING: I. Module-First Design (Terraform module architecture) - unchanged
- EXISTING: II. Clean Terraform Code (Code quality standards) - unchanged
- EXISTING: III. Test-Driven Infrastructure (Testing requirements) - unchanged
- EXISTING: IV. Template Repository Design (Reusability standards) - unchanged

Enhanced Sections:
- Module Quality Standards: Updated Structure Requirements to mandate folder README.md files

Templates Requiring Updates:
✅ plan-template.md - Constitution Check section already supports custom principles
✅ spec-template.md - User scenarios align with documentation requirements
✅ tasks-template.md - Task categorization supports documentation tasks

Follow-up TODOs: None - all placeholders resolved
-->

# Infrastructure Tools Constitution

## Core Principles

### I. Module-First Design

Every infrastructure component MUST be developed as a reusable Terraform module. Modules MUST be:

- **Self-contained**: Complete with variables, outputs, resources, and data sources
- **Single responsibility**: Each module addresses one specific infrastructure concern
- **Independently deployable**: Can be used standalone or composed with other modules
- **Well-documented**: Include README.md with usage examples, input/output descriptions
- **Version-controlled**: Follow semantic versioning for breaking changes

**Rationale**: Module-first design ensures reusability across projects, simplifies testing, and promotes infrastructure as code best practices. This aligns with the template repository goal where modules serve as building blocks for other projects.

### II. Clean Terraform Code

All Terraform code MUST adhere to strict quality standards:

- **Formatting**: Run `terraform fmt` before every commit (enforced via pre-commit hooks)
- **Validation**: All code MUST pass `terraform validate` without errors
- **Linting**: Use `tflint` with cloud provider-specific rulesets enabled
- **Naming conventions**: Use clear, descriptive names (snake_case for resources, descriptive prefixes)
- **No hardcoded values**: All environment-specific values MUST be parameterized via variables
- **DRY principle**: Eliminate code duplication through modules, locals, and data sources
- **Minimal complexity**: Avoid nested conditionals; prefer explicit resources over complex count/for_each logic

**Rationale**: Clean code improves maintainability, reduces errors, and makes modules easier to understand and adopt. As a template repository, code quality directly impacts downstream projects.

### III. Test-Driven Infrastructure (NON-NEGOTIABLE)

Infrastructure code MUST be testable and tested before deployment:

- **Static validation**: `terraform validate` and `tflint` MUST pass (Phase 0)
- **Plan review**: Generate and review `terraform plan` output for expected changes (Phase 1)
- **Unit tests**: Test module logic with `terraform-compliance` or similar (Phase 2)
- **Integration tests**: Deploy to isolated test environment, verify resources created (Phase 3)
- **Test environments**: Maintain separate test/staging environments for validation
- **Automated testing**: Integrate tests into CI/CD pipeline (all phases)
- **Documentation**: Include test examples in module README.md

**Testing Workflow**:

1. Write test cases defining expected infrastructure behavior
2. Implement Terraform module
3. Run static validation (fmt, validate, lint)
4. Generate and review plan
5. Deploy to test environment
6. Verify infrastructure state matches expectations
7. Destroy test resources

**Rationale**: Infrastructure failures can be costly and dangerous. Testing ensures reliability, catches issues early, and provides confidence when using modules as templates. This principle is NON-NEGOTIABLE because untested infrastructure code poses unacceptable risk.

### IV. Template Repository Design

As a template repository, all code MUST prioritize reusability and ease of adoption:

- **Minimal boilerplate**: Provide only essential code; avoid over-engineering
- **Clear examples**: Include complete, working examples for each module in `examples/` directory
- **Comprehensive documentation**: Every module MUST have usage guide, requirements, and examples
- **Parameterization**: Expose configuration through well-designed variables with sensible defaults
- **Provider agnostic structure**: Organize by provider (azure/, aws/, gcp/) for multi-cloud support
- **Zero coupling**: Modules MUST NOT depend on specific organizational structure or naming
- **Quick start**: Include root-level README with getting started guide and architecture overview

**Rationale**: Template repositories serve as starting points for other projects. Minimal, well-documented, example-driven code accelerates adoption and reduces integration friction.

### V. Hierarchical Documentation

Documentation MUST be structured hierarchically with appropriate README files at each level:

- **Root README.md**: High-level overview only - repository purpose, architecture summary, quick start guide, and navigation to major sections
- **Folder README.md**: Every important folder (modules/, scripts/, provider folders, feature folders) MUST contain a README.md explaining:
  - Purpose and scope of the folder
  - Contents overview (what's inside)
  - Usage instructions specific to that context
  - Examples relevant to that folder's functionality
  - Navigation to sub-folders if applicable
- **Module README.md**: Each Terraform module MUST have detailed documentation (per Module Quality Standards)
- **Progressive disclosure**: Users navigate from high-level (root) to detailed (folder/module) documentation without duplication

**Documentation Hierarchy Example**:

```text
README.md                          # High-level: What, Why, Quick Start
├── modules/
│   ├── README.md                  # Modules overview, conventions, usage patterns
│   ├── azure/
│   │   ├── README.md              # Azure-specific modules, provider setup
│   │   ├── compute/
│   │   │   ├── README.md          # Compute category overview
│   │   │   └── vm/
│   │   │       └── README.md      # Specific VM module details
│   │   └── networking/
│   │       ├── README.md          # Networking category overview
│   │       └── vnet/
│   │           └── README.md      # Specific VNet module details
│   └── shared/
│       └── README.md              # Shared/common modules
└── scripts/
    └── README.md                  # Scripts purpose, usage, conventions
```

**Anti-patterns to avoid**:

- ❌ Root README with excessive technical details (keep high-level)
- ❌ Empty folders without README.md explaining their purpose
- ❌ Duplicating same content across multiple README files
- ❌ Navigation gaps (user can't find their way from root to specific module)

**Rationale**: Hierarchical documentation improves discoverability and user experience. Users can quickly understand the high-level structure (root README) and drill down to specific details (folder README) as needed. This is critical for template repositories where users need to quickly understand what's available and how to use it.

## Module Quality Standards

All Terraform modules MUST meet these quality gates:

**Structure Requirements**:

- `main.tf` - Primary resource definitions
- `variables.tf` - Input variable declarations with descriptions
- `outputs.tf` - Output value declarations with descriptions
- `versions.tf` - Terraform and provider version constraints
- `README.md` - Module documentation with usage examples (per Hierarchical Documentation principle)
- `examples/` - At least one complete working example
- `tests/` - Validation and integration tests (if applicable)

**Folder Documentation Requirements** (per Principle V):

- Every module category folder (e.g., `modules/azure/compute/`) MUST have README.md
- Every provider folder (e.g., `modules/azure/`) MUST have README.md
- Top-level functional folders (e.g., `modules/`, `scripts/`) MUST have README.md
- Root README.md MUST provide high-level overview only, not detailed usage

**Documentation Requirements**:

- Purpose and scope of the module
- Prerequisites and dependencies
- Input variables table (name, type, description, default)
- Output values table (name, description)
- Usage example with realistic values
- Known limitations or considerations

**Code Quality Gates**:

- ✅ `terraform fmt -check` passes
- ✅ `terraform validate` passes
- ✅ `tflint` passes with no errors
- ✅ Example deploys successfully to test environment
- ✅ All outputs can be successfully consumed
- ✅ Module works with minimum required provider versions

## Development Workflow

**Module Development Cycle**:

1. **Planning**: Define module scope, inputs, outputs in specification
2. **Structure**: Create module directory with required files
3. **Implementation**: Write Terraform code following clean code principles
4. **Validation**: Run fmt, validate, lint locally
5. **Example**: Create working example demonstrating module usage
6. **Testing**: Deploy example to test environment, verify functionality
7. **Documentation**: Complete README with all required sections
8. **Review**: Submit PR with checklist verification
9. **Merge**: After approval and CI/CD validation passes

**CI/CD Pipeline Requirements**:

- Static validation on all commits (fmt, validate, lint)
- Plan generation and review for PRs
- Integration testing in isolated environment
- Automated documentation generation/validation
- Security scanning for credentials or sensitive data

## Governance

This constitution supersedes all other development practices and coding standards. All infrastructure code contributions MUST comply with these principles.

**Amendment Process**:

- Proposed changes require documented justification with impact analysis
- Team review and approval required for principle additions or modifications
- Version bump follows semantic versioning (MAJOR for breaking governance changes, MINOR for new principles, PATCH for clarifications)
- All dependent templates and documentation MUST be updated before amendment finalization

**Compliance Verification**:

- All pull requests MUST include constitution compliance checklist
- Code reviews MUST verify adherence to clean code and testing principles
- Complexity violations MUST be explicitly justified with technical rationale
- Template quality audits conducted quarterly to ensure consistency

**Conflict Resolution**:

- Constitution principles take precedence over convenience or speed
- When principles conflict (rare), prioritize: (1) Testing, (2) Clean Code, (3) Module Design, (4) Template Design, (5) Documentation
- Exceptions require documented approval from module maintainers

**Version**: 1.1.0 | **Ratified**: 2025-10-18 | **Last Amended**: 2025-10-18
