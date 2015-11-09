require 'benchmark'

Benchmark.bm(7, 'avg') do |r|
  n = 10

  t =
    r.report('total') do
      n.times do
        `source ~/.bashrc`
      end
    end

  [t/n]
end
