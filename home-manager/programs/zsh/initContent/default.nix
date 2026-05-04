let
  functions = builtins.readFile ./functions.sh;
  git = builtins.readFile ./git.sh;
  keybindings = builtins.readFile ./keybindings.sh;
  mise = builtins.readFile ./mise.sh;
  prompt = builtins.readFile ./prompt.sh;
  worktrunk = builtins.readFile ./worktrunk.sh;
  zshrc = builtins.readFile ./zshrc.sh;
in
  functions + git + keybindings + zshrc + prompt + mise + worktrunk
