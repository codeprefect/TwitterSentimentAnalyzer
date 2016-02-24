

require "ruby-progressbar"

bar = ProgressBar.create
100.times do |i|
  bar.increment
  if i % 100 == 0
    bar.log "Progress milestone: #{i}"
  end
  sleep 0.1
end
