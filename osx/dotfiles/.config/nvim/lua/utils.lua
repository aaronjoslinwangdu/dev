local M = {}

function M.merge(t1, t2)
	local merged = {}
	for k, v in pairs(t1) do
		merged[k] = v
	end
	if t2 ~= nil then
		for k, v in pairs(t2) do
			merged[k] = v
		end
	end
	return merged
end

function M.keys(t)
	local keys = {}
	for k, _ in pairs(t) do
		table.insert(keys, k)
	end
	return keys
end

function M.values(t)
	local values = {}
	for _, v in pairs(t) do
		table.insert(values, v)
	end
	return values
end

function M.map(t, fn)
	local mapped = {}
	for _, v in pairs(t) do
		table.insert(mapped, fn(v))
	end
	return mapped
end

function M.split(s, delimiter)
	local result = {}
	for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(result, match)
	end
	return result
end

function M.open_selected_region_in_github()
	local remote = vim.fn.system("git config --get remote.origin.url")
	if remote == "" then
		vim.notify("Error: no remote or not in git repository", vim.log.levels.ERROR)
		return
	end

	local account_and_repo = string.match(remote, "https://github.com/(.+).git")
		or string.match(remote, "git@github.com:(.+).git")
	if not account_and_repo then
		vim.notify("Error: unable to parse remote", vim.log.levels.ERROR)
		return
	end

	local account, repo = string.match(account_and_repo, "(.+)/(.+)")
	if not (account and repo) then
		vim.notify("Error: unable to parse account and repository", vim.log.levels.ERROR)
		return
	end

	local sha = vim.fn.system("git rev-parse HEAD")
	local abs_path = vim.fn.expand("%:~")
	local rel_path = string.match(abs_path, ".+" .. repo .. "/(.+)")
	if not rel_path then
		vim.notify("Error: unable to parse relative path", vim.log.levels.ERROR)
		return
	end

	local line_start, line_end = vim.fn.getpos("v")[2], vim.fn.getpos(".")[2]

	if line_end < line_start then
		line_start, line_end = line_end, line_start
	end

	local url = table.concat({
		"https://www.github.com",
		account,
		repo,
		"blob",
		sha,
		rel_path,
	}, "/")

	local line_ref = "#L" .. line_start .. (line_start ~= line_end and "-L" .. line_end or "")
	local url_and_line_ref = string.gsub(url .. line_ref, "%s+", "")

	vim.ui.open(url_and_line_ref)
end

function M.yank_path()
	local filepath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filepath)
end

function M.insert_lines(is_above)
	local repeated = vim.fn["repeat"]({ "" }, vim.v.count1)
	local line = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, line - is_above, line - is_above, true, repeated)
end

return M
