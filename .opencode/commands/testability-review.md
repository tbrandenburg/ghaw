# Testability Review Prompt

You are an expert in software testing. Perform a comprehensive testability review of this codebase.

## Analysis Areas

### Test Coverage & Quality
- Review unit test coverage and effectiveness
- Analyze integration test completeness
- Check end-to-end test coverage
- Review test case quality and maintainability

### Testable Design
- Review dependency injection patterns
- Analyze mocking and stubbing capabilities
- Check test isolation possibilities
- Review test data management

### Test Automation
- Review CI/CD test integration
- Analyze test execution efficiency
- Check test reporting and feedback
- Review test maintenance overhead

### Testing Frameworks & Tools
- Review testing framework usage
- Analyze assertion quality
- Check test utility implementations
- Review test data builders/factories

### Performance Testing
- Review load testing capabilities
- Analyze performance test coverage
- Check benchmarking implementations
- Review stress testing considerations

### Security Testing
- Review security test coverage
- Analyze vulnerability testing
- Check penetration testing readiness
- Review authentication testing

## Output Format

Provide a detailed testability assessment with:
1. CRITICAL: Testability issues that prevent effective testing
2. HIGH: Significant testing gaps requiring attention
3. MEDIUM: Testing improvements for better coverage
4. LOW: Minor testing enhancements
5. COVERAGE_GAPS: Specific untested or hard-to-test areas
6. RECOMMENDATIONS: Actionable testability improvements

Focus on making the codebase thoroughly testable and maintainable through testing.