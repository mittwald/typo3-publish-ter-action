# TER publish action

## Inputs

### `ter-username`

**Required** Your typo3.org username.

### `ter-password`

**Required** Your typo3.org password.

### `extension-key`

**Required** Your extension key.

### `extension-dir`

The directory from which your extension should be published. Defaults to `"."`.

## Example usage

```yaml
uses: mittwald/typo3-publish-ter-action@v1
with:
  ter-username: ${{ secrets.ter_username }}
  ter-password: ${{ secrets.ter_password }}
  extension-key: example_extension
```