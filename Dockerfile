FROM ruby:2.7-alpine
MAINTAINER Marnen Laibow-Koser <marnen@marnen.org>

# RUN apk --no-cache add build-base git nodejs yarn tzdata
RUN apk --no-cache add build-base nodejs yarn tzdata

ARG workdir=/heft-tracker-tool
ARG rails_port=3000

COPY docker-entrypoint-bundler.sh /
ENTRYPOINT ["/docker-entrypoint-bundler.sh"]
ENV BUNDLE_PATH=/bundle
ENV BUNDLE_BIN=/bundle/bin
ENV GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

WORKDIR ${workdir}
COPY . ${workdir}/

EXPOSE ${rails_port}
ENV PORT ${rails_port}
