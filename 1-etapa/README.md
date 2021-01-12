# PROJETO BANCO DE DADOS PJC

## 1 Etapa

Partindo que já exista o Docker e Docker Compose instalados.


1 - criar as seguintes pastas:
```bash
mkdir -p /opt/docker
mkdir -p /opt/data
mkdir -p /opt/postgres

```
2 - Acessar a pasta '/opt/docker' e Copiar o arquivo docker-compose.yml para ela

3 - Executar o seguinte comando abaixo para subir os Containers
```bash
docker-compose up -d
```
4 - Após subir os containers, substitua os seguintes arquivos nas pastas pelos arquivos aqui do github conforme descrito abaixo:

4.1 - Acessar a pasta '/opt/postgres' e substituir o arquivo que está pelos seguintes arquivos que estão aqui no Git:

- pg_hba.conf
- postgresql.conf

Foi inserido no arquivo 'pg_hba.conf' a faixa de IP's 192.168.0.0/24 com direito a acessar o banco de dados;
Foi inserido no arquivo 'postgresql.conf' as alterações para que trabalhe com a melhor performance e segurança.

```bash
Configuração inserida no arquivo postgresql.conf
# DB Version: 13
# OS Type: linux
# DB Type: web
# Total Memory (RAM): 32 GB
# CPUs num: 8
# Data Storage: ssd

max_connections = 200
shared_buffers = 8GB
effective_cache_size = 24GB
maintenance_work_mem = 2GB
checkpoint_completion_target = 0.7
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
effective_io_concurrency = 200
work_mem = 10485kB
min_wal_size = 1GB
max_wal_size = 4GB
max_worker_processes = 8
max_parallel_workers_per_gather = 4
max_parallel_workers = 8
max_parallel_maintenance_workers = 4
```



