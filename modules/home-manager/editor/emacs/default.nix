{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    # use emacsPgtk for better integration with wayland.
    package = pkgs.emacsPgtkGcc;
    # extraPackages = epkgs: [
    #   epkgs.vterm
    # ];
  }; 
}
