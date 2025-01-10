#> hd.e_dat/init
# eDatを初期化
# @api

#> Scoreboard
# @internal
	scoreboard objectives add Hd.Global dummy
	scoreboard objectives add Hd.Const dummy
	scoreboard objectives add Hd.Temp dummy
	scoreboard objectives add Hd.ID dummy

#> ScoreHolder
# @internal
	scoreboard players set #Hd.2 Hd.Const 2

## 割り当て済みID保存ストレージ
	data modify storage hd.dat: id set value [0]

## 最後にアクセスした奴
	data modify storage hd.dat: LastID set value 0
