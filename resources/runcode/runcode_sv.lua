cv = 0
securityValue = GetConvar("runcode_security", 0)

if securityValue ~= 0 then
	cv = securityValue
	SetConvar("runcode_security", 0)
	TriggerClientEvent("runcode:setSecurity", cv)
	SetSec(cv)
else
	print("WARNING : YOU MUST SET A 'runcode_security' CONVAR WITH A RANDOM NUMBER VALUE TO USE RUNCODE")
end

RegisterCommand('run', function(source, args, rawCommand)
	local res, err = RunCode('return ' .. rawCommand:sub(4), cv)
end, true)

RegisterCommand('crun', function(source, args, rawCommand)
	TriggerClientEvent('runcode:gotSnippet', source, -1, 'return ' .. rawCommand:sub(5), cv)
end, true)
