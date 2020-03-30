FROM python:$INPUT_PYTHON_VERSION

RUN pip install --no-cache-dir bandit

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
