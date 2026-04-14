-- keyboard_layout.lua
-- Handles:
-- 1. Auto-switch back to US after inactivity while using Spanish layout
-- 2. Immediate switch to US when focusing certain apps (e.g. VS Code, Obsidian)

local M = {}

-- Configuration
local spanishLayoutName = "Spanish"   -- Change if needed (e.g. "Spanish - ISO")
local usLayoutName = "U.S."           -- Or "ABC" depending on your setup
local idleSeconds = 60                -- Time before auto-switch back

-- Apps that should always force US layout when focused
local forceUSApps = {
  ["Code"] = true,       -- VS Code
  ["Obsidian"] = true,
}

-- Internal state
local idleTimer = nil    -- Timer that triggers layout switch
local keyTap = nil       -- Event listener for key presses
local appWatcher = nil   -- Watches for app focus changes

-- Check if current layout is Spanish
local function isSpanishActive()
  return hs.keycodes.currentLayout() == spanishLayoutName
end

-- Switch to US layout (only if not already active)
local function switchToUS()
  if hs.keycodes.currentLayout() ~= usLayoutName then
    hs.keycodes.setLayout(usLayoutName)
  end
end

-- Stop all tracking (timer + key listener)
local function stopIdleTracking()
  if idleTimer then
    idleTimer:stop()
    idleTimer = nil
  end

  if keyTap then
    keyTap:stop()
    keyTap = nil
  end
end

-- Reset the inactivity timer
-- Called whenever "real typing" happens
local function resetIdleTimer()
  if idleTimer then
    idleTimer:stop()
  end

  idleTimer = hs.timer.doAfter(idleSeconds, function()
    -- When timer fires → stop tracking and switch layout
    stopIdleTracking()
    switchToUS()
  end)
end

-- Determine whether a key event represents "real typing"
-- (i.e., actual text input, not navigation or shortcuts)
local function isRealTypingEvent(event)
  local keyCode = event:getKeyCode()
  local flags = event:getFlags()

  -- Ignore shortcuts (Cmd, Ctrl, Fn)
  if flags.cmd or flags.ctrl or flags.fn then
    return false
  end

  -- Ignore non-text keys (navigation, modifiers, etc.)
  local ignoredKeyCodes = {
    [48] = true,  -- tab
    [51] = true,  -- delete
    [53] = true,  -- escape
    [54] = true,  -- right command
    [55] = true,  -- left command
    [56] = true,  -- left shift
    [57] = true,  -- caps lock
    [58] = true,  -- left option
    [59] = true,  -- left control
    [60] = true,  -- right shift
    [61] = true,  -- right option
    [62] = true,  -- right control
    [63] = true,  -- function
    [71] = true,  -- keypad clear
    [72] = true,  -- volume up
    [73] = true,  -- volume down
    [74] = true,  -- mute
    [79] = true,  -- keypad /
    [80] = true,  -- keypad enter
    [81] = true,  -- keypad =
    [82] = true,  -- keypad 0
    [83] = true,  -- keypad 1
    [84] = true,  -- keypad 2
    [85] = true,  -- keypad 3
    [86] = true,  -- keypad 4
    [87] = true,  -- keypad 5
    [88] = true,  -- keypad 6
    [89] = true,  -- keypad 7
    [91] = true,  -- keypad 8
    [92] = true,  -- keypad 9
    [96] = true,  -- F5
    [97] = true,  -- F6
    [98] = true,  -- F7
    [99] = true,  -- F3
    [100] = true, -- F8
    [101] = true, -- F9
    [103] = true, -- F11
    [105] = true, -- F13
    [106] = true, -- F16
    [107] = true, -- F14
    [109] = true, -- F10
    [111] = true, -- F12
    [113] = true, -- F15
    [114] = true, -- help
    [115] = true, -- home
    [116] = true, -- page up
    [117] = true, -- forward delete
    [118] = true, -- F4
    [119] = true, -- end
    [120] = true, -- F2
    [121] = true, -- page down
    [122] = true, -- F1
    [123] = true, -- left arrow
    [124] = true, -- right arrow
    [125] = true, -- down arrow
    [126] = true, -- up arrow
  }

  -- Everything else counts as typing (letters, numbers, accents, space, etc.)
  return not ignoredKeyCodes[keyCode]
end

-- Start tracking typing inactivity while in Spanish layout
local function startIdleTracking()
  -- Clean up any previous state first
  stopIdleTracking()

  -- Start initial timer
  resetIdleTimer()

  -- Listen for key presses
  keyTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
    -- If user already switched layout manually → stop everything
    if not isSpanishActive() then
      stopIdleTracking()
      return false
    end

    -- Only reset timer on real typing (not arrows, shortcuts, etc.)
    if isRealTypingEvent(event) then
      resetIdleTimer()
    end

    return false -- Don't block the event
  end)

  keyTap:start()
end

-- Public init function (called from init.lua)
function M.init()

  -- Listen for keyboard layout changes
  hs.keycodes.inputSourceChanged(function()
    if isSpanishActive() then
      -- Start inactivity tracking when switching to Spanish
      startIdleTracking()
    else
      -- Stop tracking if switching away (e.g., back to US manually)
      stopIdleTracking()
    end
  end)

  -- Watch for app focus changes
  appWatcher = hs.application.watcher.new(function(appName, eventType)
    if eventType == hs.application.watcher.activated and forceUSApps[appName] then
      -- When focusing certain apps → force US layout immediately
      stopIdleTracking()
      switchToUS()
    end
  end)

  appWatcher:start()
end

return M
