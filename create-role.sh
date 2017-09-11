#!/bin/bash
#
# Autor: Maximilian Sparenberg


verzeichnisse=(files templates tasks handlers vars defaults meta)
echo "Name der Rolle: "
read rolle

mkdir roles/$rolle

for verzeichnis in ${verzeichnisse[*]}
  do mkdir roles/$rolle/$verzeichnis
done

cat > $rolle.yml <<EOF
---
- hosts:
    vars_prompt:
    - name: "test_variabel"
      prompt: "Variabel eingeben:"

    roles:
    - $rolle
EOF

cat > roles/$rolle/meta/main.yml <<EOF
---
dependencies: []
EOF

cat > roles/$rolle/handlers/main.yml <<EOF
---
- name: Dienst neu starten
  service: name=sshd state=restarted
EOF

cat > roles/$rolle/tasks/main.yml <<EOF
---
- include: updates.yml
EOF

cat > roles/$rolle/tasks/updates.yml <<EOF
---
- name: Updates installieren
  yum: name=* state=latest
EOF

cat > roles/$rolle/templates/test.j2 <<EOF
{{test_variabel}}
EOF
