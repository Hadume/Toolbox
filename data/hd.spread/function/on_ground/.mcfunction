#> hd.spread:on_ground/
# 地面に接地させる
# @within function hd.spread:main

## 何ブロック内に地面があるか
	execute if score #Spread Hd.Temp matches 1.. run scoreboard players operation #Spread.Y-2 Hd.Temp += #Spread Hd.Temp
	execute if score #Spread Hd.Temp matches ..-1 run scoreboard players operation #Spread Hd.Temp -= #Spread.Y-2 Hd.Temp
	execute if score #Spread Hd.Temp matches ..-1 run scoreboard players operation #Spread.Y-2 Hd.Temp = #Spread Hd.Temp
	scoreboard players operation #Spread.Y-2 Hd.Temp /= #Hd.100 Hd.Const

## 移動
	execute if score #Spread.Y-2 Hd.Temp matches 0.. at @s align y run function hd.spread:on_ground/plus.loop
	execute if score #Spread.Y-2 Hd.Temp matches ..0 at @s align y run function hd.spread:on_ground/minus.loop
