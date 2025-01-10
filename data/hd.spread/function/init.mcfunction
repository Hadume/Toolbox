#> hd.spread:init
# 拡散機能の初期化
# @api

#> Scoreboard
# @internal
	scoreboard objectives add Hd.Temp dummy
	scoreboard objectives add Hd.Const dummy

#> ScoreHolder
# @internal
	scoreboard players set #Hd.2 Hd.Const 2
	scoreboard players set #Hd.100 Hd.Const 100

## Storage
	data modify storage hd: Tell.ArgumentError set value "§c[Error] 引数が足りません: §o§n"
