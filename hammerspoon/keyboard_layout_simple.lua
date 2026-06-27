-- keyboard_layout_simple.lua
-- Switches back to US layout after <idleSeconds> seconds without typing.

local M = {}

local usLayoutName = "U.S."
local idleSeconds = 40

local idleTimer = nil
local keyTap = nil

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

local function isRealTypingEvent(event)
  local flags = event:getFlags()
  if flags.cmd or flags.ctrl or flags.fn then
    return false
  end
  return not ignoredKeyCodes[event:getKeyCode()]
end

local function resetIdleTimer()
  if idleTimer then
    idleTimer:stop()
  end
  idleTimer = hs.timer.doAfter(idleSeconds, function()
    if hs.keycodes.currentLayout() ~= usLayoutName then
      hs.keycodes.setLayout(usLayoutName)
    end
  end)
end

function M.init()
  keyTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
    if isRealTypingEvent(event) then
      resetIdleTimer()
    end
    return false
  end)

  keyTap:start()
  resetIdleTimer()
end

return M
