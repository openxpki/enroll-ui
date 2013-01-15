# OpenXPKI Enrollment Interface

This is a certificate enrollment interface for OpenXPKI. Basically, it
runs on a bastion host and accepts CSRs from external users. These
CSRs are passed to an internal OpenXPKI daemon via SSCEP.

# REQUIREMENTS

## Authentication/Authorization

* The user is authenticated externally using ClearCase/WebSSO

## URIs

* Accessing the URI '/' lists all possible operations
* POST to the URI '/upload' receives the CSR

## SSCEP

* The call to SSCEP must be properly escaped to prevent tainted information


