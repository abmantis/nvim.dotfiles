local helpers = {}

local function normalize_path(path)
    return path:gsub("\\", "/")
end

local function normalize_cwd()
    return normalize_path(vim.loop.cwd()) .. "/"
end

local function is_subdirectory(cwd, path)
    return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
end

local function split_filepath(path)
    local normalized_path = normalize_path(path)
    local normalized_cwd = normalize_cwd()
    local filename = normalized_path:match("[^/]+$")

    if is_subdirectory(normalized_cwd, normalized_path) then
        local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
        return stripped_path, filename
    else
        local stripped_path = normalized_path:sub(1, -(#filename + 1))
        return stripped_path, filename
    end
end

helpers.path_display = function(_, path)
    local stripped_path, filename = split_filepath(path)
    if filename == stripped_path or stripped_path == "" then
        return filename
    end
    return string.format("%s - %s", filename, stripped_path)
end

return helpers

