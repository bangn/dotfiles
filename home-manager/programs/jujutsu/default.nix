{
  pkgs,
  gitDetails,
  ...
}: {
  enable = true;

  settings = {
    user = {
      name = gitDetails.username;
      email = gitDetails.email;
    };
    ui = {
      color = "auto"; # "always", "never", or "auto"
      default-command = "log"; # Default command if none is specified
      diff.tool = "delta"; # Specify diff tool ("git", "delta", etc.)
    };
  };
}
