*This project has been created as part of the 42 curriculum by juyoukim.*

# Inception

## Description
This project aims to broaden knowledge of system administration by using Docker. It virtualizes a complete web infrastructure within a personal Virtual Machine using `docker-compose`. The architecture includes NGINX, WordPress, MariaDB, and several bonus services, all running on lightweight Alpine Linux containers.

### Main Design Choices & Technical Comparisons

- **Virtual Machines vs Docker:** VMs virtualize the hardware, running a full guest OS for every instance, which makes them heavy. Docker virtualizes the OS kernel, allowing containers to share the host's kernel while remaining isolated. This makes Docker significantly faster and lighter.
- **Secrets vs Environment Variables:** Environment variables are easy to configure but can be exposed in memory or logs. Docker Secrets are encrypted during transit and at rest, providing a much safer way to handle sensitive data like database passwords. (In this project, a `.env` file is used to manage variables securely outside the Git repository).
- **Docker Network vs Host Network:** Using the Host Network shares the host machine's IP and ports directly, which can cause port conflicts and security risks. A custom Docker Network (bridge) isolates the containers, allowing them to communicate securely using container names as DNS resolution without exposing internal ports to the outside world.
- **Docker Volumes vs Bind Mounts:** Bind mounts rely on the host machine's specific directory structure, which can cause cross-platform issues. Docker Volumes are entirely managed by Docker within a specific storage area, providing better data persistence, easier backup, and safer isolation from the host's core files.

## Instructions
1. Configure your local domain. Add the following line to your `/etc/hosts` file (Requires root privileges):
   `127.0.0.1 juyoukim.42.fr`
2. Create the necessary data directories on your host machine:
   `mkdir -p /home/juyoukim/data/mariadb /home/juyoukim/data/wordpress`
3. Create a `.env` file inside the `srcs` directory with your specific credentials.
4. Run the project from the root directory:
   `make`

## Resources
- [Docker Official Documentation](https://docs.docker.com/)
- [NGINX Official Documentation](https://nginx.org/en/docs/)
- [Alpine Linux Wiki](https://wiki.alpinelinux.org/)
- **AI Usage:** AI (LLM) was utilized as an interactive study assistant to quickly find relevant official documentation (such as Alpine Linux package management and NGINX TLS setup), grasp complex Docker networking concepts, and format the markdown files. No code was directly generated or copy-pasted from AI; all Dockerfiles, scripts, and configurations were manually written, tested, and fully understood by the author.