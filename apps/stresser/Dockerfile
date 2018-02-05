FROM fedora

RUN dnf update -y; dnf install -y stress

ENTRYPOINT ["sh", "-c", "while true; do echo hello; sleep 10;done"]

# RUN stress --cpu 2 --io 1 --vm 1 --vm-bytes 128M
