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

# Make RUN commands use `bash --login`:
# SHELL ["/bin/bash", "--login", "-c"]

COPY create_env.sh environment.yml /app/
RUN ./create_env.sh

# RUN conda init bash
# RUN echo "conda activate Template" >> ~/.bashrc

# RUN conda init
# RUN conda env export -n Template > /app/linux_env.yml


COPY Dockerfile /app/
COPY entrypoint.sh run.sh /usr/local/bin/

ENTRYPOINT ["conda", "run", "-n", "Template", "--no-capture-output","/bin/bash"]

CMD ["echo", "need to provide a command..."]

