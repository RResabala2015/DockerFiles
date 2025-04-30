## How to Run SonarQube with Docker

This guide explains how to set up and run SonarQube Community Edition 9.9.8 using Docker, with a PostgreSQL database as the backend.

### Prerequisites
- Docker installed on your system.
- Docker Compose installed.

### Steps to Run

1. **Start the containers** by running the following command in the directory where the `compose.yml` file is located:

    ```bash
    docker compose up -d
    ```

2. **Access SonarQube**:
    - Open your browser and navigate to `http://localhost:9000`.

### Default Credentials

- **Username**: admin  
- **Password**: admin  

> **Note**: For security reasons, it is recommended to change the default password after the first login.

### Data Persistence

The following volumes are used to persist data:
- `postgres_data`: Stores PostgreSQL database data.
- `sonarqube_data`: Stores SonarQube application data.
- `sonarqube_logs`: Stores SonarQube logs.
- `sonarqube_extensions`: Stores SonarQube plugins and extensions.

### Stopping the Containers

To stop the containers, run:

```bash
docker-compose down
```

This will stop and remove the containers but retain the data in the volumes.

### Additional Notes

- Ensure that the ports `9000` and `5432` are not in use by other applications.
- Adjust the volume paths and environment variables as needed for your setup.
- For more information, refer to the [SonarQube documentation](https://docs.sonarqube.org/).