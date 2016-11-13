FROM aliak00/ldc:1.0.0

MAINTAINER Ali Akhtarzada <ali.akhtarzada@gmail.com>

# Install libs necessary for vibe.d
RUN apt-get update -qq -y \
	&& apt-get install -y libevent-dev libssl-dev

RUN useradd --user-group --create-home --shell /bin/false app

USER app

WORKDIR /home/app/
COPY server .

RUN mkdir .dub \
	&& dub build --compiler="$D_COMPILER"
