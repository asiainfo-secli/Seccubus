Seccubus V2 Read Me
===================
Seccubus automates regular vulnerability scans with vrious tools and aids 
security people in the fast analysis of its output, both on the first scan and 
on repeated scans.

On repeated scan delta reporting ensures that findings only need to be judged 
when they first appear in the scan results or when their output changes.

Seccubus 2.x is the only actively developed and maintained branch and all support 
for Seccubus V1 has officially been dropped. 

Seccubus V2 works with the following scanners:
* Nessus 
* OpenVAS
* Skipfish
* Medusa (local and remote)
* Nikto (local and remote)
* NMap (local and remote)
* OWASP-ZAP (local and remote)
* SSLyze
* Medusa
* Qualys SSL labs

For more information visit [www.seccubus.com]

![Travis build status](https://travis-ci.org/schubergphilis/Seccubus.svg?branch=master)

Changes of this branch vs the [latest/previous release](https://github.com/schubergphilis/Seccubus_v2/releases/tag/2.26)
---
x-x-2016 - 2.27 - ?
=================================================================

Enhancements
------------
* #361 - arkenoi created a netsparker2ivil tool that allows you to manually import Netsparker scans
* #331 - Now using SSLLabs API v3
* #386 - New SSL labs API output featues incorporporated
* #389 - API endpoint URL has moved to a single function so it can be patched if deployed in a three tier architecture
* #392 - Alternative handling of the updateFIndings.pl API

Bug Fixes
---------
* #364 - auto_gen column was missing from asset_host table
* #358 - Could not get findings when an asset was used for the query
* #360 - Not able to export report in PDF format - This breaks the scan
* #336 - Non-critical RPM errors on CentOS 5
* #376 - Removed 50 host limit in filters as it was counterproductive
* #374 - Fixed Nikto path detection code
* #377 - Hostname filter wasn't working correctly, typed Hostname iso HostName
* #385 - SSLlabs failed because cypher preference order was split out per protocol by SSLlabs now.
* #394 - SSLlabs scanner failed if all enpoints fail and --gradeonly was used
