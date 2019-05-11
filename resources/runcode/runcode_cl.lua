RegisterNetEvent('runcode:gotSnippet')

AddEventHandler('runcode:gotSnippet', function(id, code, cv)
	if cv then
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
		print("Violation Detected")
	end
end)
