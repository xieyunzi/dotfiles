require 'benchmark'

Benchmark.bm do |r|
  r.report do
    10.times do
      `source ~/.bashrc`
    end
  end
end
