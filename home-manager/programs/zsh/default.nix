{pkgs, ...}: {
  enable = true;

  autocd = true;
  defaultKeymap = "viins";
  enableCompletion = true;

  history = {
    expireDuplicatesFirst = true;
    share = true;
    save = 10000000;
    size = 100000;
  };

  autosuggestion = {enable = true;};

  shellAliases = import ./alias {inherit pkgs;};

  envExtra = "";

  sessionVariables = import ./sessionVars.nix {
    inherit pkgs;
  };

  plugins = [
    {
      name = "fzf-tab";
      src = pkgs.fetchFromGitHub {
        owner = "Aloxaf";
        repo = "fzf-tab";
        rev = "master";
        sha256 = "1a3cj5bqply9prr123nnprxmw4g9cm081gcd80h7adk2y0zxgzc7";
      };
    }
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

  initContent = let
    extra = import ./initContent;
  in
    ''
      autoload -U zmv
      setopt INC_APPEND_HISTORY
    ''
    + ''
      source "${pkgs.fzf}/share/fzf/completion.zsh"
      source "${pkgs.fzf}/share/fzf/key-bindings.zsh"
      source "${pkgs.mise}/share/zsh/site-functions/_mise"
    ''
    + extra;
}
