# quickspawn

A simple, dependency-free tool to quickly scaffold new projects from a local template.

## Installation

To install the `quickspawn` command on your system, run the following Nix command:

```sh
nix profile install github:denisraison/quickspawn
```

This will add the `quickspawn` command to your user profile, making it available in any terminal.

## Usage

To create a new project, simply run:

```sh
quickspawn <your-project-name>
```

This will create a new directory named `<your-project-name>` containing the template files.

## Development

To work on this project, clone the repository and enter the development shell:

```sh
git clone https://github.com/denisraison/quickspawn.git
cd quickspawn
nix develop
```

Inside the shell, the `quickspawn` command will be available and will use the local `template/` directory.
