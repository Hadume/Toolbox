#> hd.e_dat/please
# 個人ストレージを提供
# @within tag/function hd.e_dat:please

# IDを持っていなければ、IDを割り当て
	execute unless score @s Hd.ID matches 1.. run function hd.e_dat:id/allocate

# IDを一時変数にコピー
	execute store result storage hd.dat: ID int 1 run scoreboard players get @s Hd.ID

# 取得するIDに変化があるかどうか確認
	data modify storage hd:temp LastID set from storage hd.dat: LastID
	execute store result storage hd:temp update byte 1 run data modify storage hd:temp LastID set from storage hd.dat: ID

# データの書き込み＆読み取り
	execute if data storage hd:temp {update:true} run function hd.e_dat:write_and_read with storage hd.dat:

## 一時使用Storageを削除
	data remove storage hd.dat: ID
	data remove storage hd:temp LastID
	data remove storage hd:temp update
