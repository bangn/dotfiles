# frozen_string_literal: true

require 'irb/completion'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:USE_MULTILINE] = false

def clear
  conf.return_format = ''
  system('clear')
  nil
end
