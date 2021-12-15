find = "test"
file = "test"
if instance_exists(o_player) then depth = o_player+1



mev = 1
al = 1
dodown = 0

if ds_map_find_value(global.gameevent,"mev_"+string(mev)) = 1 then instance_destroy(id)