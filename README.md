# TER publish action

This repository contains a Github Action to publish a TYPO3 extension into the TYPO3 extension repository (TER).

## Inputs

<dl>
  <dt><code>ter-username</code></dt>
  <dd><b>Required</b> This is your typo3.org username.</dd>
  <dt><code>ter-password</code></dt>
  <dd><b>Required</b> Your typo3.org password. Yes, an API key would be much nicer -- unfortunately, username+password authentication is the only mechanism supported by TER.</dd>
  <dt><code>extension-key</code></dt>
  <dd><b>Required</b> Your extension key.</dd>
  <dt><code>extension-dir</code></dt>
  <dd>The directory from which your extension should be published. Defaults to <code>"."</code></dd>
</dl>

## Example usage

```yaml
uses: mittwald/typo3-publish-ter-action@v1.0.0-beta1
with:
  ter-username: ${{ secrets.ter_username }}
  ter-password: ${{ secrets.ter_password }}
  extension-key: example_extension
```
