require 'services/liftings/generate'
date_range = Date.today..Date.today + 2.weeks
generate = Services::Liftings::Generate.new(verbose: true, date_range: date_range)
generate.liftings

