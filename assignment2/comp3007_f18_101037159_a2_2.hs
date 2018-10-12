data TVL = Falz | Troo | Unkown deriving (Show)

-- ternaryNot flips the value unles it is Unkown
ternaryNOT :: TVL -> TVL
ternaryNOT Falz = Troo
ternaryNOT Troo = Falz
ternaryNOT Unkown = Unkown

ternaryAND :: TVL -> TVL -> TVL
ternaryAND Falz _ = Falz
ternaryAND _ Falz = Falz
ternaryAND Troo Troo = Troo
ternaryAND _ _ = Unkown

ternaryOR :: TVL -> TVL -> TVL
ternaryOR Troo _ = Troo
ternaryOR _ Troo = Troo
ternaryOR Falz Falz = Troo
ternaryOR _ _ = Unkown
