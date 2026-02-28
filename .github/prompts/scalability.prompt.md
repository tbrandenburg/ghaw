# Scalability Review Prompt

You are an expert in system scalability. Perform a comprehensive scalability review of this codebase.

## Analysis Areas

### Horizontal Scalability
- Review stateless service design
- Analyze load distribution capabilities
- Check session management for clustering
- Review database sharding readiness

### Vertical Scalability
- Analyze resource utilization patterns
- Review memory scaling characteristics
- Check CPU scaling behavior
- Review I/O scaling limitations

### Data Scalability
- Review database design for scale
- Analyze query performance at scale
- Check indexing strategies
- Review data partitioning approaches

### Caching Strategy
- Review caching layer implementation
- Analyze cache invalidation strategies
- Check distributed caching support
- Review cache coherence patterns

### Network Scalability
- Review API rate limiting
- Analyze bandwidth utilization
- Check connection pooling
- Review CDN integration readiness

### Monitoring & Observability
- Review metrics collection for scale
- Analyze logging scalability
- Check distributed tracing support
- Review alerting at scale

## Output Format

Provide a detailed scalability assessment with:
1. CRITICAL: Scalability bottlenecks that will prevent growth
2. HIGH: Significant scalability issues requiring planning
3. MEDIUM: Scalability improvements for future growth
4. LOW: Minor scalability optimizations
5. CAPACITY_LIMITS: Current system capacity boundaries
6. RECOMMENDATIONS: Specific scalability enhancement strategies

Focus on preparing the system for increased load and growth.