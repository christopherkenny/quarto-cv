
-- checks these so they can be prefixed for list-[listing]
local function check_listing(listing)
  local validListings = {
    "education"
  }
  for _, v in ipairs(validListings) do
    if v == listing then
      return listing
    end
  end
  return ""
end

return {
  ['cv'] = function(args, kwargs, meta)
    -- first arg: listing type
    -- second: file

    if not quarto.doc.is_format("typst") then
      quarto.log.warning("The cv shortcode only supports typst output. No action performed.")
      return pandoc.Null()
    end

    local file = "hello"
    if #args == 0 then
      quarto.log.warning("No arguments to cv shortcode. No action performed.")
      return pandoc.Null()
    elseif  #args == 1 then
      listing = pandoc.utils.stringify(args[1])
      file = listing .. ".yaml"
    else
      listing = pandoc.utils.stringify(args[1])
      file = pandoc.utils.stringify(args[2])
    end

    listing = check_listing(listing)
    if listing == "" then
      quarto.log.warning("cv shortcode listing not valid. No action performed.")
      return pandoc.Null()
    end

    return pandoc.RawInline("typst", "#list-" .. listing .. "(\"" .. file .. "\")")
  end
}
