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

function M.values(t)
  local values = {}
  for _, v in pairs(t) do
    table.insert(values, v)
  end
  return values
end

return M
