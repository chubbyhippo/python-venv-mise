#!/usr/bin/env sh
curl -k "https://raw.githubusercontent.com/chubbyhippo/python-venv-mise-setup/refs/heads/main/mise.toml" -o "mise.toml"
mise trust
mise install
curl -k "https://raw.githubusercontent.com/chubbyhippo/python-venv-mise-setup/refs/heads/main/requirements.txt" -o "requirements.txt"
mise exec python@3 -- python -m venv .venv

case $(uname 2>/dev/null) in
Linux)
	# For Linux systems
	source .venv/bin/activate
	;;
Darwin)
	# For macOS systems
	source .venv/bin/activate
	;;
MINGW* | MSYS* | CYGWIN*)
	# For Windows systems using MinGW/MSYS/Cygwin
	source .venv/Scripts/activate
	;;
*)
	# If the operating system is unknown
	echo "Unknown Operating System" >&2
	exit 1
	;;
esac

pip install -r requirements.txt
