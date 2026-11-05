# Windows Server 2019 CIS

## Configure a Microsoft Server 2019 machine to be [CIS](https://www.cisecurity.org/cis-benchmarks/) compliant

### Based on [ CIS Microsoft Windows Server 2019 v4.0.0 - 06-23-2025 ](https://www.cisecurity.org/cis-benchmarks/)

---

## Public Repository

![Org Stars](https://img.shields.io/github/stars/ansible-lockdown?label=Org%20Stars&style=social)
![Stars](https://img.shields.io/github/stars/ansible-lockdown/Windows-2019-CIS?label=Repo%20Stars&style=social)
![Forks](https://img.shields.io/github/forks/ansible-lockdown/Windows-2019-CIS?style=social)
![Followers](https://img.shields.io/github/followers/ansible-lockdown?style=social)
[![X URL](https://img.shields.io/twitter/url/https/x.com/AnsibleLockdown.svg?style=social&label=Follow%20%40AnsibleLockdown)](https://x.com/AnsibleLockdown)
![Discord Badge](https://img.shields.io/discord/925818806838919229?logo=discord)

![License](https://img.shields.io/github/license/ansible-lockdown/Windows-2019-CIS?label=License)

## Lint & Pre-Commit Tools

![YamlLint](https://img.shields.io/badge/yamllint-Present-brightgreen?style=flat&logo=yaml&logoColor=white)
![Ansible-Lint](https://img.shields.io/badge/ansible--lint-Present-brightgreen?style=flat&logo=ansible&logoColor=white)

## Community Release Information

![Release Branch](https://img.shields.io/badge/Release%20Branch-Main-brightgreen)
![Release Tag](https://img.shields.io/github/v/tag/ansible-lockdown/Windows-2019-CIS?label=Release%20Tag&&color=success)
![Main Release Date](https://img.shields.io/github/release-date/ansible-lockdown/Windows-2019-CIS?label=Release%20Date)
![Benchmark Version Main](https://img.shields.io/endpoint?url=https://ansible-lockdown.github.io/github_windows_IaC/badges/Windows-2019-CIS/benchmark-version-main.json)
![Benchmark Version Devel](https://img.shields.io/endpoint?url=https://ansible-lockdown.github.io/github_windows_IaC/badges/Windows-2019-CIS/benchmark-version-devel.json)

[![Main Pipeline Status](https://github.com/ansible-lockdown/Windows-2019-CIS/actions/workflows/main_pipeline_validation.yml/badge.svg?)](https://github.com/ansible-lockdown/Windows-2019-CIS/actions/workflows/main_pipeline_validation.yml)
[![Devel Pipeline Status](https://github.com/ansible-lockdown/Windows-2019-CIS/actions/workflows/devel_pipeline_validation.yml/badge.svg?)](https://github.com/ansible-lockdown/Windows-2019-CIS/actions/workflows/devel_pipeline_validation.yml)

![Devel Commits](https://img.shields.io/github/commit-activity/m/ansible-lockdown/Windows-2019-CIS/devel?color=dark%20green&label=Devel%20Branch%20Commits)
![Open Issues](https://img.shields.io/github/issues-raw/ansible-lockdown/Windows-2019-CIS?label=Open%20Issues)
![Closed Issues](https://img.shields.io/github/issues-closed-raw/ansible-lockdown/Windows-2019-CIS?label=Closed%20Issues&&color=success)
![Pull Requests](https://img.shields.io/github/issues-pr/ansible-lockdown/Windows-2019-CIS?label=Pull%20Requests)

---

## Subscriber Release Information

![Private Release Branch](https://img.shields.io/endpoint?url=https://ansible-lockdown.github.io/github_windows_IaC/badges/Private-Windows-2019-CIS/release-branch.json)
![Private Benchmark Version](https://img.shields.io/endpoint?url=https://ansible-lockdown.github.io/github_windows_IaC/badges/Private-Windows-2019-CIS/benchmark-version.json)

[![Private Remediate Pipeline](https://img.shields.io/endpoint?url=https://ansible-lockdown.github.io/github_windows_IaC/badges/Private-Windows-2019-CIS/remediate.json)](https://github.com/ansible-lockdown/Private-Windows-2019-CIS/actions/workflows/main_pipeline_validation.yml)

![Private Pull Requests](https://img.shields.io/endpoint?url=https://ansible-lockdown.github.io/github_windows_IaC/badges/Private-Windows-2019-CIS/prs.json)
![Private Closed Issues](https://img.shields.io/endpoint?url=https://ansible-lockdown.github.io/github_windows_IaC/badges/Private-Windows-2019-CIS/issues-closed.json)

---

## Looking for support?

[Lockdown Enterprise](https://www.lockdownenterprise.com#GH_AL_WINDOWS_2019_cis)

[Ansible support](https://www.mindpointgroup.com/cybersecurity-products/ansible-counselor#GH_AL_WINDOWS_2019_cis)

### Community

Join us on our [Discord Server](https://www.lockdownenterprise.com/discord) to ask questions, discuss features, or just chat with other Ansible-Lockdown users.

### Contributing

Bug reports and feature requests are welcome from everyone. Please raise an issue.

Pull requests are accepted from approved contributors only. To be onboarded, join the [Discord Server](https://www.lockdownenterprise.com/discord) and request contributor access. See [CONTRIBUTING.md](CONTRIBUTING.md) for the full process.

---

## Caution(s)

This role **will make changes to the system** which may have unintended consequences. This is not an auditing tool but rather a remediation tool to be used after an audit has been conducted.

Check Mode is not supported! The role will complete in check mode without errors, but it is not supported and should be used with caution.

This role was developed against a clean install of the Windows 2019 Operating System. If you are implementing to an existing system please review this role for any site specific changes that are needed.

To use a release version, please point to the main branch and the relevant release for the CIS benchmark you wish to work with.

---

## Domain Members

Account Policy is domain scoped. On a domain joined host the Default Domain Policy
overwrites local `[System Access]` at every Group Policy refresh, so section 1 cannot
hold there. That is CIS's own position - on a member server, Account Policies belong
in the Default Domain Policy.

Measured on a member server after joining the domain:

| setting | applied by the role | after the domain refresh |
|---|---|---|
| MinimumPasswordLength | 14 | 7 |
| MaximumPasswordAge | 365 | 42 |
| LockoutBadCount | 5 | 0 (`net accounts`: Never) |
| LockoutDuration | 15 | removed |
| ResetLockoutCount | 15 | removed |

All 10 section 1 controls revert. Once `LockoutBadCount` is 0 Windows removes
`LockoutDuration` and `ResetLockoutCount` outright, which used to abort the play on a
second run. The role now detects a domain joined host and skips section 1 with a
warning instead.

Only the secedit backed controls are affected - registry backed controls hold. Set
section 1 from a GPO on domain members.

### Controls the domain overrides

On any host that is not standalone - a member server or a domain controller - these
are set by domain policy, so the role does not apply them and the audit reports them
as skipped, with the reason in `meta.skip_reason`. Both decide from the host itself:
the role from its prelim facts, the audit from `run_audit.ps1`, which reads
`Win32_ComputerSystem.DomainRole` and passes `win19cis_system_role` inline.

| Control | Setting | Why the domain wins | Role | Audit |
|---|---|---|---|---|
| 1.1.1 - 1.1.6 | Password policy | Default Domain Policy sets `[System Access]` | Skipped, with a warning | Skipped, with the reason |
| 1.2.1 - 1.2.4 | Account lockout policy (1.2.3 member server only) | Default Domain Policy sets `[System Access]` | Skipped, with a warning | Skipped, with the reason |
| 2.3.11.6 | Force logoff when logon hours expire | Default Domain Policy sets `ForceLogoffWhenHourExpire = 0` | Skipped, with a warning | Skipped, with the reason |
| 2.3.5.4 | LDAP server signing (domain controller only) | Default Domain Controllers Policy pins `LDAPServerIntegrity` to `1`. CIS requires `2`, so the two genuinely conflict and a local write is reverted at the next refresh | Not written, a warning instead | Expected to fail on a DC |

Set the skipped controls in the Default Domain Policy, and 2.3.5.4 in the Default
Domain Controllers Policy. On a standalone server every one of them is applied and
asserted as normal.

#### Tags describe the CIS profile, not where the task runs

A control's `level1-memberserver` / `level1-domaincontroller` tags come straight from
its Profile Applicability in the benchmark, and they never change with the host. The
`when` decides whether the task can do anything on this host. The two can disagree,
and that is deliberate.

1.2.3 is the clearest case. CIS scopes it to Level 1 Member Server, so it carries
`level1-memberserver` and not `level1-domaincontroller`. It is also an
`AllowAdministratorLockout` value in `[System Access]`, so it only holds on a
standalone server, and its `when` restricts it to one. A domain member server -
exactly the profile the tag names - therefore skips it and takes it from the Default
Domain Policy. Retagging it to match the `when` would misreport the benchmark, and
loosening the `when` to match the tag would write a value the domain reverts.

### What the role enforces on each target type

The benchmark has 433 recommendations. The role holds a task for every one of them,
but CIS scopes many to a single profile, and Windows scopes Account Policy to the
domain. Counting only the host facts the prelim sets and the profile defaults - not
the per rule toggles - a default run enforces:

| Target | Enforced by this role | Skipped: not applicable to this target | Skipped: NGWS profile off | Skipped: externally managed |
|---|---|---|---|---|
| Standalone server | 381 | 46 | 6 | 0 |
| Domain member server | 388 | 28 | 6 | 11 |
| Domain controller | 383 | 34 | 6 | 10 |

"Not applicable" means the benchmark does not apply the control to that target - the
28 skipped on a member server are the Level 1 Domain Controller controls, and the DC
skips the Member Server ones. Those are not gaps. A standalone server also skips the
Member Server controls that would cut off its remote administration or need a domain;
see [Stand-alone Servers](#stand-alone-servers).

"NGWS profile off" is the optional Next Generation Windows Security profile, which
defaults off; see [Next Generation Windows Security profile](#next-generation-windows-security-profile).

"Externally managed" is the set the role cannot make stick locally. On a member
server that is 1.1.1 - 1.1.6, 1.2.1 - 1.2.4 and 2.3.11.6. A domain controller
is the same list less 1.2.3, which CIS scopes to member servers only. Every one of
these is a `[System Access]` value: a domain controller has no local account database
for domain accounts, and on a member server the Default Domain Policy overwrites the
local value at the next Group Policy refresh. A local `secedit` write is not a
partial fix on either - it is a no-op that reports `changed`.

There is one remediation path for these, and it is the Default Domain Policy - see
[Group Policy Objects](#group-policy-objects).
A clean run of this role against a domain controller is not evidence that those ten
controls are enforced; it reports them as skipped, with the reason, and the audit
does the same.

---

## Matching A Security Level For CIS

It is possible to only run level 1 or level 2 controls for CIS as well as other profile definitions that are set in the CIS release.
This is managed using tags:

- level1-domaincontroller
- level1-memberserver
- level2-domaincontroller
- level2-memberserver
- ngws-domaincontroller
- ngws-memberserver

The controls found in defaults main also need to reflect this, as they control the testing that takes place if you are using the audit component.

### Next Generation Windows Security profile

Next Generation Windows Security (NGWS) is an optional CIS profile, not a third level.
Its seven controls - 18.9.5.x Device Guard and Credential Guard - run only when
`win19cis_ngws` is true (default false, in `defaults/main/main.yml`), and the audit
asserts them on the same switch, so the two always agree. They need virtualization
based security support on the host, so turn it on deliberately. The ngws tags select
within the profile; they do not enable it on their own.

## Stand-alone Servers

The benchmark is written for domain joined servers and says it is not intended for
standalone or workgroup systems. This role still runs on one, and treats it as a member
server wherever that is safe: 16 of the member server (MS only) controls apply to any
server that is not a domain controller.

The rest stay member server only:

- 2.2.22, 2.2.27 and 18.4.1 deny or filter network and Remote Desktop logon for local
  accounts. On a standalone server every account is local, so applying them cuts off
  remote administration - the benchmark carries that caution.
- LAPS (18.9.25.x), the Netlogon secure channel (2.3.6.1, 2.3.6.2), cached domain logons
  (2.3.7.6), domain controller unlock (2.3.7.8), 2.3.9.5, 18.6.21.2 and 18.9.28.4 need a
  domain to mean anything.

Section 1 account policy is applied on a standalone server only; on a domain member the
Default Domain Policy owns it.

## Coming From A Previous Release

A CIS release always contains changes, so it is highly recommended to review the new references and available variables. These have changed significantly since the ansible-lockdown initial release.
This is now compatible with python3 if it is found to be the default interpreter. This does come with prerequisites, which it configures on the system accordingly.

Further details can be seen in the [Changelog](./ChangeLog.md)

## Group Policy Objects

This role applies the benchmark directly to the host it runs against. It does not
create Group Policy Objects.

### GPOs are being addressed currently and will reside in a new repository once released.

### Migrating from the in-role GPO path

GPO creation used to live in this role behind `win19cis_create_gpos`. It has been
removed, along with the variables below. Until the new repository is released, set
the controls this role reports as skipped in the Default Domain Policy and the
Default Domain Controllers Policy.

| Removed from this role | Notes |
|---|---|
| `win19cis_create_gpos` | Dropped. This role does not create GPOs, so there is nothing to switch on. |
| `win19cis_ansible_remediation` | Dropped. This role only remediates, so there is nothing to switch off. |
| `win19cis_create_domain`, `win19cis_domain`, `win19cis_safe_mode_administrator_password` | Test domain promotion. |
| `win19cis_default_domain_policy_gpo`, `win19cis_l1_dc_gpo`, `win19cis_l1_ms_gpo`, `win19cis_l2_dc_gpo`, `win19cis_l2_ms_gpo`, `win19cis_l1_dm_gpo`, `win19cis_services_dc_gpo`, `win19cis_services_ms_gpo`, `win19cis_ngws_dc_gpo`, `win19cis_ngws_ms_gpo`, `win19cis_l1_user_gpo`, `win19cis_l2_user_gpo` | Which GPOs to create. |
| The matching `*_gpo_name` variables, `win19cis_gpo_hardening_version`, `win19cis_gpo_hardening_os` | GPO naming. |
| `win19cis_copy_policy_definitions`, `win19cis_copy_cis_custom_admx_adml` | ADMX/ADML staging. |
| `win19cis_backup_custom_gpos`, `win19cis_backup_location_style` | GPO backup. |

Leaving any of these set on this role is harmless - they are simply unused.

If you harden a domain, run this role against each member server and domain
controller for the host scoped controls, and set the Account Policy controls it
reports as skipped in the Default Domain Policy.

## Auditing (beta)

**The audit component is in beta while we gather feedback.** It is usable and its
results are meaningful, and we would like to hear how it behaves on your estate.
Please raise an issue, or come and talk to us on the [Discord Server](https://www.lockdownenterprise.com/discord).
Remediation is unaffected - `run_audit` and `setup_audit` both default to `false`,
so none of this runs unless you ask for it.

This role is paired with [Windows-2019-CIS-Audit], a set of syver specs generated
from this role by `scripts/generate_windows_audit.py`, so the audit asserts what
the role actually does rather than a separately maintained restatement of it.

### Switches

| Variable | Default | Effect |
|---|---|---|
| `setup_audit` | `false` | Place the syver binary and the audit content on the host |
| `run_audit` | `false` | Run the audit before and after remediation |
| `audit_only` | `false` | Run the pre-remediation audit, then stop without remediating |
| `fetch_audit_output` | `false` | Collect the result files after the run |

```bash
# stage the binary and content, remediate nothing
ansible-playbook site.yml -e setup_audit=true

# audit the host and stop
ansible-playbook site.yml -e run_audit=true -e audit_only=true

# remediate with a before and after audit
ansible-playbook site.yml -e run_audit=true
```

### Requirements

`syver.exe` is never committed to this repository. The default
`get_audit_binary_method: download` fetches it from the public release named in
`audit_bin_version` (v0.11.1) and verifies the published SHA256. Keep that digest
set: `win_get_url` checks it, and that check is what stands between a compromised
mirror and every audited host running someone else's binary elevated. No Windows
ARM64 asset is published for v0.11.1, so `ARM64_checksum` is deliberately empty
and a download on such a host fails the lookup rather than fetching an amd64
binary.

To supply your own build instead, set `get_audit_binary_method: copy` and point
`audit_bin_copy_location` at it; it defaults to `syver-windows-amd64.exe` in this
role directory.

The audit content comes from `audit_conf_source`, which defaults to the GitHub
archive of the `Windows-2019-CIS-Audit` branch named by `audit_git_version`
(`benchmark_<benchmark_version>`).

## Documentation

- [Read The Docs](https://ansible-lockdown.readthedocs.io/en/latest/)
- [Getting Started](https://www.lockdownenterprise.com/docs/getting-started-with-lockdown#GH_AL_WINDOWS_2019_cis)
- [Customizing Roles](https://www.lockdownenterprise.com/docs/customizing-lockdown-enterprise#GH_AL_WINDOWS_2019_cis)
- [Per-Host Configuration](https://www.lockdownenterprise.com/docs/per-host-lockdown-enterprise-configuration#GH_AL_WINDOWS_2019_cis)
- [Getting the Most Out of the Role](https://www.lockdownenterprise.com/docs/get-the-most-out-of-lockdown-enterprise#GH_AL_WINDOWS_2019_cis)

## Requirements

**General:**

- Basic knowledge of Ansible. Below are some links to the Ansible documentation to help get started if you are unfamiliar with Ansible

  - [Main Ansible documentation page](https://docs.ansible.com)
  - [Ansible Getting Started](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html)
  - [Tower User Guide](https://docs.ansible.com/ansible-tower/latest/html/userguide/index.html)
  - [Ansible Community Info](https://docs.ansible.com/ansible/latest/community/index.html)
- Functioning Ansible and/or Tower installed, configured, and running. This includes all of the base Ansible/Tower configurations, needed packages installed, and infrastructure setup.
- Please read through the tasks in this role to gain an understanding of what each control is doing. Some of the tasks are disruptive and can have unintended consequences in a live production system. Also, familiarize yourself with the variables in the defaults/main/main.yml file.

**Technical Dependencies:**

- Windows 2019 - Other versions are not supported
- Python3 Ansible run environment
- passlib
- xmltodict
- pywinrm or pypsrp

## Role Variables

This role is designed so that the end user should not have to edit the tasks themselves. All customizing should be done via the defaults/main/main.yml file or with extra vars within the project, job, workflow, etc.

## Tags

There are many tags available for added control precision. Each control has its own set of tags noting what level, what OS element it relates to, whether it's a patch or audit, and the rule number. Additionally, NIST references follow a specific conversion format for consistency and clarity.

### Conversion Format for NIST References:

  1. Standard Prefix:

    - All references are prefixed with "NIST".

  2. Standard Types:

    - "800-53r5" references are formatted as NIST800-53R5 (with 'R' capitalized). Only Rev 5 is tagged.
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
        - rule_18.4.3
        - patch
        - smb
        - NIST800-171_3.4.2
        - NIST800-171_3.4.6
        - NIST800-171_3.4.7
        - NIST800-53R5_CM-6
        - NIST800-53R5_CM-7
```

### Conversion Examples in Use:
  - 800-53r5 IA-5(1)(d) NIST800-53R5_IA-5_1_d
  - 800-53r5 AC-17(2) NIST800-53R5_AC-17_2
  - 800-53r5 CM-6b. NIST800-53R5_CM-6_b
  - 800-171 3.5.2 NIST800-171_3.5.2

By maintaining this consistent tagging structure, it becomes easier to filter and manage tasks based on specific controls and compliance requirements.

## Community Contribution

We encourage you (the community) to contribute to this role. Please read the rules below.

- Your work is done in your own individual branch. Make sure to sign off (Signed-off-by) and GPG sign all commits you intend to merge.
- All community Pull Requests are pulled into the devel branch
- Pull Requests into devel will confirm your commits have a GPG signature, Signed-off-by, and a functional test before being approved
- Once your changes are merged and a more detailed review is complete, an authorized member will merge your changes into the main branch for a new release

## Pipeline Testing

uses:

- ansible-core 2.16
- ansible collections - pulls in the latest version based on requirements file
- runs the audit using the devel branch
- This is an automated test that occurs on pull requests into devel
- self-hosted runners using OpenTofu

## Local Testing

  - Ansible
    - ansible-core 2.21.0 - python 3.13

## Credits and Thanks

Massive thanks to the fantastic community and all its members.

This includes a huge thanks and credit to the original authors and maintainers.

[Windows-2019-CIS-Audit]: https://github.com/ansible-lockdown/Windows-2019-CIS-Audit
