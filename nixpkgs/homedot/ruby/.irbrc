# frozen_string_literal: true

require 'irb/completion'
IRB.conf[:SAVE_HISTORY] = 1000

def clear
  conf.return_format = ''
  system('clear')
  nil
end
