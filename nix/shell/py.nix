{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [
    python3
    uv
    poetry
    ruff
    basedpyright
  ];

  env = {
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
      stdenv.cc.cc.lib
      zlib
    ]);
  };

  shellHook = ''
    # Create a virtual environment if it doesn't exist
    if [ ! -d .venv ]; then
      echo "Creating virtual environment..."
      python3 -m venv .venv
    fi

    # Activate the virtual environment
    source .venv/bin/activate
    
    # Ensure pip is installed/upgraded in the venv
    # pip install --upgrade pip  # Optional: strictly update pip on entry
    
    echo "Python environment activated. Pip is available."
    echo "Use 'pip install <package>' to install packages locally."
  '';
}
