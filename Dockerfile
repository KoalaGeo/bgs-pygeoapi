FROM geopython/pygeoapi:latest

#Install git
RUN apt-get update 
RUN apt-get install -y git

## BGS Template

RUN git clone https://github.com/BritishGeologicalSurvey/pygeoapi-skin-dashboard /pygeoapi/pygeoapi-skin-dashboard/

## BGS Config and Local Files

COPY ./content/local.config.yml /pygeoapi/local.config.yml
COPY ./content/bedrock_geology.geojson ./tests/data/bedrock_geology.geojson
COPY ./content/dykes_geology.geojson ./tests/data/dykes_geology.geojson
COPY ./content/fault_geology.geojson ./tests/data/fault_geology.geojson
COPY ./content/superficial_geology.geojson ./tests/data/superficial_geology.geojson 
COPY ./content/625k_V5_Geology_All.gpkg ./tests/data/625k_V5_Geology_All.gpkg 

ENV SCRIPT_NAME='/pygeoapi/'

EXPOSE 80
