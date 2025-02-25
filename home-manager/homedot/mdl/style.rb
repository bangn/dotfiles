# frozen_string_literal: true

all

exclude_rule 'MD004' # Unordered list style
exclude_rule 'MD013' # Line length
exclude_rule 'MD029' # Ordered list item prefix
exclude_rule 'MD032' # Lists should be surrounded by blank lines
exclude_rule 'MD033' # No inline html
exclude_rule 'MD033' # No inline html

rule 'MD024', allow_different_nesting: true # Multiple headers with the same content
