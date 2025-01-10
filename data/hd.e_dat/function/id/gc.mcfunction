#> hd.e_dat:id/gc
# ガーベージコレクタ
# @within function hd.e_dat:id/allocate

###################################################

# 赤石愛様の「OhMyDat」を参考にさせていただいております！ #

###################################################

## 前回存在を確認したIDを移動させる
	data modify storage hd.dat: id append from storage hd.dat: id[0]
	data remove storage hd.dat: id[0]

## 割り当て済みID[0]以下の最大値を取得(_ IDに入る)
	execute store result score #ID Hd.Temp run data get storage hd.dat: id[0]
	scoreboard players remove #ID Hd.Temp 2147483647
	scoreboard players set #ID Hd.ID 0
	scoreboard players operation * Hd.ID -= #ID Hd.Temp
	scoreboard players operation #ID Hd.ID > * Hd.ID
	scoreboard players operation * Hd.ID += #ID Hd.Temp

## 不要なデータを解放(先頭から続く基準より大きいIDは全部要らない)
	scoreboard players operation #ID Hd.Temp >< #ID Hd.ID
	execute store result score #ID Hd.ID run data get storage hd.dat: id[0]
	execute if score #ID Hd.ID > #ID Hd.Temp run function hd.e_dat:id/gc_loop
	scoreboard players operation #ID Hd.Temp >< #ID Hd.ID

## loop while x - next >= 2(prev - x) - 1 (⇔ 3x - 2prev - next + 1 >= 0)
	### 2prev
		execute store result score #ID Hd.Temp run data get storage hd.dat: id[-1]
		execute if score #ID Hd.Temp matches 0 run scoreboard players add #ID Hd.Temp 268435456
		execute if score #ID Hd.ID matches 0 run scoreboard players add #ID Hd.Temp 268435456
		execute if score #ID Hd.ID matches 0 run scoreboard players add #ID Hd.ID 268435456
		scoreboard players operation #ID Hd.Temp *= #2 Hd.Const

	### 2prev - 2x
		scoreboard players operation #ID Hd.Temp -= #ID Hd.ID
		scoreboard players operation #ID Hd.Temp -= #ID Hd.ID

	### 3x - 2prev
		scoreboard players operation #ID Hd.ID -= #ID Hd.Temp

	### 3x - 2prev - next
		execute store result score #ID Hd.Temp run data get storage hd.dat: id[1]
		scoreboard players operation #ID Hd.ID -= #ID Hd.Temp
		execute if score #ID Hd.ID matches -1.. run function hd.e_dat:id/gc
