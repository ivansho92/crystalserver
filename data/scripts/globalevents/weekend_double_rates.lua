-- Local test: activate at 22:00 (10pm) on localhost (PC local time)
-- Window: 22:00 to 22:05 (quick test)
-- Broadcast to all players on start/stop.

local ge = GlobalEvent("WeekendDoubleRatesLocalTest")

local config = {
  expRate = 200,     -- 200% = x2
  skillRate = 200,   -- 200% = x2
  windowsLocal = {
    -- Lua: 1=Sunday ... 7=Saturday
    [1] = { { start = "22:00", finish = "22:05" } },
    [2] = { { start = "22:00", finish = "22:05" } },
    [3] = { { start = "22:00", finish = "22:05" } },
    [4] = { { start = "22:00", finish = "22:05" } },
    [5] = { { start = "22:00", finish = "22:05" } },
    [6] = { { start = "22:00", finish = "22:05" } },
    [7] = { { start = "22:00", finish = "22:05" } },
  },
}

local function hmToMinutes(hm)
  local h, m = hm:match("^(%d%d):(%d%d)$")
  return tonumber(h) * 60 + tonumber(m)
end

local function isActiveNowLocal()
  local t = os.date("*t") -- LOCAL time (your PC)
  local now = t.hour * 60 + t.min

  local dayWindows = config.windowsLocal[t.wday]
  if not dayWindows then
    return false
  end

  for _, w in ipairs(dayWindows) do
    local a = hmToMinutes(w.start)
    local b = hmToMinutes(w.finish)

    if a <= b then
      if now >= a and now < b then return true end
    else
      if now >= a or now < b then return true end
    end
  end

  return false
end

local function broadcastAll(msg)
  -- Most TFS-based cores:
  if Game and Game.broadcastMessage then
    Game.broadcastMessage(msg)
    return
  end

  -- Fallbacks (depending on your fork):
  if broadcastMessage then
    broadcastMessage(msg)
    return
  end

  -- Last resort: console log only
  print("[WeekendDoubleRatesLocalTest] (no broadcast API found) " .. msg)
end

local lastActive = nil

function ge.onThink(interval, lastExecution)
  local active = isActiveNowLocal()

  local desiredExp = active and config.expRate or 100
  local desiredSkill = active and config.skillRate or 100

  if SCHEDULE_EXP_RATE ~= desiredExp then
    SCHEDULE_EXP_RATE = desiredExp
  end
  if SCHEDULE_SKILL_RATE ~= desiredSkill then
    SCHEDULE_SKILL_RATE = desiredSkill
  end

  if lastActive == nil then
    lastActive = active
  elseif active ~= lastActive then
    lastActive = active
    if active then
      broadcastAll("TEST LOCAL: Evento x2 ACTIVADO (EXP + Skills + Magic) - " .. os.date("%Y-%m-%d %H:%M:%S"))
    else
      broadcastAll("TEST LOCAL: Evento x2 DESACTIVADO (rates normales) - " .. os.date("%Y-%m-%d %H:%M:%S"))
    end
  end

  return true
end

-- Check often so you see it instantly
ge:interval(5 * 1000)
ge:register()