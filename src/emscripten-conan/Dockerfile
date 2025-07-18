ARG BASE_IMAGE
ARG BASE_TAG

FROM utkusarioglu/${BASE_IMAGE}:${BASE_TAG}

ARG ENVIRONMENT_NAME
ARG APT_PACKAGES
ARG APT_PACKAGES_SILENT
ARG PYTHON_VERSION

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG DEFAULT_USER=dev
ARG HOME_ABSPATH=/home/${DEFAULT_USER}
ARG BOOTSTAP_ABSPATH=${HOME_ABSPATH}/scripts/bootstrap

ARG VENV_NAME=main
ARG VENV_PATH=${HOME_ABSPATH}/venv/${VENV_NAME}

WORKDIR ${HOME_ABSPATH}

USER root

COPY home/ .
COPY ${ENVIRONMENT_NAME}/home .
COPY ${ENVIRONMENT_NAME}/requirements.txt requirements.txt

RUN ls -alR ${HOME_ABSPATH}

RUN ${BOOTSTAP_ABSPATH}/linux/update-apt.sh

RUN ${BOOTSTAP_ABSPATH}/c/${ENVIRONMENT_NAME}/install-clang.sh
# RUN ${BOOTSTAP_ABSPATH}/c/set-clang-ln.sh

RUN ${BOOTSTAP_ABSPATH}/linux/install-apt.sh --no-check "${APT_PACKAGES_SILENT}"

RUN ${BOOTSTAP_ABSPATH}/linux/install-apt.sh "${APT_PACKAGES}"

# RUN ${BOOTSTAP_ABSPATH}/c/set-clang-ln.sh
RUN ${BOOTSTAP_ABSPATH}/c/${ENVIRONMENT_NAME}/install-python.sh \
  ${HOME_ABSPATH} \
  ${PYTHON_VERSION} \
  ${VENV_PATH}

RUN ${BOOTSTAP_ABSPATH}/linux/clean-apt.sh

RUN ${BOOTSTAP_ABSPATH}/linux/set-permissions.sh \
  ${USER_ID} \
  ${GROUP_ID} \
  ${HOME_ABSPATH}

USER ${DEFAULT_USER}
