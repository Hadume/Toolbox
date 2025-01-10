#> hd.spread:main
# MOBを拡散させる
# @within function hd.spread:

#> ScoreHolder.Temp
# @within function hd.spread:**
	#declare score_holder #Spread.XZ-1
	#declare score_holder #Spread.XZ-2
	#declare score_holder #Spread.Y-1
	#declare score_holder #Spread.Y-2
	#declare score_holder #Spread
	#declare score_holder #Pos.X
	#declare score_holder #Pos.Y
	#declare score_holder #Pos.Z

## Posを取得
	execute if data storage hd: Spread.At run data modify storage hd:temp Pos set from storage hd: Spread.At
	execute unless data storage hd: Spread.At run data modify storage hd:temp Pos set from entity @s Pos

## 拡散値を取得
	### XZ
		execute if data storage hd: Spread.Amount[0] store result score #Spread.XZ-1 Hd.Temp run data get storage hd: Spread.Amount[0] 100
		execute unless data storage hd: Spread.Amount[0] store result score #Spread.XZ-1 Hd.Temp run data get storage hd: Spread.Amount 100
		scoreboard players operation #Spread.XZ-2 Hd.Temp = #Spread.XZ-1 Hd.Temp
		scoreboard players operation #Spread.XZ-1 Hd.Temp *= #Hd.2 Hd.Const
		execute if score #Spread.XZ-1 Hd.Temp matches 0 run scoreboard players set #Spread.XZ-1 Hd.Temp 1

	### Y
		execute if data storage hd: Spread.Amount[1] store result score #Spread.Y-1 Hd.Temp run data get storage hd: Spread.Amount[1] 100
		execute unless data storage hd: Spread.Amount[1] store result score #Spread.Y-1 Hd.Temp run data get storage hd: Spread.Amount 100
		scoreboard players operation #Spread.Y-2 Hd.Temp = #Spread.Y-1 Hd.Temp
		scoreboard players operation #Spread.Y-1 Hd.Temp *= #Hd.2 Hd.Const
		execute if score #Spread.Y-1 Hd.Temp matches 0 run scoreboard players set #Spread.Y-1 Hd.Temp 1


## データを用意
	data modify storage hd:temp Pos1 set value [0.0d,0.0d,0.0d]

## 座標を計算
	execute store result score #Pos.X Hd.Temp run data get storage hd:temp Pos[0] 100
	execute store result score #Pos.Y Hd.Temp run data get storage hd:temp Pos[1] 100
	execute store result score #Pos.Z Hd.Temp run data get storage hd:temp Pos[2] 100
	### X
		execute store result score #Spread Hd.Temp run random value 1..
		scoreboard players operation #Spread Hd.Temp %= #Spread.XZ-1 Hd.Temp
		scoreboard players operation #Spread Hd.Temp -= #Spread.XZ-2 Hd.Temp
		execute store result storage hd:temp Pos1[0] double 0.01 run scoreboard players operation #Pos.X Hd.Temp += #Spread Hd.Temp

	### Z
		execute store result score #Spread Hd.Temp run random value 1..
		scoreboard players operation #Spread Hd.Temp %= #Spread.XZ-1 Hd.Temp
		scoreboard players operation #Spread Hd.Temp -= #Spread.XZ-2 Hd.Temp
		execute store result storage hd:temp Pos1[2] double 0.01 run scoreboard players operation #Pos.Z Hd.Temp += #Spread Hd.Temp

	### Y
		execute store result score #Spread Hd.Temp run random value 1..
		scoreboard players operation #Spread Hd.Temp %= #Spread.Y-1 Hd.Temp
		scoreboard players operation #Spread Hd.Temp -= #Spread.Y-2 Hd.Temp
		execute store result storage hd:temp Pos1[1] double 0.01 run scoreboard players operation #Pos.Y Hd.Temp += #Spread Hd.Temp


## 座標を代入
	execute if entity @s[type=!player] run data modify entity @s Pos set from storage hd:temp Pos1

## 地面に設置させる
	execute if data storage hd: {Spread:{OnGround:1b}} run function hd.spread:on_ground/

## 一時使用ScoreHolderをリセット
	scoreboard players reset #Spread.XZ-1 Hd.Temp
	scoreboard players reset #Spread.XZ-2 Hd.Temp
	scoreboard players reset #Spread.Y-1 Hd.Temp
	scoreboard players reset #Spread.Y-2 Hd.Temp
	scoreboard players reset #Spread Hd.Temp
	scoreboard players reset #Pos.X Hd.Temp
	scoreboard players reset #Pos.Y Hd.Temp
	scoreboard players reset #Pos.Z Hd.Temp

## 一時使用Storageを削除
	data remove storage hd:temp Pos
	data remove storage hd:temp Pos1
