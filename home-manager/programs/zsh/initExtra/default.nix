let
  functions = builtins.readFile ./functions.sh;
  git = builtins.readFile ./git.sh;
  keybindings = builtins.readFile ./keybindings.sh;
  zshrc = builtins.readFile ./zshrc.sh;
  prompt = builtins.readFile ./prompt.sh;
  mise = builtins.readFile ./mise.sh;
in functions + git + keybindings + zshrc + prompt + mise
