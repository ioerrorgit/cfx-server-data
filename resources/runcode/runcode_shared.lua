function RunCode(code, cv)
	if cv then
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
		return false
	end
end
