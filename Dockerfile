FROM ubuntu:16.04

MAINTAINER Ellis Percival <docker-tradedangerous@failcode.co.uk>

RUN apt-get -q -y update
RUN apt-get -q -y install python3 python3-dev python3-setuptools git sqlite3
RUN easy_install3 pip
RUN pip3 install --upgrade setuptools requests
RUN cd /opt && git clone https://bitbucket.org/kfsone/tradedangerous.git
RUN cd /opt/tradedangerous && python3 trade.py import --plug=maddavo -O=csvs
RUN mv /opt/tradedangerous/data /opt/tradedangerous/data_initial
RUN mkdir /opt/tradedangerous/data
VOLUME /opt/tradedangerous/data

ENTRYPOINT ["python3", "/opt/tradedangerous/trade.py"]
CMD ["import", "--plug=maddavo", "-O=csvs"]
