FROM quay.io/operator-framework/ansible-operator:latest

### Required OpenShift Labels
LABEL name="Time Machine Sidecar" \
      vendor="SolutionSoft Systems, Inc." \
      version="v1.0.1" \
      release="1" \
      summary="Time Machine creates virtual clocks for time shift testing of Applications." \
      description="Time Machine Sidecar enables time travel of containers running in Kubernetes/OpenShift pods. To time travel a pod where your application is, it is required to add a Time Machine sidecar container to that pod, or vice versa. without the need of changing the container image of the application you’re using." \
      url="https://solution-soft.com" \
      maintainer="Dragan Trajkovic - dtrajkovic@solution-soft.com"


COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

# Required Licenses
COPY licenses /licenses

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/

