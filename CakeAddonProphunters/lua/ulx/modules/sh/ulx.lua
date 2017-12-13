local CATEGORY_NAME = "Cakes Stuff"

function ulx.lick( calling_ply, target_plys )
	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]

			table.insert( affected_plys, v )
		end
	
		ulx.fancyLogAdmin( calling_ply, "#A Licked #T", affected_plys)
end
local lick = ulx.command( CATEGORY_NAME, "ulx lick", ulx.lick, "!lick" )
lick:addParam{ type=ULib.cmds.PlayersArg }
lick:addParam{ type=ULib.cmds.BoolArg, invisible=true }
lick:defaultAccess( ULib.ACCESS_ADMIN )
lick:help( "Licks target(s)." )

function ulx.cake(calling_ply)
	ulx.fancyLogAdmin( calling_ply, "#A asked what the best dessert was, the reply was CAKE!")
	end
local cake = ulx.command( CATEGORY_NAME, "ulx cake", ulx.cake, "!cake" )
cake:help( "Try it!" )
cake:defaultAccess( ULib.ACCESS_ADMIN )


function ulx.respawn( calling_ply, target_plys )
	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]
		if not v:Alive() then
		local Rag=v:GetRagdollEntity()
		if Rag!=nil and Rag:IsValid() then
		Rag:Remove()
		end
		v:Spawn()
			table.insert( affected_plys, v )
			else 
			 ULib.tsayError( calling_ply, v:Nick().." is alive!" )
		end
		end
	
		ulx.fancyLogAdmin( calling_ply, "#A respawned #T", affected_plys)
end
local respawn = ulx.command( CATEGORY_NAME, "ulx respawn", ulx.respawn, "!respawn" )
respawn:addParam{ type=ULib.cmds.PlayersArg }
respawn:addParam{ type=ULib.cmds.BoolArg, invisible=true }
respawn:defaultAccess( ULib.ACCESS_ADMIN )
respawn:help( "Respawns target(s)." )



function ulx.slaynr( calling_ply, target_plys ,rounds)
	local affected_plys = {}
local rounds=rounds
	for i=1, #target_plys do
		local v = target_plys[ i ]
	if SERVER then 
		v:SetPData("cake_slaynr",rounds ) 
		end
		table.insert( affected_plys, v )
	end
		ulx.fancyLogAdmin( calling_ply, "#A slayed #T for #s round(s)", affected_plys,rounds)
end
local slaynr = ulx.command( CATEGORY_NAME, "ulx slaynr", ulx.slaynr, "!slaynr" )
slaynr:addParam{ type=ULib.cmds.PlayersArg }
slaynr:addParam{ type=ULib.cmds.NumArg, hint="The amount of rounds to slay, defaults to 1", ULib.cmds.optional, min=1,default=1 }
slaynr:defaultAccess( ULib.ACCESS_ADMIN )
slaynr:help( "Slays a target for X amount of rounds." )

function ulx.rslaynr( calling_ply, target_plys)
	local affected_plys = {}
local rounds=rounds
	for i=1, #target_plys do
		local v = target_plys[ i ]
	if SERVER then 
		v:SetPData("cake_slaynr",0 ) 
		end
		table.insert( affected_plys, v )
	end
		ulx.fancyLogAdmin( calling_ply, "#A removed #T's slays", affected_plys)
end
local rslaynr = ulx.command( CATEGORY_NAME, "ulx rslaynr", ulx.rslaynr, "!rslaynr" )
rslaynr:addParam{ type=ULib.cmds.PlayersArg }
rslaynr:defaultAccess( ULib.ACCESS_ADMIN )
rslaynr:help( "Resets the slaynr amount to 0." )