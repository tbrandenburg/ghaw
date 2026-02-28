---
agent: agent
---

# Code Safety Review Prompt

## Objective
Conduct a comprehensive software safety review following ISO 26262-6 (Software Development) to identify code-level safety risks, systematic software failures, and implementation defects. This review focuses on source code analysis, software architecture safety, and compliance with ASIL-specific coding standards and verification requirements.

## Software Item Definition and Context

### Software Boundaries and Architecture
- **Software Components**: Identify safety-related and non-safety-related software elements
- **Interface Definition**: APIs, data structures, communication protocols, shared resources
- **Execution Context**: Real-time constraints, memory management, interrupt handling
- **Integration Architecture**: Software layers, middleware dependencies, hardware abstraction
- **Configuration Items**: Source files, libraries, build scripts, deployment artifacts

### Software Safety Lifecycle Assessment
- **Planning Phase**: Software safety plan, development environment, tool qualification
- **Requirements Phase**: Software safety requirements specification and allocation
- **Architecture Design**: Software architectural design, safety mechanisms implementation
- **Unit Design/Implementation**: Detailed design, coding standards compliance, unit testing
- **Integration/Testing**: Software integration, safety validation, verification evidence

## Software Hazard Analysis

### Code-Level Hazard Identification
- **Logic Errors**: Incorrect algorithms, faulty control flow, wrong calculations
- **Memory Safety**: Buffer overflows, use-after-free, memory leaks, stack overflows
- **Concurrency Issues**: Race conditions, deadlocks, data races, atomic operation failures
- **Interface Violations**: API misuse, parameter validation failures, contract violations
- **Resource Management**: File handle leaks, network connection issues, hardware resource conflicts
- **Exception Handling**: Unhandled exceptions, incorrect error propagation, recovery failures
- **Configuration Errors**: Wrong constants, incorrect build configurations, deployment mismatches

### Risk Assessment Factors
- **Severity (S)**: Potential harm to persons in operational situations
  - S0: No injuries
  - S1: Light to moderate injuries  
  - S2: Severe to life-threatening injuries
  - S3: Life-threatening to fatal injuries
- **Exposure (E)**: Probability of operational situation causing hazard
  - E0: Very low probability
  - E1: Low probability
  - E2: Medium probability  
  - E3: High probability
  - E4: Very high probability
- **Controllability (C)**: Ability to avoid specified harm through driver/passenger actions
  - C0: Controllable in general
  - C1: Simply controllable
  - C2: Normally controllable
  - C3: Difficult to control or uncontrollable

### ASIL Classification
- **ASIL A**: S1+E1-4+C1-3, S2+E1-2+C3
- **ASIL B**: S1+E3-4+C2, S2+E3-4+C2, S2+E1-2+C2  
- **ASIL C**: S1+E4+C3, S2+E3-4+C1, S3+E1+C1-3
- **ASIL D**: S3+E2-4+C1-3, S2+E4+C3, S3+E1+C3

## Software Safety Requirements

### Software Safety Goal Allocation
- **Software Safety Requirements**: Derived from system safety goals with ASIL inheritance
- **Software Safety Functions**: Specific code modules implementing safety mechanisms
- **Software Safety Constraints**: Coding standards, resource limits, timing constraints
- **Verification Methods**: Unit testing, integration testing, static analysis requirements

### Software Architecture Safety Analysis
- **Modular Decomposition**: Safety-critical vs non-safety-critical module separation
- **Freedom from Interference**: Memory protection, execution time isolation, data encapsulation
- **Error Detection and Handling**: Exception handling strategies, error propagation patterns
- **Defensive Programming**: Input validation, assertion checking, graceful degradation
- **Code Diversity**: Multiple implementations for critical functions, N-version programming

## Software Systematic Failure Analysis

### Development Phase Code Failures
- **Requirements Tracing**: Missing requirements implementation, incorrect interpretation
- **Design Flaws**: Architectural violations, inadequate error handling design
- **Implementation Defects**: Coding standard violations, logic errors, type mismatches
- **Integration Issues**: Interface mismatches, dependency conflicts, version incompatibilities
- **Testing Gaps**: Insufficient test coverage, missing edge cases, inadequate fault injection

### Runtime Code Failures
- **Memory Corruption**: Heap corruption, stack smashing, double-free errors
- **Resource Exhaustion**: Memory leaks, file descriptor exhaustion, CPU starvation
- **Timing Violations**: Deadline misses, priority inversion, blocking in critical sections
- **Data Corruption**: Bit flips, checksum failures, serialization errors
- **Configuration Drift**: Runtime parameter changes, environment variable corruption

## Code-Level Fault Detection and Error Handling

### Software Detection Mechanisms
- **Assertions**: Runtime checks for invariants, preconditions, postconditions
- **Input Sanitization**: Parameter validation, type checking, bounds verification
- **Memory Protection**: Stack canaries, guard pages, memory tagging, ASLR
- **Control Flow Integrity**: Return address validation, jump target verification
- **Data Integrity**: Checksums, redundant storage, voting mechanisms
- **Runtime Monitoring**: Exception handlers, signal handlers, watchdog integration

### Software Error Response Patterns
- **Exception Handling**: Structured exception handling, error code propagation
- **Graceful Degradation**: Feature disabling, reduced functionality modes
- **Safe State Transitions**: Reset to known good state, controlled shutdown
- **Logging and Alerting**: Error logging, diagnostic data collection, notification systems
- **Recovery Mechanisms**: Automatic retry, checkpoint/restore, redundant execution

## Code Verification and Validation Framework

### Software Verification Methods (Per ASIL Level)
- **ASIL A**: Code reviews, static analysis, unit testing
- **ASIL B**: Structured code reviews, enhanced static analysis, MC/DC testing
- **ASIL C**: Formal code reviews, formal static analysis, comprehensive testing, some formal verification
- **ASIL D**: Independent code reviews, certified static analysis tools, formal verification, complete testing

### Code Testing and Analysis Strategies
- **Static Code Analysis**: Syntax checking, semantic analysis, data flow analysis, control flow analysis
- **Dynamic Testing**: Unit tests, integration tests, system tests with code coverage analysis
- **Structural Coverage**: Statement coverage, branch coverage, MC/DC coverage per ASIL requirements
- **Boundary Value Testing**: Input range limits, buffer boundaries, numerical limits
- **Fault Injection Testing**: Memory corruption injection, timing fault injection, API failure simulation
- **Concurrency Testing**: Race condition detection, deadlock detection, stress testing under load

## Safety Case Development

### Argument Structure
- **Claims**: Safety properties that must be demonstrated
- **Evidence**: Test results, analysis outputs, review findings
- **Reasoning**: Logical connection between evidence and claims
- **Assumptions**: Dependencies and limitations of the safety argument

### Documentation Requirements
- **Safety Plan**: Management of safety activities throughout lifecycle
- **Safety Case Report**: Comprehensive argument for system safety
- **Configuration Management**: Traceability and change control
- **Assessment Report**: Independent evaluation of safety compliance

## Code Assessment Criteria

### Software Safety Compliance Verification
- ✅ All software safety requirements are implemented and traceable to code
- ✅ Coding standards compliance verified for required ASIL level
- ✅ Software architecture enforces freedom from interference
- ✅ Error detection and handling mechanisms are implemented consistently
- ✅ Verification activities achieve required code coverage metrics per ASIL
- ✅ Static analysis findings are resolved or justified for safety relevance

### Code Quality and Safety Metrics
- **Code Coverage**: Statement/branch/MC/DC coverage percentages per ASIL requirements
- **Cyclomatic Complexity**: Maximum complexity limits enforced per safety criticality
- **Static Analysis Violations**: Count and severity of coding standard violations
- **Memory Safety Score**: Percentage of memory-safe operations vs unsafe operations
- **Error Handling Coverage**: Percentage of error conditions with proper handling
- **Interface Consistency**: API usage compliance and parameter validation coverage

## Code Risk Assessment Matrix

| Code Hazard Category | Severity | Exposure | Controllability | ASIL | Code Safety Measures Required |
|---------------------|----------|----------|----------------|------|------------------------------|
| Logic/Algorithm Error | S1-S3 | E1-E4 | C1-C3 | A-D | Assertions, formal verification, diverse implementation |
| Memory Safety Violation | S2-S3 | E1-E4 | C1-C3 | B-D | Memory protection, static analysis, safe languages |
| Concurrency Bug | S1-S3 | E1-E4 | C2-C3 | A-D | Synchronization primitives, deadlock detection |
| Exception/Error Propagation | S1-S2 | E1-E4 | C1-C3 | A-C | Structured exception handling, error codes |
| Resource Leak | S1-S2 | E2-E4 | C1-C2 | A-B | RAII patterns, automatic resource management |
| Interface Contract Violation | S1-S3 | E1-E4 | C1-C3 | A-D | Parameter validation, contract checking |

## Code Safety Review Reporting Template

For each identified code safety issue:
```
**Issue ID**: [Unique identifier: CSR-YYYY-NNN]
**File/Function**: [Source file path and function/class name]
**Issue Type**: [Logic Error/Memory Safety/Concurrency/Interface/etc.]
**Description**: [Detailed description of code issue and potential failure mode]
**Severity**: [S0-S3 based on potential harm]
**ASIL Impact**: [Derived ASIL level: QM/A/B/C/D]
**Code Location**: [Line numbers, commit hash, branch information]
**Root Cause**: [Implementation error, design flaw, requirements issue]
**Detection Method**: [Static analysis, code review, testing, etc.]
**Mitigation Strategy**: [Specific code changes, patterns, or mechanisms required]
**Verification Plan**: [How fix will be verified - tests, analysis, reviews]
**Coding Standard Ref**: [Reference to violated coding standard rule if applicable]
**Priority**: [Critical/High/Medium/Low based on ASIL and exposure]
```

## Post-Code Review Actions

1. **Code Remediation**: Fix identified safety-critical code issues with proper testing
2. **Static Analysis Integration**: Configure and integrate static analysis tools in CI/CD pipeline
3. **Coding Standards Enforcement**: Implement automated coding standard checking per ASIL
4. **Test Coverage Enhancement**: Achieve required structural coverage metrics for each ASIL level
5. **Code Review Process**: Establish mandatory code review workflows for safety-critical components  
6. **Configuration Management**: Implement version control, change tracking, and release management
7. **Tool Qualification**: Qualify development and verification tools per ISO 26262-8 requirements
8. **Competence Assessment**: Ensure development team has required safety competencies
9. **Documentation Updates**: Update software safety case with code-level evidence
10. **Continuous Integration**: Implement automated safety checks in build and deployment pipelines