FROM mcr.microsoft.com/mssql/server:2019-CU15-ubuntu-20.04

USER root

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=aseosas123#

COPY /docker/sqlserver/DBScript.sql DBScript.sql
COPY /docker/sqlserver/setup_database.sh setup_database.sh
COPY /docker/sqlserver/entrypoint.sh entrypoint.sh

EXPOSE 1433

RUN chmod +x entrypoint.sh
RUN chmod +x setup_database.sh

CMD /bin/bash ./entrypoint.sh