<<<<<<< HEAD

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
      pager = "delta";
      diff = {
        tool = "delta"; # Specify diff tool ("git", "delta", etc.)
        format = "git";
      };
||||||| parent of a862be9 (nix: Add jj config and use jj from home-manager)
=======
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
>>>>>>> a862be9 (nix: Add jj config and use jj from home-manager)
    };
  };
}
