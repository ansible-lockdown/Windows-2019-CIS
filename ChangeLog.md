# Changelog

## Release 2.0.0

October 2023 Update
- Update Controls to CIS V2.0.0 released 04-05-2023

## Release 1.3.0

August 2023 Update
- Updated Workflows To Central Repo
  - Renamed them to better run across all repos.
- Removed Templates & PR Template from repo and adjusted to Org level.
- Updated Readme Layout to add new pipeline badges.
- Section1_Cloud moved from tasks/main and renamed to section1_cloud_lockout_order and in section1.yml workflow.
- Updated Tags in tasks/main.
- Updated When Statement Formatting For Entire Playbook.

May 2023 Update
- Added Additional Cloud support for tasks.
- Fixed Pipelines
- Major Update: All task rule names updated to add win19cis to them in default main.
- Ansible Lockdown Banner In Playbook (Testing)
- Finished Updating to CIS 1.3.0
- Updated Galaxy Workflow
- Updated module names to new standard.
- Issues Closed
  - [#31](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/31) - Thanks @georgenalen
  - [#64](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/64) - Thanks @dimi4ik
  - [#67](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/67) - Thanks @Igor-X
- Benchmarks 1.2.1 - 1.2.3 Put In Correct Order To Take Into Account System Defaults.
- Benchmark 1.1.7 - Added
- Benchmark 2.2.37 - Added Variable To Choose If Exchange Server Installed.
- Benchmark 2.3.6.5 - Added Variable
- Benchmark 2.3.7.3 - Added Variable
- Benchmark 2.3.7.6 - Added Variable
- Benchmark 2.3.7.7 - Added Variable
- Benchmark 18.4.9 - Added Variable
- Benchmark 18.4.12 - Added Variable
- Benchmark 18.8.3.1 - Old setting was set to disabled, new benchmark calls for enabled. Updated registry value.
- Benchmark 18.9.12.1 - Calls For Disabled, Updated and Changed Registry Entry To Disable.
- Benchmark 18.9.17.2 - Calls For Enabled, Updated and Changed Registry Entry To Enable.
- Benchmark 18.9.27.1.2 - Added Variable
- Benchmark 18.9.27.2.2 - Added Variable
- Benchmark 18.9.27.3.2 - Added Variable
- Benchmark 18.9.27.4.2 - Added Variable
- Benchmark 18.9.64.1 - Added
- Benchmark 18.9.65.3.10.1 - Added Variable
- Benchmark 18.9.65.3.10.2 - Updated the registry entry time to 1 Min per CIS.
- Benchmark 19.3.3 - Added Variable
- Benchmark 19.1.3.4 - Removed Not A Valid Control

## Release 1.2.0

October 2022 Update
  - Issues Addressed:
    - #36
    - #47
    - #48
    - #51
    - #52
    - #54
    - #59
  - Enhancements:
    - Updated to CIS benchmark 1.3.0

## Release 1.1.1

July 2021 Update
  - Issue Fixes:
    - #37 - 18.9.59.3.11.1 - Updated level tags
    - #38 - 18.1.2.2 - Implemented control
    - #39 - 18.3.1 - Implemented control
    - #40 - 2.3.1.5/2.3.1.6 - Created variables for values
    - #41 - 2.2.47 - Updated value
    - #42 - 2.2.18 - Added logic for Hyper-V role not being installed
  - Enhancements:
    - Fixed linting issues to work with Galaxy
    - Implemented 18.1.3
    - Implemented 18.2.1
    - Implemented 18.2.2
    - Implemented 18.2.3
    - Implemented 18.2.4
    - Implemented 18.2.5
    - Implemented 18.2.6
    - Implemented 18.3.2
    - Implemented 18.3.5

## Release 1.1.0

April 2021 Update
  - #14 - 18.3.4 - Bad data value
  - #15 - 18.3.6 - Bad data value
  - #16 - 18.5.21.1 - Bad data value
  - #17 - 18.9.77.13.3.1 - Bad regkey name
  - #18 - 18.9.95.1 - Bad data value
  - #19 - 18.9.95.2 - Bad data value
  - #21 - 18.9.26.3.1 - Bad regkey path
  - #23 - 18.9.26.1.1 - Bad data type
  - #24 - 19.7.4.1 - Bad data value
  - #25 - 2.3.6.4 - Bad data value
  - #26 - 2.3.11.4 - Bad data value
  - #27 - 17.5.1 - Bad shell command (fixed success:enable to failure:enable)
  - #28 - 9.1.4/9.2.4/9.3.4 - Bad data value

## Release 1.0.1

March 2021 Update
  - #7 - 18.3.7 Control is missing
  - #8 - Align tags between sections
  - #10 - Wrong user for all users in win_user_right module
  - Added missing controls 17.1.2 and 17.1.3
  - Updated README and CONTRIBUTING file

## Release 1.0.0

March 2021
  - Initial Release
