#> hd.e_dat:id/gc_loop
#
# @within function hd.e_dat:id/gc

###################################################

# 赤石愛様の「OhMyDat」を参考にさせていただいております！ #

###################################################

## データを削除
	data modify storage hd:temp ID set from storage hd.dat: id[0]
	function hd.e_dat:remove.data with storage hd:temp

## 割り当て済みIDを削除
	data remove storage hd.dat: id[0]

## 不要なデータを解放(先頭から続く基準より大きいIDは全部要らない)
	execute store result score #ID Hd.Global run data get storage hd.dat: id[0]
	execute if score #ID Hd.Global > #ID Hd.Temp run function hd.e_dat:id/gc_loop
