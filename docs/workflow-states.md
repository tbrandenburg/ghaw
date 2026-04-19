# Issue Workflow States & Scrum Integration

This document defines the issue workflow states, ownership responsibilities, and integration with Scrum ceremonies for the GitHub Actions Workflow (GHAW) project.

## 📋 Issue State Management Table

| State | Issue Owner | State Change Triggered By | Event/Ceremony | Description |
|-------|-------------|---------------------------|-----------------|-------------|
| **`open`** | Product Owner | Product Owner, Team Members, Stakeholders | • Product Backlog Refinement<br>• Sprint Planning<br>• Daily Scrum<br>• Sprint Review<br>• Sprint Retrospective<br>• Bug Reports<br>• Feature Requests | New or unrefined work. Collaborative grooming allowed. |
| **`ready`** | Product Owner | Product Owner | • Product Backlog Refinement<br>• Pre-Sprint Planning<br>• Ad-hoc Grooming Sessions | Definition of Ready met. Pullable backlog (PO gate). |
| **`in-progress`** | Development Team Member | Development Team Member (self-assigned) | • Sprint Planning<br>• Daily Scrum<br>• During Sprint (pull-based) | Work pulled by team; implementation underway. |
| **`reviewed`** | Development Team | Development Team | • Code Review completion<br>• CI/CD Pipeline success<br>• Definition of Done verification | PR approved + CI green. Ready to merge to main. |
| **`closed`** | GitHub/System | GitHub (automatic) | • PR Merge (after PO approval)<br>• Sprint Review (acceptance)<br>• Manual closure (if needed) | PR merged to main. Code complete. Task lifecycle ends. |
| **`released`** | Release Manager/DevOps | Release Manager/DevOps Team | • Production Deployment<br>• Release Activities<br>• Post-Sprint Release | **OPTIONAL metadata:** included in a production release. NOT a task state. |

## 🔄 Workflow Progression

### Linear Workflow Path
```
open → ready → in-progress → reviewed → closed
```

### Optional Metadata
```
closed → released (tracking only)
```

## 🎯 Detailed State Descriptions

### 1. **`open`** - Initial State
- **Purpose**: Capture new work items that need refinement
- **Owner**: Product Owner (with collaborative input)
- **Entry Criteria**: Issue created, basic description provided
- **Exit Criteria**: Requirements clarified, acceptance criteria defined, ready for estimation

**Scrum Activities:**
- **Product Backlog Refinement**: Primary ceremony for moving `open` → `ready`
- **Sprint Planning**: Team may identify new `open` items during planning
- **Daily Scrum**: Impediments or new tasks discovered
- **Sprint Review**: Stakeholder feedback creates new `open` items
- **Sprint Retrospective**: Process improvements become `open` items

### 2. **`ready`** - Definition of Ready Met
- **Purpose**: Backlog items that meet Definition of Ready criteria
- **Owner**: Product Owner (gatekeeper)
- **Entry Criteria**: All DoR criteria satisfied
- **Exit Criteria**: Developer commits to work during sprint

**Definition of Ready Checklist:**
- [ ] Clear acceptance criteria defined
- [ ] Dependencies identified and resolved
- [ ] Estimated by development team
- [ ] Fits within sprint capacity
- [ ] Testable and demonstrable

### 3. **`in-progress`** - Active Development
- **Purpose**: Work currently being implemented
- **Owner**: Assigned Development Team Member
- **Entry Criteria**: Developer pulls work from `ready` backlog
- **Exit Criteria**: Code complete, tests passing, ready for peer review

**Activities During This State:**
- Implementation and coding
- Unit test creation
- Integration with existing codebase
- Daily Scrum updates on progress

### 4. **`reviewed`** - Team Verification Complete
- **Purpose**: Work verified by team, awaiting PO approval for merge
- **Owner**: Development Team (collective responsibility)
- **Entry Criteria**: Code review approved, CI/CD pipeline green
- **Exit Criteria**: Product Owner approves PR for merge

**Definition of Done Verification:**
- [ ] Code review completed by peer(s)
- [ ] All automated tests passing
- [ ] Code quality standards met
- [ ] Documentation updated
- [ ] Security checks passed
- [ ] Ready for production deployment

### 5. **`closed`** - Work Complete
- **Purpose**: Work delivered and accepted
- **Owner**: GitHub/System (automatic)
- **Entry Criteria**: PR merged to main branch
- **Exit Criteria**: N/A (terminal state)

**Closure Process:**
1. Team marks issue as `reviewed`
2. Product Owner reviews and approves PR using GitHub's native review system
3. Team merges PR
4. GitHub automatically closes linked issue
5. Work is complete and delivered

### 6. **`released`** - Production Deployment (Optional)
- **Purpose**: Track which work has been deployed to production
- **Owner**: Release Manager/DevOps Team
- **Entry Criteria**: Code deployed to production environment
- **Exit Criteria**: N/A (metadata only)

**Note**: This is **NOT a workflow state** but optional metadata for release tracking.

## 🔑 Ownership & Authority Patterns

### **Product Owner Authority**
- **Strategic Control**: Manages `open` → `ready` progression
- **Quality Gate**: Must approve PRs before merge to `closed`
- **Backlog Management**: Decides what gets refined and when
- **Stakeholder Interface**: Translates business needs into technical requirements

### **Development Team Authority**
- **Technical Control**: Manages `ready` → `in-progress` → `reviewed`
- **Self-Organization**: Team members pull work when ready
- **Quality Standards**: Controls when work meets Definition of Done
- **Implementation Decisions**: How to implement requirements

### **System/Process Authority**
- **Automation**: GitHub handles `reviewed` → `closed` transition
- **Release Tracking**: DevOps manages `released` metadata
- **Audit Trail**: System maintains history of all state changes

## 🎪 Scrum Ceremony Integration

### **Sprint Planning**
- **Input**: `ready` items from Product Backlog
- **Output**: Sprint Backlog with `ready` → `in-progress` commitments
- **State Changes**: Team members assign themselves to `ready` items

### **Daily Scrum**
- **Focus**: Progress on `in-progress` items
- **State Changes**: Items may move `in-progress` → `reviewed`
- **Impediments**: May create new `open` items

### **Sprint Review**
- **Focus**: Demonstrate `closed` items from sprint
- **State Changes**: Stakeholder feedback may create new `open` items
- **Acceptance**: PO confirms delivered value

### **Sprint Retrospective**
- **Focus**: Process improvements
- **State Changes**: Action items become new `open` issues
- **Workflow**: May refine this state management process

### **Product Backlog Refinement**
- **Primary Activity**: `open` → `ready` progression
- **Collaborative**: Team and PO work together
- **Ongoing**: Continuous refinement throughout sprint

## 🚀 Best Practices

### **State Transition Guidelines**
1. **Don't skip states**: Follow the linear progression
2. **Clear ownership**: Each state has a clear owner
3. **Document reasons**: Add comments when changing states
4. **Regular reviews**: Monitor items stuck in states

### **Team Protocols**
- **Pull-based**: Team pulls `ready` work, doesn't get assigned
- **Peer review**: All code must be reviewed before `reviewed` state
- **PO approval**: All PRs need PO approval before merge
- **Clear communication**: State changes should be visible to team

### **Automation Opportunities**
- **CI/CD Integration**: Automatically move to `reviewed` when CI passes
- **PR Linking**: Ensure issues are linked to PRs for auto-closure
- **Notification**: Alert team when items change states
- **Metrics**: Track cycle time through workflow states

## 📊 Workflow Metrics

Track these metrics to improve team performance:

- **Lead Time**: `open` → `closed`
- **Cycle Time**: `ready` → `closed`
- **Review Time**: `in-progress` → `reviewed`
- **Approval Time**: `reviewed` → `closed`
- **Work In Progress**: Count of `in-progress` items

## 🔧 Setup & Configuration

Use the `Makefile.ghprj` to set up these workflow labels in your repository:

```bash
# Default setup (no prefix)
make -f Makefile.ghprj setup

# With namespace prefix
make -f Makefile.ghprj setup WORKFLOW_PREFIX=workflow

# Interactive mode
make -f Makefile.ghprj setup INTERACTIVE=true
```

For more details on label setup, see the `Makefile.ghprj` file in the project root.