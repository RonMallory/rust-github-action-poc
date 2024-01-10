# rust-github-action-poc docker action

This repository is a POC of a way to use Rust to write github actions.

The action itself returns a string 'Value for name: <name>"

Regarding the `Dockerfile` best efforts has been made to create a minimal image to run the rust binary.

## Inputs

## 'name'

**Required** The name you want returned

## Example Usage

```
      - name: Run action locally
        uses: RonMallory/rust-github-action-poc@main
        with:
          name: 'Rust'
```
