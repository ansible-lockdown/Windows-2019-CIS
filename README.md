# Windows 2019 CIS

## Configure A Windows 2019 System To Be [CIS](https://www.cisecurity.org/cis-benchmarks/) Compliant

### Based on [ Microsoft Windows Server 2019 Benchmark v3.0.1 - 05-24-2024 ](https://www.cisecurity.org/cis-benchmarks/)

---

![Org Stars](https://img.shields.io/github/stars/ansible-lockdown?label=Org%20Stars&style=social)
![Stars](https://img.shields.io/github/stars/ansible-lockdown/Windows-2019-CIS?label=Repo%20Stars&style=social)
![Forks](https://img.shields.io/github/forks/ansible-lockdown/Windows-2019-CIS?style=social)
![followers](https://img.shields.io/github/followers/ansible-lockdown?style=social)
[![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/AnsibleLockdown.svg?style=social&label=Follow%20%40AnsibleLockdown)](https://twitter.com/AnsibleLockdown)

![Discord Badge](https://img.shields.io/discord/925818806838919229?logo=discord)

![Release Branch](https://img.shields.io/badge/Release%20Branch-Main-brightgreen)
![Release Tag](https://img.shields.io/github/v/tag/ansible-lockdown/Windows-2019-CIS?label=Release%20Tag&&color=success)
![Main Release Date](https://img.shields.io/github/release-date/ansible-lockdown/Windows-2019-CIS?label=Release%20Date)

[![Main Pipeline Status](https://github.com/ansible-lockdown/Windows-2019-CIS/actions/workflows/main_pipeline_validation.yml/badge.svg?)](https://github.com/ansible-lockdown/Windows-2019-CIS/actions/workflows/main_pipeline_validation.yml)

[![Devel Pipeline Status](https://github.com/ansible-lockdown/Windows-2019-CIS/actions/workflows/devel_pipeline_validation.yml/badge.svg?)](https://github.com/ansible-lockdown/Windows-2019-CIS/actions/workflows/devel_pipeline_validation.yml)
![Devel Commits](https://img.shields.io/github/commit-activity/m/ansible-lockdown/Windows-2019-CIS/devel?color=dark%20green&label=Devel%20Branch%20Commits)

![Issues Open](https://img.shields.io/github/issues-raw/ansible-lockdown/Windows-2019-CIS?label=Open%20Issues)
![Issues Closed](https://img.shields.io/github/issues-closed-raw/ansible-lockdown/Windows-2019-CIS?label=Closed%20Issues&&color=success)
![Pull Requests](https://img.shields.io/github/issues-pr/ansible-lockdown/Windows-2019-CIS?label=Pull%20Requests)

![License](https://img.shields.io/github/license/ansible-lockdown/Windows-2019-CIS?label=License)

---

## Looking For Support? 🤝

[Lockdown Enterprise](https://www.lockdownenterprise.com#GH_AL_WINDOWS_2019_cis)

[Ansible Support](https://www.mindpointgroup.com/cybersecurity-products/ansible-counselor#GH_AL_WINDOWS_2019_cis)

### Community 💬

On our [Discord Server](https://www.lockdownenterprise.com/discord) to ask questions, discuss features, or just chat with other Ansible-Lockdown users

---

## 🚨 Caution(s) 🚨

This role **will make changes to the system** which may have unintended consequences. This is not an auditing tool but rather a remediation tool to be used after an audit has been conducted.

Check Mode is not supported! 🚫 The role will complete in check mode without errors, but it is not supported and should be used with caution.

This role was developed against a clean install of the Windows 2019 Operating System. If you are implementing to an existing system please review this role for any site specific changes that are needed.

To use release version please point to main branch and relevant release for the cis benchmark you wish to work with.

## Notes 📝

There are certain settings that, while they can be enforced in the registry, cannot be managed via ADMX and ADML files in Group Policy. This can happen for a few reasons:

1. Direct Registry Settings: Some policies aren’t intended to be configurable through the Group Policy Editor but can still be applied directly in the registry. These settings may not have a corresponding policy definition in ADMX/ADML files. For example, some Microsoft security features or settings introduced in recent updates may not yet be added to the official Group Policy templates.

2. Dynamic or Unsupported Settings: Some settings are dynamic or application-specific, meaning they don’t have the static structure needed for ADMX/ADML. Group Policy might not inherently support managing these settings, or it may require specific application policies that aren't in the standard templates.

3. Context-Specific Policies: Some policies might apply only under specific user or computer contexts. Settings under certain keys, especially under Software\Policies and Software\Microsoft, may rely on the application being directly aware of and respecting the policy. When they aren’t displayed in the Group Policy Editor, it could be because the setting isn’t universally applicable.

4. Windows Version Limitations: Even if settings appear in ADMX files, they might not show up or apply consistently if the version of Windows doesn’t fully support them. This is more common for features that are slowly rolled out across builds or have dependencies.

---

## Matching A Security Level For CIS 🔐

It is possible to to only run level 1 or level 2 controls for CIS as well as other profile definitions that are set in the CIS release.
This is managed using tags:

- level1-domaincontroller
- level1-memberserver
- level2-domaincontroller
- level2-memberserver
- level1-domainmember
- ngws-domaincontroller
- ngws-memberserver

The control found in defaults main also need to reflect this as this control the testing that takes place if you are using the audit component.

## Coming From A Previous Release ⏪

CIS release always contains changes, it is highly recommended to review the new references and available variables. This have changed significantly since ansible-lockdown initial release.
This is now compatible with python3 if it is found to be the default interpreter. This does come with pre-requisites which it configures the system accordingly.

Further details can be seen in the [Changelog](./ChangeLog.md)

## CIS GPO Compliance Method (New) 🛠️

This feature allows you to create tailored Group Policy Objects (GPOs) compliant with CIS benchmarks, offering flexibility for various configurations and simplifying GPO management. The provided variables let you control which GPOs to create and how they are managed. The creation will use all the variables that are set in the default/main.yml file.

### How to Use:

1. Enable Specific GPOs: Use the variables to choose which CIS GPOs to create. This includes options for different server types and security levels. For example:

    - win19cis_l1_dc_gpo: Creates Level 1 Domain Controller GPOs.
    - win19cis_l2_ms_gpo: Creates Level 2 Member Server GPOs.
    - win19cis_l1_dm_gpo: Creates Level 1 Domain Member GPOs.
    - win19cis_ngws_dc_gpo: Creates GPOs for Next Generation Windows Servers (NGWS).
    - win19cis_l1_dm_gpo: Creates the GPOs for controls that to be applied to a DC or MS that are a part of the domain that are identified as a domain member.
    - Service-related GPOs are currently disabled by default (false) but can be enabled for future CIS updates.

2. Copy Policy Definitions:

    - win19cis_copy_policy_definitions: Set to true to automatically copy required policy definitions to the central store.
    - win19cis_copy_cis_custom_admx_adml: Copies custom CIS ADMX/ADML files for proper application of CIS settings. Default is true.

3. Test Environment Setup:

    - win19cis_create_domain: If set to true, this will automatically create and configure a test domain using prelim_create_dc_and_promote.yml.
    - win19cis_domain: Defines the test domain name (default: test.com).

4. Backup Custom GPOs:

    - win19cis_backup_custom_gpos: Automates the backup of all custom CIS GPOs created during the playbook run. Backups include timestamps for tracking.
    - win19cis_backup_location_style: Choose the backup location:

          - Ansible: Back up to the Ansible host (default path: {{ role_path }}/templates/gpo_backups).
          - Windows: Back up locally to the Windows machine (default path: C:\GPO_Backups).

## Auditing (new) 🔍

Currently, this release does not have an auditing tool that is up to date.

## Documentation 📖

- [Read The Docs](https://ansible-lockdown.readthedocs.io/en/latest/)
- [Getting Started](https://www.lockdownenterprise.com/docs/getting-started-with-lockdown#GH_AL_WINDOWS_2022_cis)
- [Customizing Roles](https://www.lockdownenterprise.com/docs/customizing-lockdown-enterprise#GH_AL_WINDOWS_2022_cis)
- [Per-Host Configuration](https://www.lockdownenterprise.com/docs/per-host-lockdown-enterprise-configuration#GH_AL_WINDOWS_2022_cis)
- [Getting the Most Out of the Role](https://www.lockdownenterprise.com/docs/get-the-most-out-of-lockdown-enterprise#GH_AL_WINDOWS_2022_cis)

## Requirements ✅

**General:**

- Basic knowledge of Ansible, below are some links to the Ansible documentation to help get started if you are unfamiliar with Ansible

  - [Main Ansible documentation page](https://docs.ansible.com)
  - [Ansible Getting Started](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html)
  - [Tower User Guide](https://docs.ansible.com/ansible-tower/latest/html/userguide/index.html)
  - [Ansible Community Info](https://docs.ansible.com/ansible/latest/community/index.html)
- Functioning Ansible and/or Tower Installed, configured, and running. This includes all of the base Ansible/Tower configurations, needed packages installed, and infrastructure setup.
- Please read through the tasks in this role to gain an understanding of what each control is doing. Some of the tasks are disruptive and can have unintended consequences in a live production system. Also, familiarize yourself with the variables in the defaults/main.yml file.

**Technical Dependencies:** ⚙️

- Windows 2019 - Other versions are not supported
- Python3 Ansible run environment
- passlib (or python2-passlib, if using python2)
- python-lxml
- python-xmltodict
- python-jmespath
- pywinrm

Package 'python-xmltodict' is required if you enable the OpenSCAP tool installation and run a report. Packages python(2)-passlib and python-jmespath are required for tasks with custom filters or modules. These are all required on the controller host that executes Ansible.

## Role Variables 📋

This role is designed so that the end user should not have to edit the tasks themselves. All customizing should be done via the defaults/main.yml file or with extra vars within the project, job, workflow, etc.

## Tags 🏷️

There are many tags available for added control precision. Each control has its own set of tags noting what level, what OS element it relates to, whether it's a patch or audit, and the rule number. Additionally, NIST references follow a specific conversion format for consistency and clarity.

### Conversion Format for NIST References:

  1. Standard Prefix:

    - All references are prefixed with "NIST".

  2. Standard Types:

    - "800-53" references are formatted as NIST800-53.
    - "800-53r5" references are formatted as NIST800-53R5 (with 'R' capitalized).
    - "800-171" references are formatted as NIST800-171.

  3. Details:

    - Section and subsection numbers use periods (.) for numeric separators.
    - Parenthetical elements are separated by underscores (_), e.g., IA-5(1)(d) becomes IA-5_1_d.
    - Subsection letters (e.g., "b") are appended with an underscore.

### Example of Tag Usage:

Below is an example of the tag section from a control within this role. Using this example, if you set your run to skip all controls with the tag smb, this task will be skipped. Conversely, you can choose to run only controls tagged with smb.

```sh
      tags:
        - level1-domaincontroller
        - level1-memberserver
        - rule_18.3.3
        - patch
        - smb
        - NIST800-171_3.4.2
        - NIST800-53_CM-6b.
        - NIST800-53R5_CM-6b.
        - NIST800-53_AC-2
        - NIST800-53R5_AC-2
        - NIST800-53R5_IA-5_1_d
        - NIST800-171_3.5.2
        - NIST800-53_AC-17_2
```

### Conversion Examples in Use:

  - 800-53r5 IA-5(1)(d) → NIST800-53R5_IA-5_1_d
  - 800-171 3.5.2 → NIST800-171_3.5.2
  - 800-53 AC-17(2) → NIST800-53_AC-17_2
  - 800-53 CM-6b. → NIST800-53_CM-6b.

By maintaining this consistent tagging structure, it becomes easier to filter and manage tasks based on specific controls and compliance requirements.

## Community Contribution 🧑‍🤝‍🧑

We encourage you (the community) to contribute to this role. Please read the rules below.

- Your work is done in your own individual branch. Make sure to Signed-off-by and GPG sign all commits you intend to merge.
- All community Pull Requests are pulled into the devel branch
- Pull Requests into devel will confirm your commits have a GPG signature, Signed-off-by, and a functional test before being approved
- Once your changes are merged and a more detailed review is complete, an authorized member will merge your changes into the main branch for a new release

## Pipeline Testing 🔄

uses:

- ansible-core 2.16.x
- ansible collections - pulls in the latest version based on requirements file
- runs the audit using the devel branch
- This is an automated test that occurs on pull requests into devel
- self-hosted runners using OpenTofu

## Local Testing 💻

  - Ansible
    - ansible-core 2.15.0 - python 3.11

## Credits and Thanks 🙏

Massive thanks to the fantastic community and all its members.

This includes a huge thanks and credit to the original authors and maintainers.
