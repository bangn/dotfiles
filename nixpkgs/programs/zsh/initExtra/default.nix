let
  afterpay = builtins.readFile ./afterpay.sh;
  functions = builtins.readFile ./functions.sh;
  git = builtins.readFile ./git.sh;
  keybindings = builtins.readFile ./keybindings.sh;
  zshrc = builtins.readFile ./zshrc.sh;
  prompt = builtins.readFile ./prompt.sh;
in
afterpay +
functions +
git +
keybindings +
prompt +
zshrc
