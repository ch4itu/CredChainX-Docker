# CredChainX static site — Docker image

This repository contains a ready-to-build Docker image for your `index.html` web app.

## Local build (if/when you have Docker)

```bash
docker build -t credchainx:latest .
docker run -d -p 8080:80 --name credchainx credchainx:latest
# open http://localhost:8080
```

> Note: The camera-based QR scanner in your app requires **HTTPS** in most browsers.
For local testing on `http://localhost`, many browsers allow camera access; for remote access,
put Nginx behind HTTPS (reverse proxy or load balancer).

## Build & publish via GitHub Actions to GHCR (no local Docker needed)

1. Push these files to a new GitHub repository (public or private).
2. In the repo settings, enable `Actions` and ensure the default permissions include **Read and write** for `GITHUB_TOKEN` under *Workflow permissions*.
3. Create the GitHub Actions secret `IMAGE_NAME` (optional; default is `credchainx`).
4. Trigger the workflow (push to `main` or run manually).

The workflow will build and push:  
`ghcr.io/<OWNER>/<REPO>/<IMAGE_NAME>:latest`

### Pull & run (on any host with Docker or Podman)

```bash
# Docker
docker login ghcr.io -u <GITHUB_USERNAME> -p <PERSONAL_ACCESS_TOKEN or use login from CLI>
docker pull ghcr.io/<OWNER>/<REPO>/<IMAGE_NAME>:latest
docker run -d -p 8080:80 ghcr.io/<OWNER>/<REPO>/<IMAGE_NAME>:latest

# Podman
podman login ghcr.io
podman pull ghcr.io/<OWNER>/<REPO>/<IMAGE_NAME>:latest
podman run -d -p 8080:80 ghcr.io/<OWNER>/<REPO>/<IMAGE_NAME>:latest
```