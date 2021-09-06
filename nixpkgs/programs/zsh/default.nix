{ pkgs, ... }:

{
  enable = true;

  autocd = true;
  defaultKeymap = "viins";
  dotDir = ".config/zsh";
  enableAutosuggestions = true;
  enableCompletion = true;

  history = {
    expireDuplicatesFirst = true;
    share = true;
    save = 10000000;
    size = 100000;
  };

  shellAliases = import ./alias;

  envExtra = "";

  sessionVariables = import ./sessionVars.nix { inherit pkgs; };

  plugins = [
    {
      name = "zsh-autosuggestions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "v0.6.4";
        sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
      };
    }
    {
      name = "zsh-completions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-completions";
        rev = "0.31.0";
        sha256 = "0rw23m8cqxhcb4yjhbzb9lir60zn1xjy7hn3zv1fzz700f0i6fyk";
      };
    }
    {
      name = "zsh-history-substring-search";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-history-substring-search";
        rev = "v1.0.2";
        sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
      };
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "0.7.1";
        sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
      };
    }
  ];

  initExtra =
    let extra = import ./initExtra;
    in
    ''
      autoload -U zmv
      setopt INC_APPEND_HISTORY
    ''
    +
    ''
      source "${pkgs.autojump}/share/autojump/autojump.zsh"

      source "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
      fpath=(${pkgs.asdf-vm}/completions $fpath)
      # initialise completions with ZSH's compinit
      autoload -Uz compinit
      compinit
    ''
    + extra
  ;
}
