smartctl-snmp-mib
=================

There is no standard IETF or IEEE maintained SNMP MIB formalising the structure of harddisk SMART data. Unfortunately, neither the net-analyzer/net-snmp or sys-apps/smartmontools packages provide such a MIB file either.

The snmp-mibs/smartctl-snmp-mib package aims to rectify this by providing the Hacking Networked Solutions SMARTCTL-MIB. This MIB file describes a standard format for harddisk SMART data allowing remote monitoring of drive health using SNMP. Information included in the entry for each disk includes Drive Serial Number, Temperature, Reallocated Sector Count, Current Pending Sector Count, Off-line Uncorrectable Sector Count and UDMA CRC Error Count. Various drive lifetime indicators are also monitored including Read Error Rate, Seek Error Rate and Hardware ECC Recovered Rate. 

More information may be found at:

http://www.mad-hacking.net/software/agnostic/snmp-mib/smartctl-snmp-mib/index.xml
