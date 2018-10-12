data TVL = falz | troo | unknown

-- ternaryNot flips the value unles it is unknown
ternaryNOT :: TVL -> TVL
ternaryNOT falz = troo
ternaryNOT troo = falz
ternaryNOT unknown = unknown

ternaryAND :: TVL TVL - TVL
ternaryAnd falz _ = falz
ternaryAnd _ falz = falz
ternaryAnd troo troo = troo
ternaryAnd _ _ = unknown

ternaryOR :: TVL TVL - TVL
ternaryOR troo _ = troo
ternaryOR troo _ = troo
ternaryOR falz falz = troo
ternaryOR _ _ = unknown
