FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

LABEL dev.containers.features="common"

RUN mkdir -p ~/tmp/texlive \
    && cd ~/tmp/texlive \
    && wget --no-check-certificate https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && zcat < install-tl-unx.tar.gz | tar xf - \
    && cd $(ls -d install-tl-* | head -n 1) \
    && perl ./install-tl --no-interaction --repository https://ctan.math.washington.edu/tex-archive/systems/texlive/tlnet \
    && rm -rf ~/tmp

RUN latest_texlive_path="$(ls -d /usr/local/texlive/[0-9]* | sort -n | tail -1)/bin/x86_64-linux" \
    && echo "export PATH=\'$latest_texlive_path:\$PATH\'" >> ~/.bashrc \
    && echo "export PATH=\'$latest_texlive_path:\$PATH\'" >> ~/.zshrc \
    && echo "export PATH=\'$latest_texlive_path:\$PATH\'" >> ~/.profile \
    && env PATH=$PATH $latest_texlive_path/tlmgr path add \
    && $latest_texlive_path/tlmgr init-usertree

COPY fonts /usr/share/fonts/chinese

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*