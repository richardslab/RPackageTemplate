# ref https://github.com/tebeka/pythonwise/blob/master/docker-miniconda/Dockerfile
FROM ubuntu:18.04
WORKDIR /home/
# System packages 
ENV BUILDKIT_PROGRESS=plain

RUN apt-get -qq update && apt-get -qq install -y curl 

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -qq update && apt-get -qq install -y libcairo2-dev ghostscript less 

# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

WORKDIR /app

COPY create_env.sh environment.yml /app/
RUN ./create_env.sh


COPY Dockerfile /app/

ENTRYPOINT ["conda", "run", "-n", "Template", "--no-capture-output", "bash", "-c"]

CMD ["bash"]

