{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bntw";
  home.homeDirectory = "/home/bntw";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.kitty
    pkgs.gh
    pkgs.lxappearance
    pkgs.jetbrains-toolbox
    pkgs.vscode-fhs
    pkgs.tdrop
    pkgs.zellij
    pkgs.neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    pkgs.wget
    pkgs.curl
    pkgs.picom
    pkgs.sxhkd
    pkgs.polybarFull
    pkgs.rofi
    pkgs.playerctl
    pkgs.feh

    pkgs.whitesur-gtk-theme
    pkgs.whitesur-cursors
    pkgs.whitesur-icon-theme

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    
    ".script" = {
      source = config.lib.file.mkOutOfStoreSymlink ../script;
    };

    ".config/bspwm" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/bspwm;
    };

    ".config/sxhkd" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/sxhkd;
    };

    ".config/picom" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/picom;
    };

    ".config/dunst" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/dunst;
    };

    ".config/polybar" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/polybar;
    };

    ".config/rofi" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/rofi;
    };

    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/kitty;
    };

    ".xinitrc" = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/.xinitrc;
    };

  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/bntw/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mcbopomofo
    ];
  };

  programs.git = {
    enable = true;
    userEmail = "bbeenn1227@gmail.com";
    userName = "bloodnighttw";
    extraConfig.credential = {
      "https://github.com" = {
        helper = "!gh auth git-credential";
      };
      "https://gist.github.com" = {
        helper = "!gh auth git-credential";
      };
    };
  };

  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
