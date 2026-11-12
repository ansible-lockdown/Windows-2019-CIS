# ChangeLog

## CIS Benchmark v4.0.0
## October 2026 Updates

  - fix: 1.2.4 checked against the live lockout duration when 1.2.1 is off
  - fix: 1.2.1 lowers the reset counter when the lockout duration is Never
  - fix: 2.3.5.4 warns on a domain controller instead of writing a value the Default Domain Controllers Policy reverts
  - fix: audit bridge no longer emits the 2.2.34 and 2.3.10.9 switches, which no audit spec reads
  - style: section_19 task key order
  - style: 1.2.4 warning count sub-task name has a single separator
  - docs: defaults comments name win19cis_bad_login_lockout_count and point to section_1.2.x.yml for the lockout order
  - docs: README no longer names a GPO role that does not exist
  - docs: README pre-commit badge removed, its endpoint returns 404
  - docs: README gives the audit content default, the Windows-2019-CIS-Audit benchmark branch archive

## CIS Benchmark v4.0.0
## September 2026 Updates - audit content

  - fix: prelim and 2.3.5.4 warnings point to the Default Domain Policy and Default Domain Controllers Policy, not a GPO role that is not published for 2019
  - style: 2.3.10.9 WINS sub-task named with its control title
  - style: task names follow the benchmark titles for 1.2.3, 2.2.38, 2.3.9.5, 2.3.10.6 - 2.3.10.9, 5.1, 5.2 and 18.10.82.1
  - fix: 18.4.4 writes EnableCertPaddingCheck to the Wow6432Node location as well
  - docs: README, ChangeLog, defaults comments and workflow step typos and grammar
  - docs: win_skip_for_test notes give the current 2.2.3 and 2.2.22 gates
  - fix: 1.1.3 warning names win19cis_minimum_password_age, was win19cis_maximum_password_age
  - style: typos and punctuation in warning messages and task names
  - docs: README GPO migration table lists the GPO naming variables
  - README local testing version typo fixed
  - fix: 18.10.82.1 rule tag corrected, was rule_18.10.81.1, and its registry path in the case Windows-2025-CIS uses
  - fix: 18.9.19.7 removes DisableBkGndGroupPolicy from Policies\System
  - fix: 16 MS only controls applied on standalone servers
  - fix: 5.2 Print Spooler applied on standalone servers
  - fix: 2.3.6.x Domain member controls applied on domain controllers, as CIS scopes them
  - style: task vars placed straight after the module in 51 tasks
  - fix: post.yml warn_control_id scoped to the warning count task, not the whole block
  - fix: NGWS controls gated on win19cis_ngws, default false
  - fix: win19cis_ngws moved to defaults/main/main.yml
  - docs: README - stand-alone servers and NGWS profile sections, target type counts
  - docs: README - level1-domainmember dropped from the tag list
  - style: trailing full stops removed from 115 task names
  - fix: invented level1-domainmember tag removed from 2.3.6.x
  - style: handler tags before the module
  - style: loop_control labels removed from fetch_audit_output.yml
  - fix: unused community.general collection dependency removed
  - style: blank line after the document start in .pre-commit-config.yaml
  - README tag example uses 18.4.3, was rule_18.3.3
  - 39 registers renamed to the discovered_ prefix
  - duplicate spooler_service_info register split per control
  - fixed to new vars for section 5
  - Added the audit wiring: setup, pre and post remediation audits, compliance facts and output fetch, all off by default
    - Needs Windows-2019-CIS-Audit content for benchmark v4.0.0, which is not yet published
  - docs: README table of the controls the domain overrides, and how the role and audit report them
  - Moved the contents of tasks/ansible_hardening up into tasks/
  - Merged tasks/ansible_hardening/main.yml into tasks/main.yml
  - Updated the prelim include path
  - Grouped section tasks as tasks/section_N/, each with a main.yml
  - Section 1 skipped on domain joined hosts, with a warning
    - The Default Domain Policy overwrites local [System Access] at every refresh
    - 1.2.3 applies on a standalone server only
  - 2.3.11.6 skipped on domain joined hosts, with a warning
    - ForceLogoffWhenHourExpire is a [System Access] value the Default Domain Policy sets to 0
  - README domain members section covers 2.3.11.6
  - 2.3.7.4 legal notice written through the security database
    - Was cut to its first line whenever a later win_security_policy task re-imported
    - Blank lines dropped, commas kept
  - 1.2.1 lockout duration applies on a stock host
    - The reset counter is reconciled in section 1, after 1.2.2 enables lockout
    - Windows auto-populates duration and reset to 30 once 1.2.2 runs, which rejected the 1.2.1 import
  - A tagged run reaches the controls it names
    - Remediation and prelim tasks were included, and tags do not pass through include_tasks, so --tags ran no control
    - They are imported now, and the reconcile carries the rule_1.2.1 tags, so only a run that asks for 1.2.1 can move it
  - secedit reads work under Constrained Language Mode
    - Cmdlets, operators and $Matches only
    - secedit now exports to a path that does not already exist, which keeps the [Unicode] header
  - Standalone detection covers a stand-alone workstation, not only a stand-alone server
  - Domain scope warning names the Default Domain Policy and the Windows-2019-CIS-GPO role
    - States that a domain controller has no local remediation path for section 1
  - README: what the role enforces on a standalone, member server and domain controller
  - README: why a control's CIS profile tags and its when can disagree, using 1.2.3
  - README: migration path for the GPO variables removed from this role
  - moved reading user hive from prelim to section_19/main.yml to minimise potential unload hive issue
  - NIST800-53 task tags removed, NIST800-53R5 and NIST800-171 kept
  - README tagging example shows NIST800-53R5 only
  - Clear up confusion in GPO wording (this is currently WIP)

## September 2026 Updates - GPO creation removed

  - Removed the GPO creation path (tasks/gpo_creation)
  - Removed the test domain creation (tasks/domain_creation)
  - Removed the GPO templates (templates/cis_templates, templates/windows_templates)
  - Removed the GPO pipeline workflows and badges
  - Removed win19cis_ansible_remediation and win19cis_create_gpos toggles
  - Removed the GPO, domain creation, DSRM and GPO backup defaults
  - Removed the GPO name vars
  - Removed the gpo galaxy tag
  - Removed the GPO sections from the README
  - GPO creation now lives in Windows-2019-CIS-GPO
QA pass fixes from Windows-2025-CIS, where they hold for CIS Microsoft Windows Server 2019 Benchmark v4.0.0.

  - docs: README explains why section 1 cannot hold on a domain member, with the measured before and after values
  - Corrected task titles that named a different control.
  - Corrected rule_ tags
  - Removed 11 stray gpo tags from the hardening path, where --tags gpo selected direct registry
    writes in sections 1 and 18.
  - Normalised 31 malformed NIST tags.
  - Corrected the credentialsdelecation tag to credentialsdelegation.
  - Corrected the 1.1.2 and 1.1.3 conditionals
  - Removed the cloud-based task ordering split for the account lockout controls.
    - Deleted tasks/ansible_hardening/section01_cloud_lockout_order.yml, which duplicated
      1.2.1 to 1.2.4 purely to run them in a different order.
    - Removed hosted_virtual_system_override and prelim_win19cis_cloud_based_system. The
      auto-detection used ansible_virtualization_type and ansible_system_vendor and its own
      documentation listed VMware vSphere, AWS GovCloud and standalone VMware as known failures.
    - Root cause: Windows requires LockoutDuration to be no less than ResetLockoutCount, and
      win_security_policy re-imports the whole secedit ini on every call, so whichever of 1.2.1 or
      1.2.4 is written first fails with "The parameter is incorrect" when the existing values
      conflict. This is ansible/ansible#62594. It depends on the starting state of the image, not
      on whether the host is cloud based.
    - Section 1 now reads the current LockoutDuration and ResetLockoutCount after 1.2.2 and lowers
      the reset counter only when it would block 1.2.1. Windows maintains duration >= reset, so that
      makes the fixed order 1.2.2, 1.2.1, 1.2.4, 1.2.3 valid from any starting state.
  - Migrated the remaining bare fact references to ansible_facts bracket notation.
    - ansible_distribution, ansible_distribution_major_version and ansible_os_family in tasks/main.yml.
    - ansible_windows_domain_role in the prelim.
  - Removed the duplicate windows2019 galaxy tag from meta/main.yml.
  - Removed export_badges_public.yml and update_galaxy.yml, update_galaxy.yml carried no repository_visibility guard.
  - Updated actions/checkout to v7.0.0 across the workflows.
  - Updated welcome message and version for workflows
  - Replaced CONTRIBUTING.rst with CONTRIBUTING.md, headed Contributing to Ansible-Lockdown Projects.
  - Updated the README social badge from Twitter to X.
  - Updated .gitignore
  - Added .pre-commit-config.yaml and updated .ansible-lint and .yamllint
    - .ansible-lint set parseable, which stopped ansible-lint loading its configuration at all
  - Moved min_ansible_ver to vars/main from defaults
  - Updated LICENSE year to 2026 and company to MindPoint Group - A Quantum Sky Company.
  - Updated run banner and meta/main.yml with the current company name.
  - Updated meta/main.yml author to Ansible-Lockdown Team and min_ansible_version to 2.16.1.
  - Updated 2.3.10.9 to use ansible.windows.win_feature_info. Replacing the deprecated community.windows redirect
  - Updated task names to match the CIS control wording.
  - 2.2.31 Generate security audits made idempotent.
    - Reads current holders and only reapplies win_user_right when they differ.
  - 2.3.11.6 Force logoff when logon hours expire now uses the mechanism that implements it.
    - Both paths wrote LanManServer\Parameters EnableForcedLogOff, which is control 2.3.9.4's
      value. CIS names no registry location for 2.3.11.6 because it is a secedit [System Access]
      setting.
    - Now uses win_security_policy, matching sections 1 and 2.2.
  - Added check_mode: false to the read-only tasks that register a variable.
    - The interactive user hives, the 1.2.1 reconcile read, 2.2.31, the two 2.3.10.9 feature checks,
      and both section 5 spooler checks.
    - Without it a --check run skipped the read, and the next task dereferenced .stdout on a
      skipped result. The play aborted in the prelim on every host.
  - Removed the domain member gate from 2.2.11, which contradicted the benchmark and the role itself.
  - Changed Exchange, IIS and Hyper-V dynamic discovery
  - 2.2.3 and 2.2.22 are skipped while win_skip_for_test is true, its default. See defaults/main/main.yml.
  - 2.3.5.4 warns that the Default Domain Controllers Policy reverts it on a domain controller
  - 2.3.6.1 - 2.3.6.6 and 5.2 are skipped on every domain controller, not only the primary
  - 2.3.10.8 and 2.3.10.9 path values written in the benchmark's case
  - 2.3.17.2 warns on an invalid consent prompt value instead of writing it
  - 17.2.4 addresses its audit subcategory by GUID, not by its localised name
  - 18.4.4 writes EnableCertPaddingCheck under the native path only
    - Removed the Wow6432Node task, which never ran: its condition compared ansible_facts['architecture']
      with x86_64 and AMD64, and Windows reports that fact as 64-bit
  - 18.9.25.2 writes the Windows LAPS value name PasswordExpirationProtectionEnabled
    - Was the legacy LAPS name PwdExpirationProtectionEnabled, which Windows LAPS does not read
  - Removed the duplicate 18.10.43.11.1.1.2 task, which ran the control twice
  - Registry paths and value names use the case Windows-2025-CIS uses, such as CurrentControlSet and AllowLLTDIOOnDomain

## Release 4.2

July 2026
  - 2.2.22 has been updated to reflect the correct values in remediation and the GPO creation (Guests and S-1-5-114) Thanks -Evil-

## Release 4.1.0

April 2026

  - Updated the cloud based system check for manual overrides. New variable now in the default main. Please read the comments for the new variable. 
  - Updated 18.10.57.3.10.1 variable accept anything between 1 and 900000 in Hardening & GPO.
  - Updated Section 2 GPO for win_skip_for_test controls. Read comments in default/main.
  - Issues Addressed:
    - [#107](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/107) - Thanks @kpi-nourman  
    - [#122](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/122) - Thanks @kpi-nourman
    - [#124](https://github.com/ansible-lockdown/Windows-2019-CIS/issues/124) - Thanks @IoannisPant
    - [#2](https://github.com/ansible-lockdown/Windows-2025-CIS/issues/2) - Thanks @davidstanaway (Windows 2025 Issue Added Here To Update 2019)
    - [#7](https://github.com/ansible-lockdown/Windows-2025-CIS/issues/7) - Thanks @R2J2 - Updated When Statement to take into account Bool now (Windows 2025 Issue Added Here To Update 2019)
    - [#86](https://github.com/ansible-lockdown/Windows-2022-CIS/issues/86) - Thanks @git-cgallagher (Windows 2022 Issue Added Here To Update 2019)
    - [#84](https://github.com/ansible-lockdown/Windows-2022-CIS/issues/84) - Thanks @Randriy-bulynko (Windows 2022 Issue Added Here To Update 2019)
    - [#87](https://github.com/ansible-lockdown/Windows-2022-CIS/issues/87) - Thanks @Randriy-bulynko (Windows 2022 Issue Added Here To Update 2019)
    - [#83](https://github.com/ansible-lockdown/Windows-2022-CIS/issues/83) - Thanks @exu-g (Windows 2022 Issue Added Here To Update 2019)
  - PR's Addressed:
    - [#3](https://github.com/ansible-lockdown/Windows-2025-CIS/pull/3) - Thanks @MatthieuLeboeuf 

## Release 4.0.0

September 2025
  - This Release is based on CIS Benchmark v4.0.0
  - Internal 90 Auto Promotion Workflows Added
  - PR's Addressed:
    - [#79](https://github.com/ansible-lockdown/Windows-2022-CIS/pull/79/files) - Thanks @ShawnHardwick This applied here as well. Great Catch!
  - CIS Control Changes Summary (v4.0.0 vs v3.0.0) - Please review them in the CIS documentation and adjust your playbooks.
    - Added (New In v4.0.0)
      - 18.6.4.1
      - 18.6.4.3
      - 18.7.8
      - 18.10.18.4
      - 18.10.18.6
      - 18.10.18.7
      - 18.10.29.2
      - 18.10.43.4.1
      - 18.10.43.8.1
      - 18.10.43.10.1
      - 18.10.43.11.1.1.1
      - 18.10.43.11.1.1.2
      - 18.10.43.11.1.2.1
      - 18.10.43.13.1
      - 18.10.43.13.4
      - 18.10.43.17
      - 18.10.58.2
    - Updated
      - 2.2.38 - Title Update
      - 2.3.6.5 - Updated Entire Task To Use Registry
      - 2.3.11.8 - Added Variable
      - 2.3.10.6 - Title Update
      - 2.3.10.7 - Title Update
      - 2.3.10.8 - Title Update
      - 2.3.10.9 - Title Update
      - 2.3.10.10 - Title Update
      - 19.7.8.3 - Updated to L2 In Remediate
      - 19.7.8.4 - Updated to L2 In Remediate
      - 18.4.4 - Updated to include 32-bit subsystem on 64-bit OS
      - 18.4.7 - Updated Variable Checks
      - 18.10.18.1 - Updated to L2 In Remediate / GPO
    - Re-Numbered / Moved
      - 2.3.1.2 v3.0.0 → 2.3.1.1 v4.0.0
      - 2.3.1.3 v3.0.0 → 2.3.1.2 v4.0.0
      - 2.3.1.4 v3.0.0 → 2.3.1.3 v4.0.0
      - 2.3.1.5 v3.0.0 → 2.3.1.4 v4.0.0
      - 19.7.42.1 v3.0.0 → 19.7.44.1 v4.0.0
      - 18.4.3 v3.0.0 → 18.4.2 v4.0.0
      - 18.4.4 v3.0.0 → 18.4.3 v4.0.0
      - 18.4.5 v3.0.0 → 18.4.4 v4.0.0
      - 18.4.6 v3.0.0 → 18.4.5 v4.0.0
      - 18.4.7 v3.0.0 → 18.4.6 v4.0.0
      - 18.4.8 v3.0.0 → 18.4.7 v4.0.0
      - 18.4.9 v3.0.0 → 18.4.8 v4.0.0
      - 18.6.4.1 v3.0.0 → 18.6.4.2 v4.0.0
      - 18.6.4.2 v3.0.0 → 18.6.4.4 v4.0.0
      - 18.7.8 v3.0.0 → 18.7.9 v4.0.0
      - 18.7.9 v3.0.0 → 18.7.10 v4.0.0
      - 18.7.10 v3.0.0 → 18.7.11 v4.0.0
      - 18.7.11 v3.0.0 → 18.7.12 v4.0.0
      - 18.10.3.1 v3.0.0 → 18.10.4.1 v4.0.0
      - 18.10.5.1 v3.0.0 → 18.10.6.1 v4.0.0
      - 18.10.7.1 v3.0.0 → 18.10.8.1 v4.0.0
      - 18.10.8.1.1 v3.0.0 → 18.10.9.1.1 v4.0.0
      - 18.10.10.1 v3.0.0 → 18.10.11.1 v4.0.0
      - 18.10.12.x v3.0.0 → 18.10.13.x v4.0.0
      - 18.10.13.x v3.0.0 → 18.10.14.x v4.0.0
      - 18.10.14.x v3.0.0 → 18.10.15.x v4.0.0
      - 18.10.15.x v3.0.0 → 18.10.16.x v4.0.0
      - 18.10.17.x v3.0.0 → 18.10.18.x v4.0.0
      - 18.10.25.x.x v3.0.0 → 18.10.26.x.x v4.0.0
      - 18.10.28.x v3.0.0 → 18.10.29.x v4.0.0
      - 18.10.36.x v3.0.0 → 18.10.37.x v4.0.0
      - 18.10.40.x v3.0.0 → 18.10.41.x v4.0.0
      - 18.10.41.x v3.0.0 → 18.10.42.x v4.0.0
      - 18.10.42.x.x v3.0.0 → 18.10.43.x.x
      - 18.10.50.x v3.0.0 → 18.10.51.x v4.0.0
      - 18.10.55.x v3.0.0 → 18.10.56.x v4.0.0
      - 18.10.56.x v3.0.0 → 18.10.57.x v4.0.0
      - 18.10.57.x v3.0.0 → 18.10.58.x v4.0.0
      - 18.10.58.x v3.0.0 → 18.10.59.x v4.0.0
      - 18.10.62.x v3.0.0 → 18.10.63.x v4.0.0
      - 18.10.75.x v3.0.0 → 18.10.76.x v4.0.0
      - 18.10.79.x v3.0.0 → 18.10.80.x v4.0.0
      - 18.10.80.x v3.0.0 → 18.10.81.x v4.0.0
      - 18.10.81.x v3.0.0 → 18.10.82.x v4.0.0
      - 18.10.86.x v3.0.0 → 18.10.87.x v4.0.0
      - 18.10.88.x v3.0.0 → 18.10.89.x v4.0.0
      - 18.10.89.x v3.0.0 → 18.10.90.x v4.0.0
      - 18.10.91.x v3.0.0 → 18.10.92.x v4.0.0
      - 18.10.92.x v3.0.0 → 18.10.93.x v4.0.0
    - Removed
      - 18.10.43.17 v3.0.0 Removed In v4.0.0
      - 18.10.15.8 v3.0.0 Removed In v4.0.0
      - 18.4.2 v3.0.0 Removed In v4.0.0
      - 18.4.9 v3.0.0 Removed In v4.0.0
      - Control 2.3.1.5 Removed from default main In v4.0.0
      - 2.3.1.1: Accounts: Block Microsoft accounts removed; all controls in the section shifted up In v4.0.0
    - Structural Changes
      - Section 17: Credential Validation auditing now uses the GUID {0CCE923F-69AE-11D9-BED3-505054503030}
        - This makes auditing language-agnostic and more consistent across regional builds.
  - PR's Addressed:
    - [#79](https://github.com/ansible-lockdown/Windows-2022-CIS/pull/79/files) - Thanks @ShawnHardwick

June 2025 Update
  - Prepared for v4.0.0 Release
  - Add new benchmark tracking workflows.

## Release 3.1.1

May 2025 Update
  - Fixed Control 18.6.14.1 For Missing RequirePrivacy=1 in Ansible Hardening And title. - Thanks @mfortin
  - Updated 18.10.56.3.10.2 value to 60000 from 6000 in remediate and GPO - Thanks @mfortin
  - Updated 18.10.80.2 Path In Remediate - Thanks @mfortin
  - Updated 18.10.92.4.1 ManagePreviewBuildsPolicyValue to 1. - Thanks @mfortin
  - Updated Pipelines Branches Trigger
  - Updated Readme with New Badges
  - Fixed Tags from _ to . in the control numbers to align with other controls.

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
