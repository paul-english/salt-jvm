/etc/apt/sources.list.d/ubuntu-ppa-webupd8team.list:
  file.managed:
    - source: salt://jvm/etc/apt/sources.list.d/ubuntu-ppa-webupd8team.list
    - mode: 0644
  cmd.run:
    - unless: apt-key list EEA14886 | grep EEA14886
    - name: apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

/etc/oracle-java7-installer.debconf:
  file.managed:
    - source: salt://jvm/etc/oracle-java7-installer.debconf
    - mode: 0644

accept-oracle7-license:
  cmd.run:
    - unless: which java
    - name: /usr/bin/debconf-set-selections /etc/oracle-java7-installer.debconf
    - require:
      - file: /etc/oracle-java7-installer.debconf
    - require_in:
      - pkg: oracle-java7-installer

oracle-java7-installer:
  pkg.installed:
    - repo: precise
    - require:
      - file: /etc/apt/sources.list.d/ubuntu-ppa-webupd8team.list
