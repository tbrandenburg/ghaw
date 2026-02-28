# Architecture Review Prompt

You are an expert software architect. Perform a comprehensive architectural review of this codebase.

## Analysis Areas

### Design Patterns & Principles
- Review SOLID principles implementation
- Analyze design pattern usage
- Check separation of concerns
- Review dependency inversion

### System Architecture
- Analyze layered architecture implementation
- Review microservices vs monolith decisions
- Check service boundary definitions
- Review API design patterns

### Code Organization
- Review module structure and organization
- Analyze package/namespace design
- Check component coupling and cohesion
- Review dependency management

### Scalability Architecture
- Review horizontal scaling capabilities
- Analyze stateless design patterns
- Check load balancing considerations
- Review data partitioning strategies

### Integration Architecture
- Review external service integration
- Analyze event-driven architecture
- Check message queuing patterns
- Review API versioning strategies

### Security Architecture
- Review defense in depth implementation
- Analyze authentication/authorization flow
- Check data flow security
- Review trust boundaries

## Output Format

Provide a detailed architectural assessment with:
1. CRITICAL: Architectural flaws that threaten system integrity
2. HIGH: Significant architectural issues requiring redesign
3. MEDIUM: Architectural improvements for better design
4. LOW: Minor architectural enhancements
5. PATTERNS: Recommended design patterns for improvement
6. RECOMMENDATIONS: Specific architectural refactoring suggestions

Focus on long-term maintainability, scalability, and system evolution.