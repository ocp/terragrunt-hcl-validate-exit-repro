FROM debian:bookworm-slim AS base
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl && \
    apt-get clean

FROM base AS terragrunt
ARG TARGETARCH
ARG TERRAGRUNT=0.77.22
RUN curl --fail --show-error -Lo \
  ./terragrunt \
  https://github.com/gruntwork-io/terragrunt/releases/download/v$TERRAGRUNT/terragrunt_$(uname)_$TARGETARCH
RUN chmod +x terragrunt
RUN mv terragrunt /usr/local/terragrunt

FROM debian:bookworm-slim AS tg
WORKDIR /opt/tf
COPY --from=hashicorp/terraform:1.11.4 /bin/terraform /usr/local/bin/terraform
COPY --from=terragrunt /usr/local/terragrunt /usr/local/bin/terragrunt
