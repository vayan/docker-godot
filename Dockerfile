FROM ubuntu:20.04

# To setup tzdata which is part of mono-devel
ENV DEBIAN_FRONTEND=noninteractive

ENV GODOT_VERSION "3.2.1"

RUN \
    apt update && \
    apt install -y gnupg ca-certificates wget unzip && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt update && apt install -y tzdata && ln -fs /usr/share/zoneinfo/Europe /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata && \
    apt install -y mono-devel

RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/mono/Godot_v${GODOT_VERSION}-stable_mono_linux_headless_64.zip \
    && wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/mono/Godot_v${GODOT_VERSION}-stable_mono_export_templates.tpz \
    && mkdir ~/.cache \
    && mkdir -p ~/.config/godot \
    && mkdir -p ~/.local/share/godot/templates/${GODOT_VERSION}.stable \
    && unzip Godot_v${GODOT_VERSION}-stable_mono_linux_headless_64.zip \
    && mv Godot_v${GODOT_VERSION}-stable_mono_linux_headless_64 /usr/local/bin/godot \
    && unzip Godot_v${GODOT_VERSION}-stable_mono_export_templates.tpz \
    && mv templates/* ~/.local/share/godot/templates/${GODOT_VERSION}.stable \
    && rm -f Godot_v${GODOT_VERSION}-stable_mono_export_templates.tpz Godot_v${GODOT_VERSION}-stable_mono_linux_headless_64.zip
