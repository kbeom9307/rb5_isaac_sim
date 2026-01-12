FROM nvcr.io/nvidia/isaac-sim:5.1.0

WORKDIR /workspace
COPY scripts/ /workspace/scripts/
COPY tests/ /workspace/tests/
COPY requirements.txt /workspace/requirements.txt

RUN /isaac-sim/python.sh -m pip install --no-cache-dir -r /workspace/requirements.txt

CMD ["/isaac-sim/python.sh", "/workspace/tests/isaac_api_smoketest.py"]
