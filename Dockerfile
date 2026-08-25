FROM apache/airflow:2.7.0-python3.10

# Instala as dependências de Python
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Copia as pastas do seu projeto para dentro da imagem
COPY --chown=airflow:root dags/ /opt/airflow/dags/
COPY --chown=airflow:root dbt/ /opt/airflow/dbt/
