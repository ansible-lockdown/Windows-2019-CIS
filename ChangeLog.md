# Changelog

## Release 3.1.1

May 2025 Update
  - Fixed Control 18.6.14.1 For Missing RequirePrivacy=1 in Ansible Hardening And title. - Thanks @mfortin
  - Updated 18.10.56.3.10.2 value to 60000 from 6000 in remediate and GPO - Thanks @mfortin
  - Updated 18.10.79.2 Path In Remediate - Thanks @mfortin
  - Updated 18.10.92.4.1 ManagePreviewBuildsPolicyValue to 1. - Thanks @mfortin
  - Updated Pipelines Branches Trigger
  - Updated Readme with New Badges

## Release 3.1.0

February 2025 Update
  - Added the cloud lockout cloud tasks import that was removed last release.

## Release 3.0.2

February 2025 Update
  - Added new Readme Badges
  - General Typos and Fixes
  - All Workflows Updated
  - Fixed Control Tag for rule_2.3.10.9

## Release 3.0.1

February 2025 Update
  - Standard GPO title and typo fixes update

December 2024 Updates
  - Added the ability create tailored Group Policy Objects (GPOs) compliant with CIS benchmarks using Ansible.
    - Custom GPOs based around variables in defaults/main.
    - New variables for the GPO creation.
    - Turn on and off controls to add them to the GPOs.
    - More flexibility in the way the GPOs are created for Lvl1 and Lvl2.
  - Banner Update
  - NIST Tags Added
  - Updated prelim Set system facts based on gather facts module naming.
  - Updated all win_regedit paths to reflect capitalized System/Software registry entries.
  - Removed all "state: present" (Default) value from the "win_regedit" module.
  - Updated tasks in the prelim and post to also headers matched the section.
  - Updated when's with "primary domain controller" to "domain controller"
  - Verified all controls meet new CIS standards for 3.0.1
  - Updated when's with "primary domain controller" to "domain controller"
  - Fixed meta for galaxy.
  - Removed Control 9.2.3 and moved all tasks left from 9.2.4 - 9.2.8 to 9.2.3 - 9.2.7
  - Removed Control 9.2.8 from Default Main
  - Control 18.9.5.2 has a new option for variables.
  - General Other Updates
  - Issues Addressed:
    - [#101](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/101) - Thanks @dennisharder-alight
    - [#103](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/103) - Thanks @Crombell95
    - [#104](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/104) - Thanks @devallan
    - [#107](https://github.com/ansible-lockdown/Windows-2022-CIS/issues/107) - Thanks @animatco & @kpi-nourman
    - [#49](https://github.com/ansible-lockdown/Windows-2022-CIS/issues/49) - Thanks @animatco

June 2024 Update
  - Updated tasks to align with Windows2019CISv3.0.1 release
  - Updated LegalNoticeCaption var with title fix - Thank you @rlmass
  - Updated when's with "primary domain controller" to "domain controller"
  - Updated PRELIM | Set Fact If Cloud Based System to include ansible_system_vendor. - Thanks @mfortin
  - Updated Pipelines - Thanks @mfortin
  - Updated DisableBkGndGroupPolicy To 0 "Disabled" - Thanks @dennisharder-alight
  - Updated ManagePreviewBuildsPolicyValue To 0 "Disabled" - Thanks @dennisharder-al
  - Removed all "state: present" (Default) value from the "win_regedit" module.
  - Update set_fact prelim vars with prefix prelim_ throughout the playbook

## Release 2.0.1

April 2024 Update
  - Thank you @MrSteve81 for the enhancements to this release!
    - Improved 19.x section logic for Windows local user SIDs and HKU support.
    - Reboot handler and logic Improvement with skip_reboot var feature.
    - win_skip_for_test var update with additional description and supported controls of 18.10.89.2.2

February 2024 Update
  - Issues Addressed:
    - [#88](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/88) - Thank you @animatco
    - [#89](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/89) - Thank you @animatco
    - [#90](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/90) - Thank you @animatco
    - [#91](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/91) - Thank you @animatco
    - [#92](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/92) - Thank you @animatco
    - [#94](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/94) - Thank you @dennisharder-alight

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
