{
  description = "Hugo isolated development environment for myBlog";

  inputs = {
    # Using nixos-unstable ensures you get the absolute latest version of Hugo
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          # Required because Microsoft Edge is proprietary/unfree software
          config.allowUnfree = true; 
        };
      in
      {
        devShells.default = pkgs.mkShell {
          # These packages are temporarily added to your PATH when in this directory
          buildInputs = with pkgs; [
            hugo                  # Note: The Nixpkgs hugo is the "extended" version by default!
            nodejs                # Replaces your nvm install
            gh                    # GitHub CLI
            microsoft-edge        # Installed seamlessly for your VS Code headless debugging
          ];

          shellHook = ''
            echo "🚀 Welcome to the myBlog Nix Shell!"
            echo "Hugo version: $(hugo version | awk '{print $2}')"
            echo "Node version: $(node -v)"
            
            # This ensures any global npm packages (like blowfish-tools) 
            # you install locally stay isolated to this project folder.
            export NPM_CONFIG_PREFIX=$PWD/.npm-global
            export PATH=$NPM_CONFIG_PREFIX/bin:$PATH
          '';
        };
      }
    );
}