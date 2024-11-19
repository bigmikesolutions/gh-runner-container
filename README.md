# gh-runner-container

Container set-up for GitHub hosted runner. 

Set-up allows to run GitHub runner on self-host machine as a docker container instead of running it directly on OS.


## Disclaimer

Project was started using home-made docker but it was troublesome to maintain. 

Since official [GitHub action runner image](https://github.com/actions-runner-controller/actions-runner-controller/pkgs/container/actions-runner-controller%2Factions-runner-dind) was found the whole solution is now based on it.


## Usage

```shell
ACCESS_TOKEN=YOUR_TOKEN docker compose up
```

## Docs

* [Github runner releases](https://github.com/actions/runner/releases)
* [GitHub actions](https://docs.github.com/en/enterprise-cloud@latest/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners)
* [Runner VM images](https://github.com/actions/runner-images/tree/main)
* [Runner images - manual image generation](https://github.com/actions/runner-images/blob/main/docs/create-image-and-azure-resources.md#manual-image-generation)
* [GitHub action runner images](https://github.com/actions-runner-controller/actions-runner-controller/pkgs/container/actions-runner-controller%2Factions-runner-dind)
* [GitHub action runner docker files](https://github.com/actions/actions-runner-controller/blob/master/runner/actions-runner-dind.ubuntu-20.04.dockerfile)