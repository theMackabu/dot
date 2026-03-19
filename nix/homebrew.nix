{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
  
    taps = [
      "charmbracelet/tap"
      "dante-biase/x2x"
      "encoredev/tap"
      "gromgit/fuse"
      "jandedobbeleer/oh-my-posh"
      "kdabir/tap"
      "keith/formulae"
      "louisbrunner/valgrind"
      "majd/repo"
      "modularml/packages"
      "ngrok/ngrok"
      "paninihouse/brewer-cmd"
      "pkgxdev/made"
      "pls-rs/pls"
      "plutov/tap"
      "rvigo/cl"
      "supabase/tap"
      "unhappychoice/tap"
      "withgraphite/tap"
      "xenodium/macosrec"
      "xwmx/taps"
    ];
  
    brews = [
      "charmbracelet/tap/crush"
      "encoredev/tap/encore"
      "keith/formulae/dyld-shared-cache-extractor"
      "pls-rs/pls/pls"
      "withgraphite/tap/graphite"
      "macos-trash"
      "mas"
      "hfsutils"
      "mtools"
      "build2"
      "edencommon"
      "eget"
      "felinks"
      "gitlogue"
      "has"
      "msedit"
      "mvfst"
      "oak"
      "picotool"
      "pkgx"
      "rubyfmt"
      "so"
      "sshs"
      "superfile"
      "supabase"
      "tre-command"
      "walk"
    ];
  
    casks = [
      "android-platform-tools"
      "asset-catalog-tinkerer"
      "background-music"
      "codex"
      "gcc-arm-embedded"
      "ipatool"
      "jd-gui"
      "macfuse"
      "ngrok"
      "oq"
      "quarto"
      "swiftdefaultappsprefpane"
      "xquartz"
    ];
  };
}
