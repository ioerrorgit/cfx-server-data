cv = 0
RegisterNetEvent('runcode:setSecurity')

AddEventHandler('runcode:setSecurity', function(sec)
	cv = cv
end)


RegisterNetEvent('runcode:gotSnippet')

AddEventHandler('runcode:gotSnippet', function(id, code, token)
	if token == cv and cv ~= 0 then
		local res, err = RunCode(code)

		if not err then
			if type(res) == 'vector3' then
				res = json.encode({ table.unpack(res) })
			elseif type(res) == 'table' then
				res = json.encode(res)
			end
		end

		TriggerServerEvent('runcode:gotResult', id, res, err)
	else
		print("Set 'runcode_security' in server.cfg")
	end
end)
