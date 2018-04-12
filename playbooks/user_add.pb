---
# this is a demo of how the user commands work and how to reference salted passwords
# in vars sections.  You could also use vars_files if you like (see other examples)
# Reference: https://go.shr.lc/2qhmT5j

- name: Add my Users
  hosts: all
  gather_facts: no
  # remote_user: pi
  become: yes
  become_user: root
  vars:
    # created with:
    # python -c 'import crypt; print crypt.crypt("This is my Password", "$1$SomeSalt$")'
    # password: $1$SomeSalt$$1d2n7Q0.r54s
    password: "{{ 'password' | password_hash('sha512') }}"

  vars_prompt:
    - name: "user_name"
      prompt: "What username do you want to create?"
      default: username
      # private: no

    - name: "password2"
      prompt: "User's password"
      private: yes
      encrypt: "md5_crypt"
      confirm: yes
      salt_size: 7
      default: password

  tasks:

    # Walk through account creation, modification, and deletion
    - name: test basic user account creation
      user: name={{user_name}} comment=TsetUser group=users shell=/bin/bash createhome=yes

    # the following is just a simple example of how you don't have to include
    # the 'name' element for each task

    - user: name={{user_name}} comment=NyetUser
    - user: name={{user_name}} password={{password2}}

    # Add the user to the group uucp.  Because append=yes, the user
    # will not be removed from the groups dialout and wheel.
    - user: name={{user_name}} groups=uucp append=yes

    # Finally, remove the user.
    - name: Remove User
      user: name={{user_name}} state=absent
