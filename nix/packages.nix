{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # shells & terminal
    bash
    zsh
    tmux
    btop
    htop
    ctop
    broot
    nnn
    yazi
    
    # core
    git
    git-lfs
    git-filter-repo
    gh
    gnupg
    lazygit
    gitui
    curl
    wget
    
    # editors
    neovim
    nano
    micro
    
    # languages & runtimes
    php
    dart
    cmake
    ninja
    automake
    gnumake
    bison
    re2c
    ccache
    
    # cross-compilation
    pkgsCross.aarch64-embedded.buildPackages.gcc            # aarch64-elf-gcc / aarch64-none-elf
    pkgsCross.aarch64-embedded.buildPackages.binutils       # aarch64-elf-binutils
    pkgsCross.x86_64-embedded.buildPackages.gcc             # x86_64-elf-gcc
    pkgsCross.x86_64-embedded.buildPackages.binutils        # x86_64-elf-binutils
    pkgsCross.mingwW64.buildPackages.gcc                    # mingw-w64 (Windows)
    pkgsCross.musl64.buildPackages.gcc                      # x86_64-linux-musl (musl-cross)
    pkgsCross.aarch64-multiplatform-musl.buildPackages.gcc  # aarch64-linux-musl
    pkgsCross.aarch64-multiplatform.buildPackages.gcc       # aarch64-unknown-linux-gnu
    pkgsCross.gnu64.buildPackages.gcc                       # x86_64-unknown-linux-gnu
    
    (pkgsCross.x86_64-embedded.buildPackages.gdb.overrideAttrs (old: {
      configureFlags = (old.configureFlags or []) ++ [ "--disable-werror" ];
    }))
    
    # llvm/clang
    llvmPackages_latest.clang
    llvmPackages_latest.llvm
    llvmPackages_latest.lldb
    llvmPackages_latest.lld
    
    # python packages (pulled from python3Packages)
    (python3.withPackages (ps: with ps; [
      numpy
      pillow
      cryptography
      setuptools
    ]))
    
    # misc lang tooling
    go-task
    kotlin-language-server
    rebar3
    luarocks
    typst
    
    # infrastructure & cloud
    flyctl
    terraform
    terraform-ls
    caddy
    nginx
    redis
    mysql80
    postgresql_16
    minio-client
    vault
    rclone
    docker-compose
    docker-credential-helpers
    lima
    qemu
    dive
    
    # networking
    nmap
    masscan
    iperf3
    netcat-gnu
    socat
    websocat
    inetutils
    rtmpdump
    
    # search & text
    ack
    ripgrep
    jq
    yj
    cloc
    pandoc
    parallel
    glow
    mdcat

    # file & disk tools
    bat
    lsd
    tree
    duf
    ncdu
    pv
    binutils
    binwalk
    sleuthkit
    wimlib
    upx
    woff2
    bloaty
    cdrtools
    
    # image & media
    imagemagick
    ffmpeg
    catimg
    timg
    viu
    sox
    mpv
    atomicparsley
    
    # fun
    cowsay
    fortune
    figlet
    toilet
    lolcat
    cmatrix
    sl
    
    # security & crypto
    nmap
    gopass
    pinentry_mac
    
    # monitoring & benchmarking
    hyperfine
    wrk
    hurl
    
    # misc cli
    pay-respects
    navi
    watch
    wakeonlan
    smartmontools
    
    # nix tools
    nix-tree
    
    # libraries
    libffi
    libyaml
    gdbm
    glfw
    portaudio
    SDL2_ttf
    extra-cmake-modules
    gd
    
    # misc
    quilt
    msgpack-tools
    wtfutil
    ffuf
    dosfstools
    e2fsprogs
    nasm
    gnutar
    time
  ];
}
