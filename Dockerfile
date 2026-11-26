FROM apache/airflow:3.4.0-python3.13

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir \
    "apache-airflow==$(python -c 'import airflow; print(airflow.__version__)')" \
    -r /tmp/requirements.txt

COPY --chown=airflow:0 --chmod=755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
