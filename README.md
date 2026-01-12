# Isaac Sim 5.1.0 Docker (Headless + Optional Streaming)

이 레포는 Isaac Sim 5.1.0을 Docker로 실행하기 위한 최소 구성입니다.  
`run_docker.sh`로 캐시/로그/데이터 디렉터리를 준비하고 컨테이너를 올립니다.

## 요구사항
- Host OS: Ubuntu 22.04
- NVIDIA 드라이버 설치
- NVIDIA Container Toolkit 설치

### NVIDIA Container Toolkit 설치
```bash
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
GPU 정상 동작 확인
bash

docker run --rm --gpus all nvidia/cuda:12.2.0-base-ubuntu22.04 nvidia-smi
빠른 시작 (권장)
bash

./run_docker.sh
run_docker.sh가 하는 일:

BASE_DIR 기준으로 캐시/로그/데이터 디렉터리 생성
BASE_DIR 권한을 1234 (line 1234)로 변경
docker compose up -d --build isaac-sim 실행
환경변수 (선택)
bash

export BASE_DIR="$HOME/docker/isaac-sim"   # 기본값
export OMNI_KIT_WEBRTC_ENABLE=True
export OMNI_KIT_STREAMING_ENABLE=True
export DISPLAY=:0                          # GUI 사용 시
수동 실행
bash

BASE_DIR=$HOME/docker/isaac-sim docker compose up -d --build isaac-sim
컨테이너 접속
bash

docker exec -it isaac-sim bash
테스트
컨테이너 내부에서:

bash

./scripts/run_tests.sh
구성 파일
docker-compose.yaml: Isaac Sim 컨테이너 정의 (GPU, host 네트워크)
docker/isaac/Dockerfile: Isaac Sim 5.1.0 이미지 빌드
run_docker.sh: 실행 스크립트
run_tests.sh: 스모크 테스트
볼륨 마운트
모든 데이터는 BASE_DIR 아래에 생성됩니다.

cache/main → /isaac-sim/.cache
cache/computecache → /isaac-sim/.nv/ComputeCache
logs → /isaac-sim/.nvidia-omniverse/logs
config → /isaac-sim/.nvidia-omniverse/config
data → /isaac-sim/.local/share/ov/data
pkg → /isaac-sim/.local/share/ov/pkg
필수 환경변수
컨테이너 내부에서 Isaac Sim이 실행되기 위해 아래가 필요합니다.

ACCEPT_EULA=Y
PRIVACY_CONSENT=Y
(둘 다 docker-compose.yaml에 설정되어 있습니다.)

트러블슈팅
permission/폴더 마운트 문제
bash

sudo chown -R 1234:1234 "$BASE_DIR"
GPU 미인식
nvidia-smi가 정상 출력되는지 확인
nvidia-container-toolkit 설정 확인
Streaming/WebRTC
run_docker.sh에서 기본으로 OMNI_KIT_WEBRTC_ENABLE=True, OMNI_KIT_STREAMING_ENABLE=True가 설정됩니다.
필요 없으면 run_docker.sh에서 false로 변경하거나 환경변수로 덮어쓰세요.


