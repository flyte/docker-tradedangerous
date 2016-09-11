FROM ubuntu:16.04

MAINTAINER Ellis Percival <docker-tradedangerous@failcode.co.uk>

RUN apt-get -q -y update
RUN apt-get -q -y install python3 python3-dev python3-setuptools git sqlite3
RUN easy_install3 pip
RUN pip3 install --upgrade setuptools requests
RUN git clone https://bitbucket.org/kfsone/tradedangerous.git

ENTRYPOINT ["python3", "tradedangerous/trade.py"]
