data TVL = Falz | Troo | Unknown deriving (Show)

-- ternaryNot flips the value unles it is Unkown
ternaryNOT :: TVL -> TVL
ternaryNOT Falz = Troo
ternaryNOT Troo = Falz
ternaryNOT Unknown = Unknown

ternaryAND :: TVL -> TVL -> TVL
ternaryAND Falz _ = Falz
ternaryAND _ Falz = Falz
ternaryAND Troo Troo = Troo
ternaryAND _ _ = Unknown

ternaryOR :: TVL -> TVL -> TVL
ternaryOR Troo _ = Troo
ternaryOR _ Troo = Troo
ternaryOR Falz Falz = Falz
ternaryOR _ _ = Unknown
