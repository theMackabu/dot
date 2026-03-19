{ pkgs, lib, self, inputs, username, hostname, ... }: {
  nix.channel.enable = false;
  nixpkgs.config.allowUnfree = true;
  
  system.stateVersion = 6;
  system.primaryUser = username;
  system.configurationRevision = self.rev or self.dirtyRev or null;
  
  users.users.${username}.name = username;
  security.pam.services.sudo_local.touchIdAuth = true;
  
  environment.pathsToLink = lib.mkForce [
    "/bin"
    "/share/zsh"
    "/share/man"
    "/share/terminfo"
    "/share/locale"
  ];

  programs.zsh.interactiveShellInit = ''
    fpath=(/usr/local/share/zsh/site-functions $fpath)
  '';
  
  environment.shellAliases = {
    rebuild = "nix develop /etc/nix-darwin --command apply";
    nix-list = "nix-store -q --references /run/current-system/sw | sed 's|/nix/store/[a-z0-9]*-||' | sort -u";
    nix-size = "nix path-info --json --json-format 1 --all | jq -r 'map(.narSize) | add | @text' | numfmt --to=iec --suffix=B";
  };
  
  environment.etc."php-fpm.conf".text = ''
    [global]
    error_log = /tmp/php-fpm.log
  
    [www]
    user = ${username}
    group = staff
    listen = 127.0.0.1:9000
    pm = dynamic
    pm.max_children = 5
    pm.start_servers = 2
    pm.min_spare_servers = 1
    pm.max_spare_servers = 3
  '';
  
  launchd.daemons.php-fpm = {
    serviceConfig = {
      Label = "org.nixos.php-fpm";
      ProgramArguments = [
        "${pkgs.php}/bin/php-fpm"
        "--nodaemonize"
        "--fpm-config" "/etc/php-fpm.conf"
      ];
      KeepAlive = true;
      RunAtLoad = true;
      StandardErrorPath = "/tmp/php-fpm.log";
    };
  };
  
  determinateNix = {
    enable = true;
    customSettings = {
      eval-cores = 0;
      extra-experimental-features = [ "build-time-fetch-tree" ];
    };
  };
}