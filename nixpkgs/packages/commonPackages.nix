{ pkgs, pkgsUnstable, ... }:
with pkgsUnstable;
[
  # awscli2
  asdf-vm
  autojump
  awslogs
  bat
  bitwarden-cli
  buildkite-agent
  buildkite-cli
  caddy
  ccloud-cli
  coreutils-full
  curlFull
  docker-compose
  entr
  fd
  fzf
  ghcid
  gitAndTools.delta
  gitAndTools.diff-so-fancy
  github-cli
  google-cloud-sdk
  graphviz
  hlint
  htop
  jq
  kubectl
  kubectx
  kubernetes-helm
  lastpass-cli
  luajitPackages.luacheck
  mcrypt
  mdl
  minikube
  mkcert
  moreutils
  ncdu
  neuron-notes
  nixpkgs-fmt
  nnn
  pandoc
  pdftk
  pkgs.neovim-nightly
  plantuml
  podman
  podman-compose
  postgresql_12
  python38Packages.sqlparse
  ripgrep
  rnix-lsp
  saml2aws
  shellcheck
  shfmt
  ssm-session-manager-plugin
  starship
  stow
  stylish-haskell
  stylua
  terraform_0_13
  tig
  trash-cli
  tree
  tree-sitter
  xclip
  yaml-language-server
  yamllint
  yarn
  yq
]
