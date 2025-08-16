# forge

A simple, dependency-free tool to quickly scaffold new projects from a local template.

## Installation

To install the `forge` command on your system, run the following Nix command:

```sh
nix profile install github:denisraison/forge
```

This will add the `forge` command to your user profile, making it available in any terminal.

## Usage

To create a new project, simply run:

```sh
forge <your-project-name>
```

This will create a new directory named `<your-project-name>` containing the template files.

## Development

To work on this project, clone the repository and enter the development shell:

```sh
git clone https://github.com/denisraison/forge.git
cd forge
nix develop
```

Inside the shell, the `forge` command will be available and will use the local `template/` directory.
