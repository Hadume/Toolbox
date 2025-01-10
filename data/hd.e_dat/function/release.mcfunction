#> hd.e_dat:release
# 個人ストレージを削除する
# @within tag/function hd.e_dat:release

# データを消す
	execute store result storage hd:temp ID int 1 run scoreboard players get @s Hd.ID
	function hd.e_dat:remove.data with storage hd:temp

## 最後にアクセスした奴をリセット
	data modify storage hd.dat: LastID set value 0

## IDを剥奪
	scoreboard players reset @s Hd.ID
