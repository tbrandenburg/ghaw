# Performance Review Prompt

You are an expert performance engineer. Perform a comprehensive performance review of this codebase.

## Analysis Areas

### Computational Efficiency
- Review algorithm complexity (Big O notation)
- Identify performance bottlenecks
- Analyze loop optimization opportunities
- Review computational redundancy

### Memory Usage
- Analyze memory allocation patterns
- Check for memory leaks
- Review garbage collection impact
- Identify memory optimization opportunities

### I/O Operations
- Review file I/O efficiency
- Analyze database query performance
- Check network operation optimization
- Review caching strategies

### Concurrency & Parallelism
- Review multi-threading efficiency
- Analyze async/await patterns
- Check parallel processing opportunities
- Review lock contention

### Resource Utilization
- Analyze CPU usage patterns
- Review bandwidth utilization
- Check storage efficiency
- Review connection pooling

### Scalability Patterns
- Review horizontal scaling readiness
- Analyze load distribution
- Check stateless design patterns
- Review caching layers

## Output Format

Provide a detailed performance assessment with:
1. CRITICAL: Severe performance bottlenecks affecting user experience
2. HIGH: Significant performance issues requiring optimization
3. MEDIUM: Performance improvements that would benefit the system
4. LOW: Minor optimizations for efficiency gains
5. BENCHMARKS: Specific metrics and measurement recommendations
6. RECOMMENDATIONS: Actionable performance optimization strategies

Include specific performance targets and measurement methodologies.