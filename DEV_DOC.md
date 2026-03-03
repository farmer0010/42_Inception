# Developer Documentation

This document explains the technical setup and maintenance of the Inception infrastructure.

## Environment Setup from Scratch
1. Ensure Docker, Docker Compose, and Make are installed on your Linux virtual machine.
2. Clone the repository.
3. Prepare the `.env` file inside the `srcs/` directory. It must contain the following variables:
   - `MYSQL_DATABASE`, `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_ROOT_PASSWORD`
4. The physical data directories must be created on the host machine before launching:
   ```bash
   mkdir -p /home/juyoukim/data/mariadb
   mkdir -p /home/juyoukim/data/wordpress