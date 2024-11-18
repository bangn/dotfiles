{ pkgs, pkgsUnstable, ... }:
with pkgsUnstable; [
  bat
  buf
  buildkite-agent
  buildkite-cli
  caddy
  detekt
  difftastic
  docker-compose
  entr
  fd
  gh-copilot
  ghcid
  gitAndTools.delta
  gitAndTools.diff-so-fancy
  github-cli
  gnupg
  gopls
  gradle
  graphviz
  hadolint
  hlint
  htop
  hub
  hugo
  jd-diff-patch
  jq
  just
  k9s
  kdiff3
  kubectl
  kubectx
  kubernetes-helm
  luajitPackages.luacheck
  luarocks
  markdownlint-cli
  markdownlint-cli2
  mdl
  minikube
  mise
  mkcert
  moreutils
  ngrok
  nixfmt-classic
  nixpkgs-fmt
  nushell
  pandoc
  pdftk
  pipx
  plantuml
  poetry
  postgresql_17
  pylint
  python312Packages.sqlparse
  ripgrep
  ruff
  shellcheck
  shfmt
  sqlint
  stow
  stylish-haskell
  stylua
  terraform-ls
  tig
  tldr
  tree
  tree-sitter
  usage
  uv
  watch
  wget
  xclip
  yaml-language-server
  yamllint
  yarn
  yq
]
