{ pkgs, pkgsUnstable, ... }:
with pkgsUnstable;
[
  # pkgs.neovim-nightly
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
  gradle_7
  graphviz
  hlint
  htop
  jdk11
  jq
  k9s
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
  plantuml
  postgresql_12
  python38Packages.sqlparse
  ripgrep
  rnix-lsp
  saml2aws
  shellcheck
  shfmt
  sqlint
  ssm-session-manager-plugin
  starship
  stow
  stylish-haskell
  stylua
  terraform-ls
  terraform_0_13
  tig
  trash-cli
  tree
  tree-sitter
  xclip
  yaml-language-server
  yamllint
  yapf
  yarn
  yq
]
