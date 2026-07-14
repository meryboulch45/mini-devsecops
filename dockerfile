FROM python:3.12-slim-bookworm

# Répertoire de travail
WORKDIR /app

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

# Copier les dépendances
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code de l'application
COPY . .

# Le conteneur écoute sur le port 5000
EXPOSE 5000

# Lancer l'application
CMD ["python", "app.py"]