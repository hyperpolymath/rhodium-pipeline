# Security Policy

This document describes the security policy for Rhodium Pipeline Template, including supported versions, how to report vulnerabilities, and what to expect during the disclosure process.

## Supported Versions

We provide security updates for the following versions. Users on unsupported versions should upgrade promptly.

| Version | Status | Notes |
|---------|--------|-------|
| 1.x.x | ✓ Supported | Current stable release; receives all security patches |
| 0.x.x | ✗ Pre-release | Development versions; no security guarantees |

## Security Considerations for Generated Projects

This template generates code that handles:

- File system operations (reading/writing data)
- Cryptographic checksums (integrity verification)
- Configuration parsing (potential injection vectors)
- External tool invocation (Isabelle, Nickel, Guile)

### Template-Level Security

The template itself is reviewed for:

- No hardcoded credentials or secrets
- Safe defaults for file permissions
- Validated input patterns in generated CLI
- Proper escaping in shell-invoking recipes

### Generated Project Security

Projects generated from this template inherit:

- Input validation via Nickel contracts and Guile validators
- Checksum verification for data integrity
- Configurable sandboxing recommendations
- Principle of least privilege in default configurations

## Reporting a Vulnerability

We take security vulnerabilities seriously. If you discover a security issue, please report it responsibly.

### How to Report

**Preferred method:** Email `security@rhodium-pipeline.dev` with details.

**Alternative:** Use GitHub's private vulnerability reporting feature on the project repository.

> **Important:** Please *do not* open public issues for security vulnerabilities.

### What to Include

To help us triage and respond quickly, please provide:

- A clear description of the vulnerability
- Whether the issue is in the template itself or in generated projects
- Steps to reproduce or a proof-of-concept
- Affected version(s)
- Potential impact assessment
- Any suggested mitigations or fixes (optional)

### Our Commitment

Upon receiving your report, we will:

| Timeline | Action |
|----------|--------|
| Within 48 hours | Acknowledge receipt and assign a tracking identifier |
| Within 7 days | Provide an initial assessment and severity rating |
| Within 30 days | Aim to release a fix for confirmed vulnerabilities (timeline may vary based on complexity) |

We will keep you informed throughout the process and coordinate disclosure timing with you.

### Disclosure Policy

We follow a **coordinated disclosure** model:

1. We work with the reporter to understand and verify the issue.
2. We develop and test a fix.
3. We release the fix and publish a security advisory.
4. After the fix is available, the vulnerability may be publicly disclosed.

We request that reporters refrain from public disclosure until a fix is available, unless we are unresponsive beyond 90 days.

### Recognition

We gratefully acknowledge security researchers who report vulnerabilities responsibly. With your permission, we will credit you in our security advisories and CONTRIBUTORS file.

## Security Advisories

Security advisories are published via:

- The project's [GitHub Security Advisories](https://github.com/hyperpolymath/rhodium-pipeline/security/advisories) page
- Release notes for affected versions

## Security-Related Configuration

For guidance on securely deploying pipelines generated from this template:

- Use principle of least privilege for file system access
- Validate all external inputs before processing
- Enable checksum verification in production
- Review Guile scripts for injection vulnerabilities
- Run Isabelle proofs to verify invariants hold

## Formal Verification and Security

A key security feature of Rhodium pipelines is formal verification via Isabelle/HOL:

- **Partition invariants** ensure data doesn't leak between categories
- **Bijection invariants** ensure mappings are reversible and complete
- **Checksum invariants** ensure integrity verification is sound

These proofs provide mathematical guarantees about structural properties, reducing entire classes of data handling bugs.

## Contact

For general security enquiries (not vulnerability reports): `security@rhodium-pipeline.dev`

For template methodology questions: See [HANDOVER.adoc](docs/HANDOVER.adoc)
