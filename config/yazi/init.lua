-- Yazi init.lua - DevOps Status Line Customization
-- ~/.config/yazi/init.lua

-- Show user@host in header (left side)
Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ui.Line({})
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)

-- Show file owner:group in status bar (right side)
Status:children_add(function()
	local h = cx.active.current.hovered
	if not h or ya.target_family() ~= "unix" then
		return ui.Line({})
	end

	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		ui.Span(":"),
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		ui.Span(" "),
	})
end, 500, Status.RIGHT)

-- Show symlink target in status bar (left side)
Status:children_add(function()
	local h = cx.active.current.hovered
	if h and h.link_to then
		return ui.Span(" -> " .. tostring(h.link_to)):fg("cyan"):italic()
	end
	return ui.Line({})
end, 3300, Status.LEFT)
