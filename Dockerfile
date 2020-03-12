FROM sonarsource/sonar-scanner-cli:latest

LABEL maintainer="teake.nutma@gmail.com"
LABEL description="SonarScanner + other utils"

USER root

ENV LANG=C.UTF-8

RUN apt update && apt-get install -y curl jq python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    # We can't use the latest pylint and astroid releases because those have an infinite recursion bug.
    # So we'll just grab (at the time of writing) latest commits of the master branches.
    && pip3 install git+git://github.com/PyCQA/astroid.git@252dd194944c0a4d64678d4ea8cc69c412b7a640 \
    && pip3 install git+git://github.com/PyCQA/pylint.git@5d63f2a13c7aea499ae648fb00d86b43f24a9ba2

USER scanner-cli
