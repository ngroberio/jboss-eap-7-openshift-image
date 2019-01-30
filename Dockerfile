schema_version: 1

name: "jboss-eap-7/eap71-openshift"
description: "Red Hat JBoss Enterprise Application Platform 7.1 OpenShift container image"
version: "1.4"
from: "rhel7:7-released"
labels:
    - name: "com.redhat.component"
      value: "jboss-eap-7-eap71-openshift-container"
    - name: "io.k8s.description"
      value: "Platform for building and running JavaEE applications on JBoss EAP 7.1"
    - name: "io.k8s.display-name"
      value: "JBoss EAP 7.1"
    - name: "io.openshift.expose-services"
      value: "8080:http"
    - name: "io.openshift.tags"
      value: "builder,javaee,eap,eap7"
    - name: "io.openshift.s2i.scripts-url"
      value: "image:///usr/local/s2i"
envs:
    - name: HTTPS_ENABLE_HTTP2
      value: "true"
    - name: SCRIPT_DEBUG
      description: If set to true, ensures that the bash scripts are executed with the -x option, printing the commands and their arguments as they are executed.
      example: "true"
ports:
    - value: 8443
modules:
      repositories:
          - name: cct_module
            git:
                  url: https://github.com/jboss-openshift/cct_module.git
                  ref: master
          - name: jboss-eap-modules
            git:
                  url: https://github.com/jboss-container-images/jboss-eap-modules.git
                  ref: master
          - name: jboss-eap-7-image
            git:
                  url: https://github.com/jboss-container-images/jboss-eap-7-image.git
                  ref: eap71
      install:
          - name: jboss.container.openjdk.jdk
            version: "8"
          - name: eap-7.1-latest
          - name: dynamic-resources
          - name: s2i-common
          - name: java-alternatives
          - name: os-eap-s2i
          - name: os-java-jolokia
          - name: jolokia
          - name: os-eap7-openshift
          - name: os-eap71-openshift
          - name: os-eap7-modules
          - name: os-eap71-modules
          - name: os-eap7-ping
          - name: os-eap-activemq-rar
          - name: os-java-run
          - name: os-eap-launch
          - name: os-eap7-launch
          - name: jboss.eap.logging.ext
          - name: jboss.eap.config.jgroups
          - name: jboss.eap.config.elytron
          - name: os-eap-probes
          - name: jboss-maven
          - name: os-eap-db-drivers
          - name: os-eap-sso
          - name: os-eap70-sso
          - name: os-java-hawkular
          - name: os-eap70-hawkular
          - name: os-eap-hawkular
          - name: os-eap-deployment-scanner
          - name: os-eap-extensions
          - name: openshift-layer
          - name: openshift-passwd
          - name: os-logging
          - name: jboss.container.eap.prometheus.config
            version: '7.1'
packages:
      repositories:
          - name: base
            id: rhel-7-server-rpms
          - jboss-os
      install:
          - python-requests
          - python-enum34
          - PyYAML

run:
      user: 185
      cmd:
          - "/opt/eap/bin/openshift-launch.sh"
osbs:
      repository:
            name: containers/jboss-eap-7
            branch: jb-eap-7.1-openshift-rhel-7
© 2019 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
