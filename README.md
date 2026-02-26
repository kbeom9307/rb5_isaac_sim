# Isaac Sim 5.1.0 Docker

간단하게 Isaac Sim 5.1.0을 Docker로 실행하는 저장소입니다.
A minimal Docker setup to run Isaac Sim 5.1.0.

## Quick Start

```bash
./run_docker.sh
```

## BASE_DIR (중요 / Important)

- 기본값(Default): **repo 경로**
- `BASE_DIR`가 없으면 `run_docker.sh`가 자동 생성합니다.
- `docker-compose.yaml` 볼륨 마운트는 `${BASE_DIR}` 기준입니다.

Default behavior:
- `BASE_DIR` defaults to the **repository path**.
- If it does not exist, `run_docker.sh` creates it.
- Volume mounts in `docker-compose.yaml` are based on `${BASE_DIR}`.

### Custom BASE_DIR

```bash
export BASE_DIR="$HOME/docker/isaac-sim"
./run_docker.sh
```

### Manual docker compose

```bash
BASE_DIR="$(pwd)" docker compose up -d --build isaac-sim
```

## Networking (PUBLIC_IP / Port Forwarding)

- 외부(다른 네트워크)에서 WebRTC 스트리밍 접속이 필요하면 `PUBLIC_IP`를 지정하세요.
- NAT/공유기/클라우드 환경에서는 포트포워딩(또는 보안그룹/방화벽 오픈)이 필요할 수 있습니다.

```bash
export PUBLIC_IP="<your_public_ip>"
./run_docker.sh
```

Notes:
- If clients connect from outside your LAN, set `PUBLIC_IP` to your host's reachable public address.
- In NAT/router/cloud setups, port forwarding (or security group/firewall rules) may be required.

## Requirements

- Ubuntu 22.04
- NVIDIA Driver
- NVIDIA Container Toolkit

## Check

```bash
docker ps --filter name=isaac-sim
docker exec -it isaac-sim bash
```

## Volumes

- `${BASE_DIR}/cache/main` -> `/isaac-sim/.cache`
- `${BASE_DIR}/cache/computecache` -> `/isaac-sim/.nv/ComputeCache`
- `${BASE_DIR}/logs` -> `/isaac-sim/.nvidia-omniverse/logs`
- `${BASE_DIR}/config` -> `/isaac-sim/.nvidia-omniverse/config`
- `${BASE_DIR}/data` -> `/isaac-sim/.local/share/ov/data`
- `${BASE_DIR}/pkg` -> `/isaac-sim/.local/share/ov/pkg`
