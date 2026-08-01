
# Salesforce Developer Internship - Day 3 Assignment

## 📌 Project Title
Job Application Management System using Salesforce Flow Automation

---

# 📖 README

## Project Overview

This project demonstrates Salesforce declarative automation by building a Job Application Management System. The application allows students to apply for jobs, automatically fills the application date, sends confirmation emails, and creates offer letters for selected candidates using Record-Triggered Flows.

---

## Objectives

- Create custom objects and relationships.
- Implement Validation Rules.
- Build Before-Save and After-Save Record-Triggered Flows.
- Configure Email Alerts.
- Automate Offer Letter creation.
- Learn Salesforce Flow Builder and automation.

---

## Custom Objects Created

- Student
- Job
- Application
- Offer Letter

---

## Relationships

- Application → Student (Lookup)
- Application → Job (Lookup)
- Offer Letter → Student (Lookup)
- Offer Letter → Job (Lookup)

---

## Validation Rules

- Application Date cannot be greater than the Job Closing Date.
- Remarks are mandatory when the Application Status is Rejected.

---

## Flows Implemented

### Flow 1 – Auto Fill Application Date

- Type: Record-Triggered Flow
- Trigger: Record Created
- Optimization: Before Save (Fast Field Updates)

**Functionality**

Automatically populates the Application Date whenever a new Application record is created.

---

### Flow 2 – Application Confirmation Email

- Type: Record-Triggered Flow
- Trigger: Record Created
- Optimization: After Save (Actions and Related Records)

**Functionality**

Automatically sends a confirmation email after a new Application record is created.

---

### Flow 3 – Offer Letter Automation

- Type: Record-Triggered Flow
- Trigger: Record Updated
- Condition: Status = Selected

**Functionality**

Automatically creates an Offer Letter record when an application's status changes to Selected.

---

## Technologies Used

- Salesforce Developer Edition
- Flow Builder
- Object Manager
- Validation Rules
- Email Alerts
- Lightning Experience

---

# 📷 Screenshots

Include the following screenshots in the repository:

- Student Object
- Job Object
- Application Object
- Offer Letter Object
- Flow 1 – Auto Fill Application Date
- Flow 2 – Application Confirmation Email
- Flow 3 – Offer Letter Automation
- Email Alert Configuration
- Validation Rules
- Successful Flow Execution
- Offer Letter Record Created

---

# 📚 Learning Notes

During this assignment, I learned:

- Creating Custom Objects and Fields
- Establishing Lookup Relationships
- Creating Validation Rules
- Difference between Before-Save and After-Save Flows
- Working with Assignment Elements
- Using Create Records Element
- Configuring Email Alerts
- Creating and Activating Record-Triggered Flows
- Testing and Debugging Flows
- Automating business processes using Salesforce Flow Builder

---

# ⚠️ Challenges

During implementation, I faced the following challenges:

- Errors while configuring Record-Triggered Flows.
- Issues selecting the correct Record ID in Email Alert actions.
- Mapping Lookup fields while creating Offer Letter records.
- Debugging Flow activation and execution.
- Understanding the difference between Before-Save and After-Save Flows.

These issues were resolved by verifying field mappings, correcting flow configurations, and testing the automation using sample records.

---

# 💭 Reflection

This assignment helped me understand how Salesforce automates business processes without writing Apex code.

I gained hands-on experience in:

- Designing custom objects
- Building declarative automation using Flow Builder
- Configuring Email Alerts
- Creating business validations
- Automating record creation
- Testing and debugging flows

This project improved my understanding of Salesforce automation concepts and strengthened my confidence in building real-world business solutions using Record-Triggered Flows.

---


