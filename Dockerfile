FROM 240443233507.dkr.ecr.eu-central-1.amazonaws.com/centos7cg

ARG GITHUB_DEPLOY_TOKEN

ENV PROJECT_ROOT /srv/codepipeline-test

COPY . ${PROJECT_ROOT}/


RUN    test -n "$GITHUB_DEPLOY_TOKEN" || { echo "build arg GITHUB_DEPLOY_TOKEN must be set"; exit 1; }

# TODO:    yum -y update
RUN    yum -y install python-devel       \
                      python-setuptools  \
                      git                \
    && easy_install pip==9.0.1           \
                    virtualenv           \
    && virtualenv /venv2                 \
    && . /venv2/bin/activate             \
    && cd ${PROJECT_ROOT}                \
    && ln -s ${PROJECT_ROOT}/supervisord.conf /etc  \
    && pip install supervisor            \
    && pip install --upgrade git+https://github.com/alex-cg1/pip-token.git  \
    && pip-token.py install -r requirements.txt


CMD /venv2/bin/supervisord -n
