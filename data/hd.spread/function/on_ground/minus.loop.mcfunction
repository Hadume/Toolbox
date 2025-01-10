#> hd.spread:on_ground/minus.loop
# マイナス方向に移動
# @within function hd.spread:on_ground/
# @private

## tp
	execute unless block ~ ~-0.001 ~ #hd.spread:no_collision run tp @s ~ ~ ~

## スコアを減らす
	scoreboard players add #Spread.Y-2 Hd.Temp 1

## ループ
	execute if score #Spread.Y-2 Hd.Temp matches ..0 if block ~ ~-0.001 ~ #hd.spread:no_collision positioned ~ ~1 ~ run function hd.spread:on_ground/minus.loop
