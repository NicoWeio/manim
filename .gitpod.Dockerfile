# FROM gitpod/workspace-base:latest
FROM gitpod/workspace-full:latest

RUN sudo apt-get update -qq \
    && sudo apt-get install --no-install-recommends -y \
        ffmpeg \
        build-essential \
        gcc \
        cmake \
        libcairo2-dev \
        libffi-dev \
        libpango1.0-dev \
        freeglut3-dev \
        pkg-config \
        make \
        wget

# setup a minimal texlive installation
# COPY docker/texlive-profile.txt /tmp/
# ENV PATH=/usr/local/texlive/bin/armhf-linux:/usr/local/texlive/bin/aarch64-linux:/usr/local/texlive/bin/x86_64-linux:$PATH
# RUN wget -O /tmp/install-tl-unx.tar.gz http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
#     mkdir /tmp/install-tl && \
#     tar -xzf /tmp/install-tl-unx.tar.gz -C /tmp/install-tl --strip-components=1 && \
#     sudo /tmp/install-tl/install-tl --profile=/tmp/texlive-profile.txt \
#     && sudo tlmgr install \
#         amsmath babel-english cbfonts-fd cm-super ctex doublestroke dvisvgm everysel \
#         fontspec frcursive fundus-calligra gnu-freefont jknapltx latex-bin \
#         mathastext microtype ms physics preview ragged2e relsize rsfs \
#         setspace standalone tipa wasy wasysym xcolor xetex xkeyval

# auf gut Glück ↓
# RUN pip install wheel

# für pycairo und so ↓
RUN sudo apt-get install -y python3-dev

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/etc/poetry sudo python3
# RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python3 -
ENV PATH="/root/.poetry/bin:${PATH}"
# hier ist der Code vmtl. noch nicht ausgecheckt ↓
# RUN poetry install -E webgl_renderer
#??? ↓
# RUN source $HOME/.poetry/env
CMD ["sudo", "su"]
