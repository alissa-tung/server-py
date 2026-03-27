.DEFAULT_GOAL := all

.PHONY: all fmt lint check test run train serve eval

all: fmt lint check test

fmt:
	(alejandra flake.nix pkgs/shell.nix)
	(uv run ruff format .)
	(uv run ruff check --fix .)
	(fd -e md -e toml -X oxfmt)
	(mbake format Makefile)

lint:
	(alejandra --check flake.nix pkgs/shell.nix)
	(uv run ruff check .)
	(fd -e md -e toml -X oxfmt --check)
	(mbake format --check Makefile)

check:
	(uv run basedpyright src)

test:
	(uv run pytest src/tests)

run:
	(uv run server-py)

train:
	(uv run server-py-train)

serve:
	(uv run server-py-serve)

eval:
	(uv run server-py-eval)