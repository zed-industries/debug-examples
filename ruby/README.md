# Fun Ruby CLI Example

A simple Ruby CLI application that demonstrates command-line argument parsing with Slop.

## Installation

Make sure you have Ruby installed on your system. Then install the required gems:

```
bundle install
```

## Usage

This CLI tool provides three commands:

### Greet Command

Say hello with custom greeting options:

```
ruby cli.rb greet --name "Your Name"
```

Options:
- `-n, --name NAME` - Specify your name (default: "Friend")
- `-c, --colorful` - Enable colorful output (default: true)
- `--no-colorful` - Disable colorful output

### Fortune Command

Get a random fortune:

```
ruby cli.rb fortune
```

Options:
- `-c, --colorful` - Enable colorful output (default: true)
- `--no-colorful` - Disable colorful output

### Debug Command

Demonstrates the Ruby debugger in action:

```
ruby cli.rb debug
```

This will open a debug session where you can:
- Inspect variables with `pp variable_name`
- Step through code with `n` (next), `s` (step), etc.
- Continue execution with `c`
- Type `help` to see all available commands

### General Options

- `-h, --help` - Show help message
- `--version` - Display the version

## Examples

```
# Basic greet command
ruby cli.rb greet

# Greet with a custom name
ruby cli.rb greet --name "Ruby Fan"

# Get a fortune without colors
ruby cli.rb fortune --no-colorful

# Try the debugger
ruby cli.rb debug

# Show help
ruby cli.rb --help
```

## License

This project is available as open source under the terms of the MIT License.