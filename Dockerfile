FROM jupyter/datascience-notebook

USER root

# 必要なパッケージのインストールと環境のクリーンアップ
RUN apt-get update && apt-get clean

# nilmtkの環境作成とnilmtkのインストール
RUN conda create --name nilmtk-env python=3.8 --yes

# Activate environment
ENV CONDA_DEFAULT_ENV nilmtk-env

RUN echo "conda activate nilmtk-env" >> ~/.bashrc
ENV PATH /opt/conda/envs/nilmtk-env/bin:$PATH

# RUN conda install -c nilmtk nilmtk --yes
# RUN conda install -c conda-forge -c nilmtk nilmtk-contrib


WORKDIR /work