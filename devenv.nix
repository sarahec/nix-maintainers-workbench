{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  packages =
    with pkgs;
    [
      evcxr
      gitoxide
      jujutsu

      # Cloud tools
      git
      curl
      jq
    ]
    ++ [ inputs.openspec.packages.${pkgs.system}.default ];

  dotenv.enable = true;

  git-hooks.hooks = {
    rustfmt.enable = true;
    clippy.enable = true;
  };

  languages = {
    nix = {
      enable = true;
    };

    python = {
      enable = true;
      uv.enable = true;
    };

    rust = {
      enable = true;
      channel = "stable";
      components = [
        "rustc"
        "cargo"
        "clippy"
        "rustfmt"
        "rust-analyzer"
      ];
    };
  };
}
