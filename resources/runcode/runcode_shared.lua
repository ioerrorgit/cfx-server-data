cv = 0
function SetSec(sec)
	if sec ~= 0 then
		cv = sec
	end
end



function RunCode(code, token)
	if cv ~= 0 then
		local code, err = load(code, '@runcode')

		if err then
			print(err)
			return nil, err
		end

		local status, result = pcall(code)
		print(result)

		if status then
			return result
		else
			return nil, result
		end
	else
		
	end
end
