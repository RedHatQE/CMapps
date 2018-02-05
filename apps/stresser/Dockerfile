FROM fedora

RUN dnf update -y; dnf install -y stress

ENTRYPOINT ["sh", "-c", "while true; do echo hello; sleep 10;done"]
