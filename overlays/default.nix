{ inputs }:
[
  (final: prev: {
    nur = import inputs.nur {
      nurpkgs = prev;
      pkgs = prev;
    };
  })

  inputs.niri.overlays.niri;

]

