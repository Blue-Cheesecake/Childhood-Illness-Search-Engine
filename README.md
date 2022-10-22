# Childhood-Illness-Search-Engine

## How to run Program

### 1. Start Elasticsearch Server

.
.
.

### 2. Start Backend Server

1. Make server folder to be virtual environment (venv). Make sure that that current path is root of repo

```bash
$ pwd
/path/to/GitHub/Childhood-Illness-Search-Engine
$ ls
README.md  client  design  server
# if you don't already have virtualenv installed
$ pip install virtualenv
$ virtualenv server
```

2. Access server path. Install all requirements

```bash
$ cd server
$ pwd
/path/to/GitHub/Childhood-Illness-Search-Engine/server
$ pip install -r requirements.txt
```

3. Create .env file in /app/.env to store elastic password and ca certificate path
4. Run [**local**]

```bash
python3 app/app.py
```

or

```bash
python app/app.py
```

5. (**Optional**) Run [**local**] in development mode. This step require to install nodejs and nodemon package.

```bash
nodemon --exec python3 app/app.py
```
