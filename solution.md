## My solution to the openprovider's tasks

1. Dockerfile: Multi-stage build and run this application
  - ```docker build -t sbank-api .```
3. docker-compose.yml: builds app from Dockerfile and setup postgres container in brigde
  - ```docker-compose up -d```
4. .github/workflows/main.yml: GitHub Actions workflow to unit test app and then build image and push to dockerhub. Setup DOCKERHUB_USERNAME and DOCKERHUB_TOKEN in repo secrets.
  - run automatically for every push in main or tag
5. /helm dir: Helm chart to deploy the application "sbank-api" in Kubernetes
