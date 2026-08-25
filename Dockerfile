FROM apache/airflow:2.7.0-python3.10

# Copia o requirements e instala as libs
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt
