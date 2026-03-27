{pkgs}:
pkgs.mkShell {
  packages = with pkgs; [
    python314
    uv
    fd
    oxfmt
    mbake
    alejandra
  ];

  shellHook = ''
    export UV_PYTHON=${pkgs.python314}/bin/python3.14
    if [ ! -d ".venv" ]; then
      uv venv
    fi
    . .venv/bin/activate
    uv sync
  '';
}
