#> hd.spread:
#
# @input
#   as entity
#   position
#   storage hd: Spread
#     Amount : [float] @ 2 || float
#     At? : [double] @ 3
#     OnGround? : boolean
# @within tag/function hd.spread:

## 引数の確認
	execute store success storage hd:temp Error byte 1 unless data storage hd: Spread.Amount run tellraw @a [{"storage":"hd:","nbt":"Tell.ArgumentError"},"hd: Spread.Amount"]

##
	execute unless data storage hd:temp Error run function hd.spread:main

## 引数を削除
	data remove storage hd: Spread

## 一時使用Storageを削除
	data remove storage hd:temp Error
