-- Pinned: the coq branch is the maintainer's active v2 dev branch with no
-- tags/releases, so :Lazy update would pull untested HEAD. These commits are
-- verified working (v2 on stable nvim 0.12.4). To update coq deliberately:
-- drop the commit fields, :Lazy update, test completions, then re-pin.
return {
  { "ms-jpq/coq.artifacts", lazy = false, branch = "artifacts", commit = "d545035d06408f2d68cd03bc401425e42c298fc4" },
  { "ms-jpq/coq_nvim", lazy = false, branch = "coq", commit = "0b2b0db07b0426441ece46988d9ab28088f07cd5" },
}
