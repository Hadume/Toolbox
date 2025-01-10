#> hd.e_dat:write
# データの書き込み
# @within function hd.e_dat:please

## 書き込み
	$data modify storage hd.dat:$(LastID) _ set from storage hd.dat: _

## 読み込み
	$data modify storage hd.dat: _ set from storage hd.dat:$(ID) _

## 読み込まれたIDを保存
	data modify storage hd.dat: LastID set from storage hd.dat: ID
