# gh-runner-container

Container for GitHub hosted runner. 

## Usage

1) Go to organization settings -> actions -> runners -> new runner

2) Get access token from GH page

3) Run & register container 

```shell
GH_ORG=${YOUR_GH_ORG} GH_ACCESS_TOKEN=${REGISTRATION_TOKEN} make start
```

## Docs

* [Github runner releases](https://github.com/actions/runner/releases)
* [GitHub actions](https://docs.github.com/en/enterprise-cloud@latest/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners)
* [Runner VM images](https://github.com/actions/runner-images/tree/main)
* [Runner images - manual image generation](https://github.com/actions/runner-images/blob/main/docs/create-image-and-azure-resources.md#manual-image-generation)