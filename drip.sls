drip_repo:
  git.latest:
    - name: https://github.com/flatland/drip.git
    - target: /usr/src/drip
    - rev: master

drip_install:
  cmd.run:
    - name: make prefix=/usr/bin install
    - cwd: /usr/src/drip
    - require:
      - git: drip_repo