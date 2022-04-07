FROM sonarsource/sonar-scanner-cli:4.6

LABEL maintainer="teake.nutma@gmail.com"
LABEL description="SonarScanner + other utils"

RUN apk add --no-cache curl jq \
    # We need at least pylint 2.13.5 to fix https://github.com/PyCQA/pylint/issues/6089
    && pip install pylint --upgrade \
    && pip install coverage-fixpaths pylint-sonarjson
