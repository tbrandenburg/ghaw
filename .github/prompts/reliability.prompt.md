# Reliability Review Prompt

You are an expert in system reliability engineering. Perform a comprehensive reliability review of this codebase.

## Analysis Areas

### Error Handling & Recovery
- Review exception handling completeness
- Analyze error propagation patterns
- Check graceful degradation mechanisms
- Review retry and circuit breaker patterns

### Fault Tolerance
- Review system resilience to failures
- Analyze redundancy implementations
- Check failover mechanisms
- Review backup and recovery procedures

### Data Integrity & Consistency
- Review transaction handling
- Analyze data validation rules
- Check consistency maintenance
- Review conflict resolution strategies

### Monitoring & Observability
- Review logging comprehensiveness
- Analyze metrics collection
- Check alerting mechanisms
- Review health check implementations

### Resource Management
- Review connection pooling reliability
- Analyze resource cleanup patterns
- Check leak prevention mechanisms
- Review timeout handling

### System Dependencies
- Review external service reliability
- Analyze dependency failure handling
- Check service mesh reliability
- Review third-party integration robustness

## Output Format

Provide a detailed reliability assessment with:
1. CRITICAL: Reliability issues that could cause system failure
2. HIGH: Significant reliability risks requiring mitigation
3. MEDIUM: Reliability improvements for better uptime
4. LOW: Minor reliability enhancements
5. FAILURE_MODES: Potential system failure scenarios
6. RECOMMENDATIONS: Specific reliability improvement strategies

Focus on ensuring consistent, dependable system operation under various conditions.