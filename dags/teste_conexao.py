from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import duckdb
import os

def testar_duckdb():
    # Tenta criar uma tabela temporária apenas para testar o motor
    con = duckdb.connect(database=':memory:')
    res = con.execute("SELECT 'DuckDB está funcionando!' as msg").fetchone()
    print(f"SUCESSO: {res[0]}")
    
    # Testa se enxerga as variáveis do SeaweedFS (S3)
    endpoint = os.getenv('S3_ENDPOINT')
    print(f"Endpoint do SeaweedFS configurado: {endpoint}")

with DAG(
    'dag_teste_inicial',
    start_date=datetime(2023, 1, 1),
    schedule_interval=None,
    catchup=False
) as dag:

    task_teste = PythonOperator(
        task_id='validar_ambiente',
        python_callable=testar_duckdb
    )
