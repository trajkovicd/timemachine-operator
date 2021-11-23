FROM quay.io/operator-framework/ansible-operator:v1.13.0

### Required OpenShift Labels
LABEL name="Time Machine Operator" \
      vendor="SolutionSoft Systems, Inc." \
      version="v1.0" \
      release="6" \
      summary="Time Machine creates virtual clocks for time shift testing of Applications." \
      description="Time Machine enables time travel of containers running in OpenShift pods without the need for changing the system clock on any of the nodes in your OpenShift cluster." \
      url="https://solution-soft.com" \
      maintainer="Dragan Trajkovic - dtrajkovic@solution-soft.com"


COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

# Required Licenses
COPY licenses /licenses

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
