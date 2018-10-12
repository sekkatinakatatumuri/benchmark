# ハッシュのキーのベンチマークを取る

require 'benchmark/ips'

STRING_HASH  = { "foo" => "bar" }
SYMBOL_HASH  = { :foo  => "bar" }
INTEGER_HASH = { 1     => "bar" }
Benchmark.ips do |x|
  x.report("String")  { STRING_HASH["foo"] }
  x.report("Symbol")  { SYMBOL_HASH[:foo] }
  x.report("Integer") { INTEGER_HASH[1] }
  x.compare!
end

## ストリングハッシュは、シンボルハッシュより約1.2倍遅い。

# Warming up --------------------------------------
#               String   140.479k i/100ms
#               Symbol   145.477k i/100ms
#             Integer   145.679k i/100ms
# Calculating -------------------------------------
#               String      7.523M (± 1.5%) i/s -     37.648M in   5.005845s
#               Symbol      8.982M (± 1.8%) i/s -     44.952M in   5.006425s
#             Integer      9.105M (± 1.9%) i/s -     45.598M in   5.010147s

# Comparison:
#             Integer:  9104552.1 i/s
#               Symbol:  8982195.6 i/s - same-ish: difference falls within error
#               String:  7522620.8 i/s - 1.21x  slower