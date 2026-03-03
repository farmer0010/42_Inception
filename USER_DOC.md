# User Documentation

This guide explains how an end user or administrator can interact with the Inception infrastructure.

## Services Provided
- **Web Server:** A secure NGINX server handling HTTPS requests.
- **Content Management:** WordPress integrated with PHP-FPM for building and managing the website.
- **Database:** A reliable MariaDB instance storing all site data.
- **Cache (Bonus):** Redis server to optimize WordPress performance.
- **Database GUI (Bonus):** Adminer, a lightweight tool to view and edit the database via a web browser.
- **Static Website (Bonus):** A custom HTML/CSS showcase page.
- **File Transfer (Bonus):** VSFTPD server for direct file management.

## How to Start and Stop the Project
- **To Start:** Open a terminal in the root directory of the project and run `make`.
- **To Stop:** Run `make clean` to stop the containers without losing data.
- **To Completely Remove:** Run `make fclean` to stop and remove containers, networks, and all stored volumes (WARNING: Data will be lost).

## How to Access the Services
Ensure your `/etc/hosts` is configured to point `juyoukim.42.fr` to `127.0.0.1`.
- **Main Website (WordPress):** `https://juyoukim.42.fr`
- **WordPress Admin Panel:** `https://juyoukim.42.fr/wp-admin`
- **Adminer (DB GUI):** `http://juyoukim.42.fr:8080`
- **Static Website:** `http://juyoukim.42.fr` (Port 80)
- **FTP Access:** Connect to `juyoukim.42.fr` via port `21` using an FTP client.

## Manage Credentials
All sensitive credentials (passwords, usernames, DB names) are managed through a single `.env` file located at `srcs/.env`. Do not share this file publicly.

## Check Services Status
To verify that all services are running correctly, open a terminal and execute:
`docker ps`
You should see containers for `nginx`, `wordpress`, `mariadb`, `redis`, `adminer`, `website`, and `ftp` with an "Up" status.