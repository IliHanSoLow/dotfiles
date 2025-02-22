local log = require("internal.log")
local awful = require("awful")
local gears = require("gears")


local function hide_rest(active)
  if active.maximized or active.fullscreen then
    return true
  end

  local t = active.first_tag or nil
  if t and t.layout.name == "max" then
    return true
  end

  return false
end

local function hide_others(c)
  local t = c.first_tag or nil
  if t == nil then
    log.debug("tag not found: %s", c.name)
    return
  end

  local hide = hide_rest(c)
  log.debug("HIDE REST %s", hide)
  log.debug("CLIENTS %d", #t:clients())
  for _, other in ipairs(t:clients()) do
    if c ~= other then
      log.debug("MINIMIZED %s %s", hide, other.name)
      --if not other.minimized == hide then
      other.minimized = hide
      --end
    end
  end

  if hide then
    c.screen.mywibox.visible = false
  else
    c.screen.mywibox.visible = not c.screen.my_wibox_manually_hidden
  end
end

local function alert(text)
  naughty.notify({ text = text, timeout = 20, bg = "#000000" })
end

tag.connect_signal("property::layout", function(t)
  local c = client.focus
  if not c then
    log.debug("property::layout 10 c is nil")
    return
  end
  local msg = "EVENT property::layout " .. c.name .. "\n"
  msg = msg .. "layout=" .. t.layout.name .. "\n"

  log.debug(msg)
  hide_others(c)
end)

client.connect_signal("property::maximized", function(c)
  log.debug("EVENT property::maximized " .. c.name)
  hide_others(c)
end)

client.connect_signal("property::fullscreen", function(c)
  log.debug("EVENT property::fullscreen " .. c.name)
  hide_others(c)
end)

client.connect_signal("my:toggle_wibox", function(from)
  local screen = awful.screen.focused()
  local wb = screen.mywibox
  wb.visible = not wb.visible
  -- track when wibox is manually hidden so when the
  -- wibox is hidden by fullscreen the wibox state can
  -- be restored properly
  screen.my_wibox_manually_hidden = not wb.visible
end)

-- DO NOT use focus, equest::activate handles more scenarios.
client.connect_signal("request::activate", function(c)
  log.debug("EVENT request::activate " .. c.name)
  hide_others(c)
end)

local M = {}

-- focus_by_idx is similar to client.focus.byidx, but it considers minimized clients.
-- This is mainlu used for layouts like "max" and when the "master" window is using transparency.
-- background windows should be minimized.
function M.focus_by_idx(i, sel)
  sel = sel or client.focus
  if sel then
    local cls = client.get(sel.screen)
    local tags = sel.screen.selected_tags
    -- Compile a list of all candidate clients
    local candidates = {}
    for _, c in pairs(cls) do
      if awful.client.focus.filter(c) or sel == c then
        local found = false
        for _, t in pairs(c:tags()) do
          if gears.table.hasitem(tags, t) then
            found = true
          end
        end
        if found then
          table.insert(candidates, c)
        end
      end
    end
    -- Now find the next client
    local idx = gears.table.hasitem(candidates, sel)
    local nextIdx = gears.math.cycle(#candidates, idx + i)
    local target = candidates[nextIdx]
    -- and focus it
    if target then
      log.debug(string.format("target=%s idx=%d len=%d nextIdx=%d", target.name, idx, #candidates, nextIdx))
      target.minimized = false
      target:emit_signal("request::activate", "client.focus.byidx", { raise = true })
    end
  end
end

return M
