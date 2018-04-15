---
- name: Ping all hosts
  hosts: all
  connection: local
  gather_facts: no
  tasks:
  - name: Ping hosts
    ping:

