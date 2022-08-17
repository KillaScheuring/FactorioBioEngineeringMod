---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by killa.
--- DateTime: 8/13/2022 9:43 PM
---
require "control-eggs"

function setup_mod_vars()
    global.monitored_entity = global.monitored_entity or {}
end

function On_Built(event)
    local first_player = game.players[1]
    global.monitored_entity = global.monitored_entity or {}
    local entity = event.created_entity or event.entity
    table.insert(global.monitored_entity, {entity=entity})
    first_player.print(global.monitored_entity[1].entity.name)
end

local filters = {{filter = "name", name = "biter-egg"}}
script.on_event(defines.events.on_built_entity, On_Built, filters)
script.on_event(defines.events.on_robot_built_entity, On_Built, filters)
script.on_event(defines.events.script_raised_built, On_Built, filters)
script.on_event(defines.events.script_raised_revive, On_Built,filters)

script.on_nth_tick(60, function (event)
    local monitored_entity = global.monitored_entity or {}
if #monitored_entity>0 then Monitored_Entities() end
end)

script.on_init(setup_mod_vars)