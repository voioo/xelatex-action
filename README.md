# XeLaTeX GitHub Action

A minimal and efficient GitHub Action to compile LaTeX documents using XeLaTeX. Built on Debian Sid with full TeXLive support.

## Features

- Full TeXLive distribution
- Font Awesome support
- Simple configuration
- Artifact upload support

## Usage

Create `.github/workflows/build.yml` in your repository:

```yaml
name: Build LaTeX
on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: voioo/xelatex-action@v1
        with:
          file: document.tex
      - uses: actions/upload-artifact@v4
        with:
          name: PDF
          path: document.pdf
```

## Configuration

### Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `file` | LaTeX file to compile | Yes | - |

### Docker Image

You can also use the Docker image directly:

```bash
docker pull ghcr.io/voioo/xelatex:latest
```

## Examples

### Multiple Files

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: voioo/xelatex-action@v1
        with:
          file: |
            main.tex
            appendix.tex
      - uses: actions/upload-artifact@v4
        with:
          name: Documents
          path: |
            main.pdf
            appendix.pdf
```

## License

Licensed under [0BSD](LICENSE) - Feel free to use in any way.
