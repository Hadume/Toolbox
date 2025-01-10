#> hd.e_dat:id/allocate
# IDを割り当てる
# @within function hd.e_dat:read

###################################################

# 赤石愛様の「OhMyDat」を参考にさせていただいております！ #

###################################################

## ごみ掃除(抜けるとid[0]とid[-1]が丁度良いスペースになる)
	function hd.e_dat:id/gc

## id[0] + id[-1] / 2 を割り当てIDに取る
	execute store result score #ID Hd.ID run data get storage hd.dat: id[-1]
	execute store result score #ID Hd.Temp run data get storage hd.dat: id[0]
	execute if score #ID Hd.ID matches 0 run scoreboard players set #ID Hd.ID 268435456
	scoreboard players operation #ID Hd.ID += #ID Hd.Temp
	scoreboard players operation #ID Hd.ID /= #Hd.2 Hd.Const

## 割り当てIDに追加
	data modify storage hd.dat: id append value -1
	execute store result storage hd.dat: id[-1] int 1 run scoreboard players get #ID Hd.ID

## 割り当てる
	scoreboard players operation @s Hd.ID = #ID Hd.ID

## ストレージを初期化
	execute store result storage hd:temp id int 1 run scoreboard players get #ID Hd.ID
	function hd.e_dat:id/init with storage hd:temp

## 一時使用ScoreHolderをリセット
	scoreboard players reset #ID Hd.Temp

## 一時使用Storageを削除
	data remove storage hd:temp id
