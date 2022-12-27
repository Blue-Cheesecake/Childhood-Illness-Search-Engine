# Server

This directory contains the source code for the backend of the app, which is built using [Flask](https://flask.palletsprojects.com/en/2.2.x/) and [Elasticsearch](). The backend is responsible for processing user input, searching for matches in the data, and returning results to the frontend.

The backend consists of the following components:

- A Flask server that listens for requests from the frontend and communicates with Elasticsearch.
- A data ingestion script that reads data from provided CSV files and loads it into Elasticsearch.
- A natural language processing module that normalizes user input and data before searching.

## Dependencies

The backend has the main following dependencies:

- [Flask](https://flask.palletsprojects.com/en/2.2.x/): A Python microweb framework.
- [Elasticsearch](https://www.elastic.co): A search engine.
- [Nltk](https://www.nltk.org): A library for natural language processing.
- [Pandas](https://pandas.pydata.org): A library for data manipulation and analysis.
