# default path for exec resources:
environment({'PATH' => "/usr/bin:/usr/sbin:/bin:sbin"})

##########################################################################
# CNSS-SCC
##########################################################################

###################################
# Access Control

# AC-1: Access Control Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-2: Account Management
# Chef Actions:

# AC-2(1)
# Chef Actions: PROCEDURAL REQUIREMENT

# AC-2(2)
# Chef Actions: PROCEDURAL REQUIREMENT - Sysadmin must create temp accounts correctly

# AC-2(3)
# Chef Actions: PROCEDURAL REQUIREMENT

# AC-2(4)
# Chef Actions: PROCEDURAL REQUIREMENT

# AC-2(5)
# Chef Actions: PROCEDURAL REQUIREMENT

# AC-3: Access Enforcement
# Chef Actions:
include_recipe "AC-3"

# AC-3(1)
# Chef Actions:

# AC-3(2)
# Chef Actions: No actions required

# AC-3(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AC-3(4)
# Chef Actions: (Not required)

# AC-4: Information Flow Enforcement
# Chef Actions:

# AC-4(2)
# Chef Actions: None Requiered - Needs Installer Review (site specific policy)

# AC-5: Separation of Duties
# Chef Actions: None Required - PROCEDURAL REQUIREMENT

# AC-6: Least Privilege
# Chef Actions:

# AC-6(1)
# Chef Actions: PROCEDURAL REQUIREMENT

# AC-7: Unsuccessful Login Attempts
# Chef Actions:
include_recipe "AC-7"

# AC-7(1)
# Chef Actions:
# 3 login attempts in 30 seconds; lock out for 1 minute
ac-7::p1 { "login_attempts" :
    failed_attempts => "3",
    deny_interval => "30",
    lockout_time => "60"
}

# AC-8: System Use Notification
# Chef Actions:
include_recipe "AC-8"


# AC-9: Previous Logon Notification
# Chef Actions: None Required

# AC-10: Concurrent Session Control
# Chef Actions: FIXME: Needs further attention - limit concurrent sessions to 3

# AC-11: Session Lock
# Chef Actions:
include_recipe "AC-11"

# AC-11(1)
# Chef Actions:

# AC-12: Session Termination
# Chef Actions:

# AC-12(1)
# Chef Actions:

# Implemented in AC-11(1)

# AC-12(2)
# Chef Actions:

# Implemented in AC-11(1)

# AC-13: Supervision and Review—Access Control
# Chef Actions:

# AC-13(1)
# Chef Actions: None Required - Needs Installer Review

# AC-14: Permitted Actions without Identification or Authentication
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-14(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-15: Automated Marking
# Chef Actions:
include_recipe "AC-15"


# AC-15(1)
# See AC-15

# AC-16: Automated Labeling
# Chef Actions: None

# AC-17: Remote Access
# Chef Actions:
include_recipe "AC-17"

# AC-17(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-17(2)
# Chef Actions:

# AC-17(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-17(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-17(5)
# Chef Actions:

# AC-17(6)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-17(7)
# Chef Actions:

# AC-18: Wireless Access Restrictions
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-18(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-18(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-18(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-18(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-18(5)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-19: Access Control for Portable and Mobile Devices
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-19(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-20: Use of External Information Systems
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-20(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-21: Confidentiality of Data at Rest
# Chef Actions:

# FIXME: Point out full disk encryption available.
# This is only when desired by information owner.
# Not required for all cases.

# AC-22: Distinct Level of Access
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AC-23: User Based Collaboration and Information Sharing Control
# Chef Actions: None - PROCEDURAL REQUIREMENT

###################################
# Awareness and Training

# AT-1: Security Awareness and Training Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AT-2: Security Awareness
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AT-3: Security Training
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AT-4: Security Training Records
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AT-5: Contacts with Security Groups and Associations
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AT-6: Certifier Training by Developers
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Audit and Accountability 

# AU-1: Audit and Accountability Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-1(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-2: Auditable Events
# Chef Actions: None Required - Installer responsible for ensuring organization defined audits happen
include_recipe "AU-2"

# AU-2(1)
# Chef Actions:

# AU-2(2)
# Chef Actions: None Required (see auditd conf files)

# AU-2(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-2(4)
# Chef Actions:

# implemented in AU-2(1)

# AU-2(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT - capability present in RHEL5.3 audit subsystem

# AU-2(6)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-2(7)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-2(8)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-2(9)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-2(10)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-3: Content of Audit Records
# Chef Actions:

# AU-3(1)
# Chef Actions: No Actions Required

# AU-3(2)
# Chef Actions: No Actions Required

# AU-3(3)
# Chef Actions: No Actions Required

# AU-3(4)
# Chef Actions:

# Implemented in AU-2(1)

# AU-3(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-4: Audit Storage Capacity
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-5: Response to Audit Processing Failures
# Chef Actions:

# AU-5(1)
# Chef Actions:

# Implemented in AU-2(1)

# AU-5(2)
# Chef Actions: PROCEDURAL - Org defined audit failure events required to perform  real time alert.

# AU-5(3)
# Chef Actions:

# Implemented in AU-2(1)

# AU-6: Audit Monitoring, Analysis, and Reporting
# Chef Actions:

# AU-6(1)
# Chef Actions: No Actions Required

# AU-6(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-6(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-6(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-6(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-7: Audit Reduction and Report Generation
# Chef Actions:

# AU-7(1)
# Chef Actions: None - Site should decide on and install tool

# AU-7(2)
# Chef Actions: None - Site should decide on and install tool

# AU-8: Time Stamps
# Chef Actions:

# AU-8(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-8(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-9: Protection of Audit Information
# Chef Actions:

# implemented in AU-2(1)

# AU-9(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-9(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-10: Non-repudiation
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-10(1)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-10(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-10(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-10(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-11: Audit Record Retention
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-11(1)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-11(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# AU-11(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-11(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-12: Session Audit
# Chef Actions: Has legal ramifications - implement with legal guidance

# AU-12(1)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# AU-12(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT


###################################
# Certification, Accreditation, and Security Assessments

# CA-1: Certification, Accreditation, and Security Assessment Policies and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CA-2: Security Assessments
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CA-3: Information System Connections
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CA-4: Security Certification
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CA-4(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CA-4(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# CA-4(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CA-5: Plan of Action and Milestones
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CA-6: Security Accreditation
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CA-7: Continuous Monitoring
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CA-7(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CA-7(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Configuration Management

# CM-1: Configuration Management Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-2: Baseline Configuration
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-2(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-2(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-2(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# CM-2(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# CM-3: Configuration Change Control
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-3(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-3(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-3(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-4: Monitoring Configuration Changes
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-5: Access Restrictions for Change
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-5(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-5(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# CM-5(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-5(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-6: Configuration Settings
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-6(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-6(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-7: Least Functionality
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-7(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-7(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-8: Information System Component Inventory
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-8(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CM-8(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Contingency Planning

# CP-1: Contingency Planning Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-1(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-2: Contingency Plan
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-2(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-2(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-2(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-2(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# CP-2(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# CP-2(6)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-2(7)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# CP-3: Contingency Training
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-3(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-3(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-4: Contingency Plan Testing and Exercises
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-4(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-4(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-4(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-4(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-5: Contingency Plan Update
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-6: Alternate Storage Site
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-6(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-6(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-6(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-6(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-6(5)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-6(6)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# CP-7: Alternate Processing Site
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-7(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-7(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-7(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-7(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-7(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# CP-7(6)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-8: Telecommunications Services
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-8(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-8(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-8(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-8(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-9: Information System Backup
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-9(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-9(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-9(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-9(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-10: Information System Recovery and Reconstitution Identification and Authentication
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-10(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-10(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# CP-10(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Identification and Authentication

# IA-1: Identification and Authentication Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IA-2: User Identification and Authentication
# Chef Actions:
include_recipe "IA-2"

# IA-2(1)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# IA-2(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# IA-2(3)
# Chef Actions: None - Site specific (Site needs to set up 2 factor system)

# IA-2(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# IA-2(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# IA-2(6)
# Chef Actions: None - Site specific (Site needs to set up 2 factor system)

# IA-2(7)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# IA-2(8)
# Chef Actions: None - (No default use of certificates)

# IA-2(9)
# Chef Actions: None - (No default use of group authenticators)

# IA-3: Device Identification and Authentication
# Chef Actions: None - Site Specific

# IA-3(1)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# IA-3(2)
# Chef Actions: None - Site Specific

# IA-4: Identifier Management
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IA-4(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IA-4(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IA-4(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IA-4(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IA-5: Authenticator Management
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IA-5(1)
# Chef Actions:

# Implemented in AC-7(1)
# Implemented in AC-11(1)
# Implemented in AC-17(7)
# Implemented in IA-2

# IA-5(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IA-5(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IA-5(4)
# Chef Actions: None if not using PKI

# IA-5(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# IA-6: Authenticator Feedback
# Chef Actions: None Required

# IA-7: Cryptographic Module Authentication
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Incident Response

# IR-1: Incident Response Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-1(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-2: Incident Response Training
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-2(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-2(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-3: Incident Response Testing and Exercises
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-3(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-3(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-4: Incident Handling
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-4(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-5: Incident Monitoring
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-5(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-6: Incident Reporting
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-6(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-7: Incident Response Assistance
# Chef Actions: None - PROCEDURAL REQUIREMENT

# IR-7(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Maintenance

# MA-1: System Maintenance Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-2: Controlled Maintenance
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-2(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-2(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-3: Maintenance Tools
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-3(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-3(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-3(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-3(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-4: Remote Maintenance
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-4(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-4(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-4(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-4(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# MA-4(5)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-4(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# MA-5: Maintenance Personnel
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-5(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-5(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-5(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-5(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-5(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# MA-6: Timely Maintenance
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-6(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MA-6(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Media Protection

# MP-1: Media Protection Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-2: Media Access
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-2(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-3: Media Labeling
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-3(1)
# See AC-15

# MP-4: Media Storage
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-4(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-4(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-5: Media Transport
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-5(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-5(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-5(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-5(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# MP-6: Media Sanitization and Disposal
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-6(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-6(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-6(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# MP-6(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Physical and Environmental Protection

# PE-1: Physical and Environmental Protection Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-2: Physical Access Authorizations
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-2(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-2(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-3: Physical Access Control
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-3(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-3(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-3(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# PE-3(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# PE-4: Access Control for Transmission Medium
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-5: Access Control for Display Medium
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-6: Monitoring Physical Access
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-6(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-6(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-7: Visitor Control
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-7(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-7(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# PE-8: Access Records
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-8(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-8(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# PE-9: Power Equipment and Power Cabling
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-9(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-9(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-10: Emergency Shutoff
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-10(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-11: Emergency Power
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-11(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-11(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# PE-12: Emergency Lighting
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-12(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-13: Fire Protection
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-13(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-13(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-13(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-13(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-14: Temperature and Humidity Controls
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-14(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-15: Water Damage Protection
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-15(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-16: Delivery and Removal
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-17: Alternate Work Site
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-18: Location of Information System Components
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-18(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-19: Information Leakage Planning
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-19(1)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# PE-20: Physical Security
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-20(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-20(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-20(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PE-21: Environmental Control Training
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Planning

# PL-1: Security Planning Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PL-2: System Security Plan
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PL-2(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PL-2(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PL-2(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# PL-3: System Security Plan Update
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PL-4: Rules of Behavior
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PL-5: Privacy Impact Assessment
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PL-6: Security-Related Activity Planning
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Personnel Security

# PS-1: Personnel Security Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-2: Position Categorization
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-3: Personnel Screening
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-2(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-2(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-4: Personnel Termination
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-5: Personnel Transfer
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-6: Access Agreements
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-6(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-6(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-7: Third-Party Personnel Security
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-7(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# PS-8: Personnel Sanctions
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# Risk Assessment

# RA-1: Risk Assessment Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# RA-2: Security Categorization
# Chef Actions: None - PROCEDURAL REQUIREMENT

# RA-3: Risk Assessment
# Chef Actions: None - PROCEDURAL REQUIREMENT

# RA-4: Risk Assessment Update
# Chef Actions: None - PROCEDURAL REQUIREMENT

# RA-5: Vulnerability Scanning
# Chef Actions: None - PROCEDURAL REQUIREMENT

# RA-5(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# RA-5(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# RA-5(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# RA-5(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# RA-5(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT


###################################
# System and Services Acquisition

# SA-1: System and Services Acquisition Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-2: Allocation of Resources
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-3: Life Cycle Support
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-4: Acquisitions
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-4(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-4(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-4(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-4(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-4(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-4(6)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-4(7)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-4(8)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-5: Information System Documentation
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-5(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-5(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-5(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-5(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-5(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-5(6)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-5(7)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-6: Software Usage Restrictions
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-6(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-6(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-7: User Installed Software
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-8: Security Engineering Principles
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-9: External Information System Services
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-9(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-10: Developer Configuration Management
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-10(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-11: Developer Security Testing
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-11(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-11(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-11(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-12: Special Acquisitions - Supply Chain Risk and Defense in Breadth
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SA-11(1)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-11(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-11(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-11(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SA-11(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT


###################################
# System and Communications Protection

# SC-1: System and Communications Protection Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-1(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-2: Application Partitioning
# Chef Actions:

# SC-3: Security Function Isolation
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-3(1)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SC-3(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SC-3(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SC-3(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SC-3(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SC-4: Information Remnance
# Chef Actions: FIXME: Verify none required (Might require zero-filling memory pages before handing to user)

# SC-5: Denial of Service Protection
# Chef Actions: None - PROCEDURAL REQUIREMENT
include_recipe "SC-5"

# SC-5(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-5(2)
# Chef Actions:

# SC-5(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-6: Resource Priority
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-7: Boundary Protection
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-7(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-7(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-7(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-7(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-7(5)
# Chef Actions:

# Implemented in AC-17(5)

# SC-7(6)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-7(7)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-7(8)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-7(9)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-8: Transmission Integrity
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-8(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-8(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-9: Transmission Confidentiality
# Chef Actions:

# Implemented in AC-17(2) / AC-17(5)

# SC-9(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-9(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-9(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-9(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-9(5)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-10: Network Disconnect
# Chef Actions: None Required

# SC-11: Trusted Path
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-12: Cryptographic Key Establishment and Management
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-12(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-12(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-12(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-12(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SC-13: Use of Cryptography
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-14: Public Access Protections
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-15: Collaborative Computing
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-15(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-15(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-15(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-16: Transmission of Security Parameters
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-16(1)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SC-16(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SC-17: Public Key Infrastructure Certificates
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-18: Mobile Code
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-18(1)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SC-18(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SC-19: Voice Over Internet Protocol
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-20: Secure Name /Address Resolution Service (Authoritative Source)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-20(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-21: Secure Name /Address Resolution Service (Recursive or Caching Resolver)
# Chef Actions:

# SC-21(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-22: Architecture and Provisioning for Name/Address Resolution Service
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SC-23: Session Authenticity
# Chef Actions: None - PROCEDURAL REQUIREMENT


###################################
# System and Information Integrity

# SI-1: System and Information Integrity Policy and Procedures
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-2: Flaw Remediation
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-2(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-2(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-2(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-3: Malicious Code Protection
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-3(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-3(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-3(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-3(4)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-3(5)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-3(6)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-3(7)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-3(8)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-4: Information System Monitoring Tools and Techniques
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-4(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-4(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-4(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-4(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-4(5)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-4(6)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-4(7)
# Chef Actions: None - Depends on installed tools

# SI-4(8)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-5: Security Alerts and Advisories
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-5(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-6: Security Functionality Verification
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-6(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-6(2)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-7: Software and Information Integrity
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-7(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-7(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-7(3)
# Chef Actions: NOT REQUIRED BY NSS DOCUMENT

# SI-8: Spam Protection
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-8(1)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-8(2)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-8(3)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-8(4)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-8(5)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-8(6)
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-9: Information Input Restrictions
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-10: Information Accuracy, Completeness, Validity, and Authenticity
# Chef Actions: None Required

# SI-11: Error Handling
# Chef Actions: None - PROCEDURAL REQUIREMENT

# SI-12: Information Output Handling and Retention
# Chef Actions: None - PROCEDURAL REQUIREMENT

##########################################################################
# UNIX STIG v5r1
##########################################################################

## (GEN000020: CAT II) (Previously - G001) The IAO and SA will ensure, if
## configurable, the UNIX host is configured to require a password for access
## to single-user and maintenance modes.
include_recipe "GEN000020"
include gen000020

## (GEN000440: CAT II) (Previously - G012) The SA will ensure all logon attempts (both
## successful and unsuccessful) are logged to a system log file.
include_recipe "GEN000440"

## (GEN000920: CAT II) The root root home directory will have permissions of 
## 700 or less permissive

include_recipe "GEN000920"

## (GEN000980: CAT II) (Previously - G026) The SA will ensure root can only log
## on as root from the system console, and then only when necessary to perform
## system maintenance.
include_recipe "GEN000980"

## (GEN001080: CAT III) (Previously - G229) The SA will ensure the root shell
## is not located in /usr if /usr is partitioned.
include_recipe "GEN001080"

## (GEN001280: CAT III) (Previously - G042) The SA will ensure all manual page
## files (i.e.,files in the man and cat directories) have permissions of 644,
## or more restrictive.
include_recipe "GEN001280"

## (GEN001460: CAT IV) (Previously - G052) The SA will ensure all home
## directories defined in the /etc/passwd file exist.
include_recipe "GEN001460"

## (GEN001560: CAT II) (Previously - G068) The user, application developers,
## and the SA will ensure user files and directories will have an initial
## permission no more permissive than 700, and never more permissive than 750.
include_recipe "GEN001560"

## (GEN001580: CAT II) (Previously - G058) The SA will ensure run control
## scripts have permissions of 755, or more restrictive.
include_recipe "GEN001580"

## (GEN001620: CAT II) (Previously - G061) The SA will ensure run control
## scripts files do not have the suid or sgid bit set.
# implemented in GEN001580

## (GEN001660: CAT II) (Previously - G611) The SA will ensure the owner of run
## control scripts is root.
# implemented in GEN001580

## (GEN001680: CAT II) (Previously - G612) The SA will ensure the group owner
## of run control scripts is root, sys, bin, other, or the system default.
# implemented in GEN001580

## (GEN001720: CAT II) The SA will ensure global initialization files have
## permissions of 644, or more restrictive.
## (GEN001740: CAT II) The SA will ensure the owner of global initialization
## files is root.
## (GEN001760: CAT II) The SA will ensure the group owner of global
## initialization files is root, sys, bin, other, or the system default.
## (GEN001780: CAT III) (Previously ??? G112) The SA will ensure global
## initialization files contain the command mesg ???n.
include_recipe "GEN0017x0"

## (GEN001800: CAT II) (Previously - G038) The SA will ensure all
## default/skeleton dot files have permissions of 644, or more restrictive.
include_recipe "GEN001800"

## (GEN001820: CAT II) The SA will ensure the owner of all default/skeleton
## dot files is root or bin.
include_recipe "GEN001820"

## (GEN002040: CAT I) The SA will ensure .rhosts, .shosts, hosts.equiv, nor
## shosts.equiv are used, unless justified and documented with the IAO.
include_recipe "GEN002040"

## (GEN002120: CAT II) (Previously ??? G069) The SA will ensure the /etc/shells
## (or equivalent) file exits.
include_recipe "GEN002120"

## (GEN002160: CAT I) (Previously ??? G072) The SA will ensure no shell has the
## suid bit set.
# implemented in GEN002120

## (GEN002180: CAT II) (Previously ??? G073) The SA will ensure no shell has the
## sgid bit set.
# implemented in GEN002120

## (GEN002200: CAT II) (Previously ??? G074) The SA will ensure the owner of all
## shells is root or bin.
# implemented in GEN002120

## (GEN002220: CAT II) (Previously ??? G075) The SA will ensure all shells
## (excluding /dev/null and sdshell) have permissions of 755, or more
## restrictive.
# implemented in GEN002120

## (GEN002320: CAT II) (Previously - G501) The SA will ensure the audio devices
## have permissions of 644, or more restrictive.
include_recipe "GEN002320"

## (GEN002340: CAT II) (Previously - G502) The SA will ensure the owner of
## audio devices is root.
# implemented in GEN002320

## (GEN002360: CAT II) (Previously - G504) The SA will ensure the group owner
## of audio devices is root, sys, or bin.
# implemented in GEN002320

## (GEN002560: CAT II) (Previously - G089) The SA will ensure the system and
## user umask is 077.
include_recipe "GEN002560"

## (GEN002640: CAT II) (Previously - G092) The SA will ensure logon capability
## to default system accounts (e.g., bin, lib, uucp, news, sys, guest, daemon,
## and any default account not normally logged onto) will be disabled by
## making the default shell /bin/false, /usr/bin/false, /sbin/false,
## /sbin/nologin, or /dev/null, and by locking the password.
include_recipe "GEN002640"

## (GEN002860: CAT II) (Previously - G674) The SA and/or IAO will ensure old
## audit logs are closed and new audit logs are started daily.
include_recipe "GEN002860"

## (GEN003040: CAT II) The SA will ensure the owner of crontabs is root or the
## crontab creator.
include_recipe "GEN003040"

## (GEN003060: CAT II) The SA will ensure default system accounts (with the
## possible exception of root) will not be listed in the cron.allow file. If
## there is only a cron.deny file, the default accounts (with the possible
## exception of root) will be listed there.
# implemented in AC-3

## (GEN003080: CAT II) (Previously - G205) The SA will ensure crontabs have
## permissions of 600, or more restrictive, (700 for some Linux crontabs, which
## is detailed in the UNIX Checklist).
# implemented in GEN003040

## (GEN003100: CAT II) (Previously - G206) The SA will ensure cron and crontab
## directories have permissions of 755, or more restrictive.
# implemented in GEN003040

## (GEN003120: CAT II) (Previously - G207) The SA will ensure the owner of the
## cron and crontab directories is root or bin.
# implemented in GEN003040

## (GEN003140: CAT II) (Previously - G208) The SA will ensure the group owner
## of the cron and crontab directories is root, sys, or bin.
# implemented in GEN003040

## (GEN003180: CAT II) (Previously - G210) The SA will ensure cron logs have
## permissions of 600, or more restrictive.
include_recipe "GEN003180"

## (GEN003300: CAT II) (Previously - G212) The SA will ensure the at.deny file
## is not empty.
# implemented in GEN003340

## (GEN003320: CAT II) (Previously - G213) The SA will ensure default system
## accounts (with the possible exception of root) are not listed in the
## at.allow file. If there is only an at.deny file, the default accounts
## (with the possible exception of root) will be listed there.
# implemented in GEN003340

## (GEN003340: CAT II) (Previously - G214) The SA will ensure the at.allow and
## at.deny files have permissions of 600, or more restrictive.
include_recipe "GEN003340"

## (GEN003400: CAT II) (Previously - G625) The SA will ensure the at (or
## equivalent) directory has permissions of 755, or more restrictive.
include_recipe "GEN003400"

## (GEN003420: CAT II) (Previously - G626) The SA will ensure the owner and
## group owner of the at (or equivalent) directory is root, sys, bin, or daemon.
# implemented in GEN003400

## (GEN003460: CAT II) (Previously - G629) The SA will ensure the owner and
## group owner of the at.allow file is root.
# implemented in GEN003340

## (GEN003480: CAT II) (Previously - G630) The SA will ensure the owner and
## group owner of the at.deny file is root.
# implemented in GEN003340

## (GEN003500: CAT III) The SA will ensure core dumps are disabled or
## restricted.
include_recipe "GEN003500"

## (GEN003520: CAT III) The SA will ensure the owner and group owner of the
## core dump  data directory is root with permissions of 700, or more
## restrictive.
include_recipe "GEN003520"

## (GEN003700: CAT II) The SA will ensure inetd (xinetd for Linux) is disabled
## if all inetd/xinetd based services are disabled.
include_recipe "GEN003700"

## (GEN003740: CAT II) (Previously - G108) The SA will ensure the inetd.conf
## (xinetd.conf for Linux) file has permissions of 440, or more restrictive.
## The Linux xinetd.d directory will have permissions of 755, or more
## restrictive. This is to include any directories defined in the includedir
## parameter.
include_recipe "GEN003740"

## (GEN003760: CAT II) (Previously - G109) The SA will ensure the owner of the
## services file is root or bin.
include_recipe "GEN003760"

## (GEN003780: CAT II) (Previously - G110) The SA will ensure the services
## file has permissions of 644, or more restrictive.
# implemented in GEN003760

## (GEN003860: CAT III) (Previously - V046) The SA will ensure finger is not
## enabled.
include_recipe "GEN003860"

## (GEN004360: CAT II) (Previously - G127) The SA will ensure the aliases file
## is owned by root.
include_recipe "GEN004360"

## (GEN004380: CAT II) (Previously - G128) The SA will ensure the aliases file
## has permissions of 644, or more restrictive.
# implemented in GEN004360

## (GEN004440: CAT IV) (Previously - G133) The SA will ensure the sendmail
## logging level (the detail level of e-mail tracing and debugging
## information) in the sendmail.cf file is set to a value no lower than
## nine (9).
include_recipe "GEN004440"

## (GEN004480: CAT II) (Previously - G135) The SA will ensure the owner of the
## critical sendmail log file is root.
include_recipe "GEN004480"

## (GEN004500: CAT II) (Previously - G136) The SA will ensure the critical
## sendmail log file has permissions of 644, or more restrictive.
# implemented in GEN004480

## (GEN004540: CAT II) The SA will ensure the help sendmail command is
## disabled.
include_recipe "GEN004540"

## (GEN004560: CAT II) (Previously - G646) To help mask the e-mail version,
## the SA will use the following in place of the original sendmail greeting
## message:
##   O SmtpGreetingMessage= Mail Server Ready ; $b
include_recipe "GEN004560"

## (GEN004580: CAT I) (Previously - G647) The SA will ensure .forward files
## are not used.
include_recipe "GEN004580"

## (GEN004640: CAT I) (Previously - V126) The SA will ensure the decode entry
## is disabled (deleted or commented out) from the alias file.
include_recipe "GEN004640"

## (GEN004880: CAT II) (Previously - G140) The SA will ensure the ftpusers
## file exists.
include_recipe "GEN004880"

## (GEN004900: CAT II) (Previously - G141) The SA will ensure the ftpusers
## file contains the usernames of users not allowed to use FTP, and contains,
## at a minimum, the system pseudo-users usernames and root.
# implemented in GEN004880

## (GEN004920: CAT II) (Previously - G142) The SA will ensure the owner of the
## ftpusers file is root.
# implemented in GEN004880

## (GEN004940: CAT II) (Previously - G143) The SA will ensure the ftpusers
## file has permissions of 640, or more restrictive.
# implemented in GEN004880

## (GEN005000: CAT I) (Previously - G649) The SA will implement the anonymous
## FTP account with a non-functional shell such as /bin/false.
# include_recipe "GEN005000"
# include gen005000
# superseded by LNX00320

## (GEN005400: CAT II) (Previously - G656) The SA will ensure the owner of the
## /etc/syslog.conf file is root with permissions of 640, or more restrictive.
## (GEN005420: CAT II) (Previously - G657) The SA will ensure the group owner
## of the /etc/syslog.conf file is root, sys, or bin.
include_recipe "GEN0054x0"

## (GEN005740: CAT II) (Previously - G178) The SA will ensure the owner of the
## export configuration file is root.
## (GEN005760: CAT III) (Previously - G179) The SA will ensure the export
## configuration file has permissions of 644, or more restrictive.
include_recipe "GEN0057x0"

## (GEN006100: CAT II) (Previously - L050) The SA will ensure the owner of
## the/etc/samba/smb.conf file is root.
include_recipe "GEN006100"

## (GEN006120: CAT II) (Previously - L051) The SA will ensure the group owner
## of the /etc/samba/smb.conf file is root.
# implemented in GEN006100

## (GEN006140: CAT II) (Previously - L052) The SA will ensure the
## /etc/samba/smb.conf file has permissions of 644, or more restrictive.
# implemented in GEN006100

## (GEN006160: CAT II) (Previously - L054) The SA will ensure the owner of
## smbpasswd is root.
include_recipe "GEN006160"

## (GEN006180: CAT II) (Previously - L055) The SA will ensure group owner of
## smbpasswd is root.
# implemented in GEN006160

## (GEN006200: CAT II) (Previously - L057) The SA will configure permissions
## for smbpasswd to 600, or more restrictive.
# implemented in GEN006160

## (GEN006260: CAT II) (Previously - L154) The SA will ensure the
## /etc/news/hosts.nntp file has permissions of 600, or more restrictive.
include_recipe "GEN006260"

## (GEN006280: CAT II) (Previously - L156) The SA will ensure the
## /etc/news/hosts.nntp.nolimit file has permissions of 600, or more
## restrictive.
include_recipe "GEN006280"

## (GEN006300: CAT II) (Previously - L158) The SA will ensure the
## /etc/news/nnrp.access file has permissions of 600, or more restrictive.
include_recipe "GEN006300"

## (GEN006320: CAT II) (Previously - L160) The SA will ensure the
## /etc/news/passwd.nntp file has permissions of 600, or more restrictive.
include_recipe "GEN006320"

## (GEN006340: CAT II) (Previously - L162) The SA will ensure the owner of all
## files under the /etc/news subdirectory is root or news.
include_recipe "GEN006340"

## (GEN006360: CAT II) (Previously - L164) The SA will ensure the group owner
## of all files in /etc/news is root or news.
# implemented in GEN006340

## (LNX00160: CAT II) (Previously - L074) The SA will ensure the grub.conf
## file has permissions of 600, or more restrictive.
include_recipe "LNX00160"

## (LNX00220: CAT II) (Previously - L080) The SA will ensure the lilo.conf
## file has permissions of 600 or more restrictive.
include_recipe "LNX00220"

## (LNX00320: CAT I) (Previously - L140) The SA will delete accounts that
## provide a special privilege such as shutdown and halt.
include_recipe "LNX00320"

## (LNX00340: CAT II) (Previously - L142) The SA will delete accounts that
## provide no operational purpose, such as games or operator, and will delete
## the associated software.
include_recipe "LNX00340"

## (LNX00360: CAT II) (Previously - L032) The SA will enable the X server
## –audit (at level 4) and –s option (with 15 minutes as the timeout time)
## options.
include_recipe "LNX00360"

## (LNX00400: CAT II) (Previously - L044) The SA will ensure the owner of the
## /etc/login.access or /etc/security/access.conf file is root.
include_recipe "LNX00400"

## (LNX00420: CAT II) (Previously - L045) The SA will ensure the group owner
## of the /etc/login.access or /etc/security/access.conf file is root.
# implemented in LNX00400

## (LNX00440: CAT II) (Previously - L046) The SA will ensure /etc/login.access
## or /etc/security/access.conf file will be 640, or more restrictive.
# implemented in LNX00400

## (LNX00480: CAT II) (Previously - L204) The SA will ensure the owner of the
## /etc/sysctl.conf file is root.
include_recipe "LNX00480"

## (LNX00500: CAT II) (Previously - L206) The SA will ensure the group owner
## of the /etc/sysctl.conf file is root.
# implemented in LNX00480

## (LNX00520: CAT II) (Previously - L208) The SA will ensure the
## /etc/sysctl.conf file has permissions of 600, or more restrictive.
# implemented in LNX00480

## (LNX00580: CAT I) (Previously - L222) The SA will disable the
## Ctrl-Alt-Delete sequence unless the system is located in a controlled
## access area accessible only by SAs.
include_recipe "LNX00580"

## (LNX00620: CAT II) The SA will ensure the group owner of the /etc/securetty
## file is root, sys, or bin.
# implemented in GEN000980

## (LNX00640: CAT II) The SA will ensure the owner of the /etc/securetty file
## is root.
# implemented in GEN000980

## (LNX00660: CAT II) The SA will ensure the /etc/securetty file has
## permissions of 640, or more restrictive.
# implemented in GEN000980

##########################################################################
# DCID 6/3 PL4
##########################################################################

## 4.B.4 Protection Level 4

# 4.B.4.a(1) 
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.a(1)(a)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.a(1)(b)
# KickStart Actions: None - PROCEDURAL REQUIREMENT


# 4.B.4.a(2) 
# KickStart Actions: All ext3 file systmes have been mounted with the ACL
#                    setting to allow for a finer granualrity of DAC.
#                    (See:  getfacl and setfacl man pages).
#                    Create ACL and other security features during
#                    the mounting of each file system (/etc/fstab).

# Implemented in GEN002420


# 4.B.4.a(3)  
# KickStart Actions: None - CLIP policy specific


# 4.B.4.a(4)  
# KickStart Actions: 

# 4.B.4.a(4)(a)
# KickStart Actions:

# 4.B.4.a(4)(b)
# KickStart Actions:

# 4.B.4.a(4)(c)
# KickStart Actions:

# 4.B.4.a(4)(d)
# KickStart Actions:

# 4.B.4.a(4)(e)
# KickStart Actions:

# 4.B.4.a(4)(e)1.
# KickStart Actions:

# 4.B.4.a(4)(e)2.
# KickStart Actions:


# 4.B.4.a(5) 
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.a(5)(a)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.a(5)(b)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.a(5)(c)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.a(5)(d)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

#(FOUO)
#4.B.4.a(5)(e)
#KickStart Actions: None - PROCEDURAL REQUIREMENT


# 4.B.4.a(6)
# KickStart Actions: None

# 4.B.4.a(6)(a)
# KickStart Actions: None

# 4.B.4.a(6)(b)
# KickStart Actions: Reset the permissions of /etc/syslog.conf to 640 and set
#                   /var/{run,log}/{wtmp,utmp} files to 664.

# Implemented in GEN001260
# Implemented in GEN005400
# Implemented in GEN005420
# Implemented in GEN004500
# Implemented in GEN004480
# Implemented in GEN003180


# 4.B.4.a(6)(c)
# KickStart Actions: Log rotation to 90 days (12 weeks) and turn compression on.
#                    This will have to up'd if system does not retain backups
#                    for 5 years  (e.g., tape backup).

# Implemented in GEN002860

# 4.B.4.a(6)(d)
# KickStart Actions: Turn on the Audit Daemon and set permissions

# Implemented in GEN002660
# Implemented in GEN002680
# Implemented in GEN002700

# 4.B.4.a(6)(d)(1)
# KickStart Actions: None, This is met with the /var/log/wtmp and
#                    /var/log/utmp files. Permissions have been set
#                    correctly above.
#                    See Section 4.B.4.a(6)(d)(2)

# 4.B.4.a(6)(d)(2)
# KickStart Actions: This will require refinement.
#                    Commented rules do not insert w/o an error.

# Implemented in GEN002720
# Implemented in GEN002740
# Implemented in GEN002760
# Implemented in GEN002780
# Implemented in GEN002800
# Implemented in GEN002820
# Implemented in GEN002840

# 4.B.4.a(6)(d)(3)
# KickStart Actions: All authentication attemps will be monitored
#                    in /var/log/messages.

# Implemented in GEN003660
# Implemented in GEN000440
# Implemented in GEN004440

# 4.B.4.a(7) 
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.a(8) 
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 4.B.4.a(8)(a)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 4.B.4.a(8)(b)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 4.B.4.a(9) 
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 4.B.4.a(9)(a)
# KickStart Actions:

# 4.B.4.a(9)(b)
# KickStart Actions:  POLICY

# 4.B.4.a(9)(c)
# KickStart Actions:

# 4.B.4.a(9)(d)
# KickStart Actions:

# 4.B.4.a(10)  
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 4.B.4.a(10)(a)
# KickStart Actions:

# 4.B.4.a(10)(b)
# KickStart Actions:

# 4.B.4.a(11) 
# KickStart Actions:  None

# 4.B.4.a(11)(a)
# KickStart Actions:  None

# 4.B.4.a(11)(b)
# KickStart Actions:  None

# 4.B.4.a(11)(c)
# KickStart Actions: The following item have been set to meet this policy.
# Note:
# Investigating using PAM for preventing 10 recent passwords- doesn't appear
# to be easily done using pam_passwdqc

# Implemented in GEN000580
# Implemented in GEN000600

# 4.B.4.a(11)(d)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 4.B.4.a(11)(e)
# KickStart Actions: Change the password expiration time from undefined to 60 days.
#                    Users cannot change passwords more than once a day.

# Implemented in GEN000700
# Implemented in GEN000540

# 4.B.4.a(11)(f)
# KickStart Actions: opasswd file creation in /etc/security/opasswd
#                    for non-replication.

# Implemented in GEN000800

# 4.B.4.a(11)(g)
# KickStart Actions: Additional I&A Security.
#                    Protection of authenticators to perserve confidentiality and
#                    integrity.  Red Hat encrypts authenticators using the MD5
#                    Message Digest.

# Implemented in GEN001380
# Implemented in GEN001400
# Implemented in GEN001420
# Implemented in GEN000560

# 4.B.4.a(12) 
# KickStart Actions:  See 4.B.4.a(9)(c); specifically passwdqc


# 4.B.4.a(13) 
# KickStart Actions: By default ssh uses Triple DES.  This script will edit
#                    the /etc/ssh/ssh_config file to use stronger encryption.
#                    AES with 256-bit key Cycpher Block Chaining  

# Implemented in GEN005500


# 4.B.4.a(14) 
# KickStart Actions: None

# 4.B.4.a(14)(a)
# KickStart Actions:

# 4.B.4.a(14)(b)
# KickStart Actions:


# 4.B.4.a(15) 
# KickStart Actions:  

# 4.B.4.a(15)(a)
# KickStart Actions:

# 4.B.4.a(15)(b)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 4.B.4.a(15)(c)
# KickStart Actions:

# 4.B.4.a(15)(d)
# KickStart Actions:

# 4.B.4.a(15)(e)
# KickStart Actions:


# 4.B.4.a(16)  
# KickStart Actions:  None - PROCEDURAL REQUIREMENT


# 4.B.4.a(17) 
# KickStart Actions: Restrict Root Logins and Least Privilege Enhancements.

# Implemented in GEN000020


# 4.B.4.a(18) 
# KickStart Actions: None


# 4.B.4.a(19) 
# KickStart Actions: Centralized Time


# 4.B.4.a(20) 
# KickStart Actions: None


# 4.B.4.a(21) 
# KickStart Actions: None

# 4.B.4.a(21)(a)
# KickStart Actions: Interactive Shell setting here.
# Gnome screen-saver line command tool -->  needs to be tested.
# gconftool-2 --direct \
#   --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
#   --type int \
#   --set /apps/gnome-screensaver/idle_delay 15

# 4.B.4.a(21)(b)
# KickStart Actions: None

# 4.B.4.a(21)(c)
# KickStart Actions: None


# 4.B.4.a(22) 
# KickStart Actions: None


# 4.B.4.a(23) 
# KickStart Actions: None

# 4.B.4.a(23)(a)
# KickStart Actions: See Section 4.B.4.a(23)(b)

# 4.B.4.a(23)(b)
# KickStart Actions: Banner Settings

# Implemented in GEN000400

# 4.B.4.a(24) 
# KickStart Actions: None

# 4.B.4.a(24)(a)
# KickStart Actions: None

# 4.B.4.a(24)(b)
# KickStart Actions: Set an inactive shell timeout - likely going away in March STIG

# Implemented in GEN000500

# 4.B.4.a(24)(c)
# KickStart Actions: None

# Implemented in GEN000460
# Implemented in GEN000480

# 4.B.4.a(24)(d)
# KickStart Actions: None

# 4.B.4.a(25) 
# KickStart Actions: None

# 4.B.4.a(25)(a)
# KickStart Actions: None

# 4.B.4.a(25)(b)
# KickStart Actions: None

# 4.B.4.a(25)(c)
# KickStart Actions: None

# 4.B.4.a(25)(d)
# KickStart Actions: None - Will need to down load an encryption package like "secret agent"


# 4.B.4.a(26) 
# KickStart Actions: None

# 4.B.4.a(26)(a)
# KickStart Actions: None

# 4.B.4.a(26)(a)(1)
# KickStart Actions: None

# 4.B.4.a(26)(a)(2)
# KickStart Actions: None

# 4.B.4.a(26)(a)(3)
# KickStart Actions:

# Implemented in GEN005500

# 4.B.4.a(26)(a)(4)
# KickStart Actions: None

# 4.B.4.a(26)(b)
# KickStart Actions: None


# 4.B.4.a(27)  
# KickStart Actions: 


### DCID 6/3 PL4
# 4.B.4 Protection Level 4

# 4.B.4.b --  Requirements for system assurance at PL4
# KickStart Actions: None

# 4.B.4.b(1) 
# KickStart Actions: 

# 4.B.4.b(2) 
# KickStart Actions: None

# 4.B.4.b(2)(a)
# KickStart Actions: None

# 4.B.4.b(2)(b)
# KickStart Actions: None

# 4.B.4.b(3) 
# KickStart Actions: None

# 4.B.4.b(4) 
# KickStart Actions: None

# 4.B.4.b(4)(a)
# KickStart Actions: None

# 4.B.4.b(4)(b)
# KickStart Actions: None

# 4.B.4.b(4)(c)
# KickStart Actions: None

# 4.B.4.b(4)(d)
# KickStart Actions: None

# 4.B.4.b(5) 
# KickStart Actions: None

# 4.B.4.b(5)(a)
# KickStart Actions: Expected Operations

# Implemented in GEN003600
# Implemented in GEN003700
# Implemented in GEN003740
# Implemented in GEN003860
# Implemented in GEN003960
# Implemented in GEN003980
# Implemented in GEN004000
# Implemented in GEN005600

# 4.B.4.b(5)(b)
# KickStart Actions: Actions Listed Below

# Implemented in GEN000920
# Implemented in GEN000980
# Implemented in GEN001020
# Implemented in GEN001080
# Implemented in GEN001120
# Implemented in GEN001280
# Implemented in GEN001460
# Implemented in GEN001560
# Implemented in GEN001580
# Implemented in GEN001620
# Implemented in GEN001660
# Implemented in GEN001680
# Implemented in GEN001720
# Implemented in GEN001740
# Implemented in GEN001760
# Implemented in GEN001780
# Implemented in GEN001800
# Implemented in GEN001820
# Implemented in GEN002040
# Implemented in GEN002120
# Implemented in GEN002160
# Implemented in GEN002180
# Implemented in GEN002200
# Implemented in GEN002220
# Implemented in GEN002320
# Implemented in GEN002340
# Implemented in GEN002360
# Implemented in GEN002560
# Implemented in GEN002640
# Implemented in GEN002980
# Implemented in GEN003040
# Implemented in GEN003060
# Implemented in GEN003080
# Implemented in GEN003100
# Implemented in GEN003120
# Implemented in GEN003140
# Implemented in GEN003200
# Implemented in GEN003240
# Implemented in GEN003260
# Implemented in GEN003300
# Implemented in GEN003320
# Implemented in GEN003340
# Implemented in GEN003400
# Implemented in GEN003420
# Implemented in GEN003460
# Implemented in GEN003480
# Implemented in GEN003500
# Implemented in GEN003520
# Implemented in GEN003760
# Implemented in GEN003780
# Implemented in GEN004360
# Implemented in GEN004380
# Implemented in GEN004540
# Implemented in GEN004560
# Implemented in GEN004580
# Implemented in GEN004640
# Implemented in GEN004880
# Implemented in GEN004900
# Implemented in GEN004920
# Implemented in GEN004940
# Implemented in GEN005000
# Implemented in GEN005360
# Implemented in GEN005740
# Implemented in GEN005760
# Implemented in GEN006100
# Implemented in GEN006120
# Implemented in GEN006140
# Implemented in GEN006160
# Implemented in GEN006180
# Implemented in GEN006200
# Implemented in GEN006260
# Implemented in GEN006280
# Implemented in GEN006300
# Implemented in GEN006320
# Implemented in GEN006340
# Implemented in GEN006360
# Implemented in GEN006520
# Implemented in GEN006620
# Implemented in LNX00160
# Implemented in LNX00220
# Implemented in LNX00320
# Implemented in LNX00340
# Implemented in LNX00360
# Implemented in LNX00400
# Implemented in LNX00420
# Implemented in LNX00440
# Implemented in LNX00480
# Implemented in LNX00500
# Implemented in LNX00520
# Implemented in LNX00580
# Implemented in LNX00620
# Implemented in LNX00640
# Implemented in LNX00660

# 4.B.4.b(6)
# KickStart Actions: None

# 4.B.4.b(6)(a)
# KickStart Actions: None

# 4.B.4.b(6)(b)
# KickStart Actions: None - PROCEDURAL REQUIREMENT


# 4.B.4.b(7) 
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(7)(a)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(7)(b)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(8)
# KickStart Actions:


# 4.B.4.b(9)
# KickStart Actions: None - PROCEDURAL REQUIREMENT


# 4.B.4.b(10) 
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(10)(a)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(10)(b)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(10)(b)(1)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(10)(b)(2)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(10)(b)(3)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(11) 
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(11)(a)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 4.B.4.b(11)(b)
# KickStart Actions: None - PROCEDURAL REQUIREMENT


##########################################################################
# Integrity System Security Features and Assurances (HIGH Integrity)

# 5.B.3.a(1)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(1)(a)
# KickStart Actions:  None

# 5.B.3.a(1)(b)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(1)(c)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(1)(d)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(2)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(2)(a)
# KickStart Actions:  None

# 5.B.3.a(2)(b)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(2)(b)(1)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(2)(b)(2)
# KickStart Actions:

# 5.B.3.a(3)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(3)(a)
# KickStart Actions:  None

# 5.B.3.a(3)(b)
# KickStart Actions:  None

# 5.B.3.a(4)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(4)(a)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(4)(b)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(5)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(5)(a)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(5)(a)(1)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(5)(a)(2)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(5)(a)(3)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(5)(b)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(6)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(6)(a)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(6)(b)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(6)(c)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(7)
# KickStart Actions:  None

# 5.B.3.a(8)
# KickStart Actions:  None

# 5.B.3.a(9)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(10)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(11)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.a(11)(a)
# KickStart Actions:  None

# 5.B.3.a(11)(b)
# KickStart Actions:  None

# 5.B.3.b
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.b(1)
# KickStart Actions:  None

# 5.B.3.b(2)
# KickStart Actions:  None

# 5.B.3.b(3)
# KickStart Actions:  None - PROCEDURAL REQUIREMENT

# 5.B.3.b(4)
# KickStart Actions: None - PROCEDURAL REQUIREMENT


###############################################################################
# Availability System Security Features and Assurances (HIGH Availability)

# 6.B.3.a(1)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(2)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(2)(a)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(2)(b)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(2)(c)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(2)(d)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(3)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(3)(a)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(3)(b)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(3)(c)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(3)(d)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(4)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(4)(a)
# KickStart Actions: None

# 6.B.3.a(4)(b)
# KickStart Actions: None

# 6.B.3.a(5)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(6)
# KickStart Actions: None

# 6.B.3.a(7)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(7)(a)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(7)(b)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(7)(c)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(8)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(9)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(10)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.a(11)
# KickStart Actions: None

# 6.B.3.a(12)
# KickStart Actions: None

# 6.B.3.b
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.b(1)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.b(2)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.b(2)(a)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.b(2)(b)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 6.B.3.b(3)
# KickStart Actions: None - PROCEDURAL REQUIREMENT


##########################################################################
# Requirements for Interconnected Information Systems and Advanced Technologies
#

# 7.A.1.a
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.A.1.b
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.A.2
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.A.3
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.A.4
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.1.a(1)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.1.a(2)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.1.a(3)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.2.a(1)
# KickStart Actions: None

# 7.B.2.a(2)
# KickStart Actions: None

# 7.B.2.a(3)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.2.b
# KickStart Actions: None

# 7.B.2.c
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.2.d
# KickStart Actions: None

# 7.B.2.e
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.2.f
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.2.g
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.2.h
# KickStart Actions: None 

# Implemented in GEN000980
# Implemented in GEN002720
# Implemented in GEN002740
# Implemented in GEN002780
# Implemented in GEN003660

# 7.B.2.i(1)
# KickStart Actions: None

# Implemented in GEN006620

# 7.B.2.i(2)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.2.i(3)(a)
# KickStart Actions: None - DEVELOPMENT Requirement

# 7.B.2.i(3)(b)
# KickStart Actions: None - DEVELOPMENT AND PROCEDURAL REQUIREMENTS

# 7.B.2.i(4)
# KickStart Actions: None

# Implemented in GEN000980

# 7.B.2.i(5)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.2.i(6)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.3.a(1)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.3.a(2)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.3.b(1)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.3.b(2)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.3.c
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.3.d(1)
# KickStart Actions: 

# 7.B.3.d(2)
# KickStart Actions: 

# 7.B.3.d(3)
# KickStart Actions: 

# 7.B.3.d(4)
# KickStart Actions: 

# 7.B.3.d(5)
# KickStart Actions: 

# 7.B.3.d(6)
# KickStart Actions: 

# 7.B.3.e
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.3.f(1)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.3.f(2)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.3.g
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.4.a
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.B.4.b(1)
# KickStart Actions: 

# 7.B.4.b(2)
# KickStart Actions: 

# 7.B.4.b(3)
# KickStart Actions: 

# 7.B.4.b(4)
# KickStart Actions: 

# 7.B.4.b(5)
# KickStart Actions: 

# 7.B.4.b(6)
# KickStart Actions: 

# 7.B.4.b(7)
# KickStart Actions: 

# 7.B.4.c
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.C.1.a
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.C.1.b
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.C.1.c
# KickStart Actions: 

# 7.C.2.a
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.C.2.a(1)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.C.2.a(2)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.C.2.a(3)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.C.2.b
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.D.2.a
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.D.2.b
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.D.2.c
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.D.2.d
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.D.2.e
# KickStart Actions: 

# 7.D.3.a
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.D.3.b(1)
# KickStart Actions: None - PROCEDURAL REQUIREMENT

# 7.D.3.b(2)
# KickStart Actions: 

# 7.D.3.b(3)
# KickStart Actions: 
