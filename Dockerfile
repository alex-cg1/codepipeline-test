FROM centos:7

ARG GITHUB_DEPLOY_TOKEN

ENV PROJECT_ROOT /srv/codepipeline-test

COPY * ${PROJECT_ROOT}/

RUN    yum -y update                     \
    && yum -y install python-devel       \
                      python-setuptools  \
                      git                \
    && easy_install pip==9.0.1           \
                    virtualenv           \
    && virtualenv /venv2                 \
    && . /venv2/bin/activate             \
    && pip install --upgrade git+https://github.com/alex-cg1/pip-token.git  \
    && cd ${PROJECT_ROOT}                \
    && pip-token.py install -r requirements.txt
