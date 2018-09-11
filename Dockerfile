FROM debian:stretch

RUN \
	apt-get update \
	&& apt-get upgrade -y \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get install -y --no-install-recommends \
		texlive-base \
		texlive-latex-recommended \
		texlive-latex-extra \
		latexmk \
		texlive-fonts-recommended \
		texlive-fonts-extra \
		texlive-lang-french \
	&& apt-get autoclean -y \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/*
		
