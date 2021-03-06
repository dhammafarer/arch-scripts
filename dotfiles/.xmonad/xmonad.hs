import           Data.Default
import qualified Data.Map                        as M
import           Graphics.X11.ExtraTypes.XF86
import           System.Exit
import           System.IO
import           XMonad                          hiding ((|||))
import           XMonad.Actions.CycleWS
import           XMonad.Actions.PhysicalScreens
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Hooks.SetWMName
import           XMonad.Layout.Fullscreen
import           XMonad.Layout.Gaps
import           XMonad.Layout.LayoutCombinators
import           XMonad.Layout.NoBorders
import           XMonad.Layout.PerWorkspace
import           XMonad.Layout.Spacing
import           XMonad.Layout.Spiral
import           XMonad.Layout.Tabbed
import           XMonad.Layout.ThreeColumns
import           XMonad.Layout.TwoPane
import qualified XMonad.StackSet                 as W
import           XMonad.Util.EZConfig            (additionalKeys)
import           XMonad.Util.Run                 (spawnPipe)


------------------------------------------------------------------------
-- Terminal
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal = "urxvt -fn 'xft:Fira Code:style=Regular:size=14,xft:DejaVu Sans Mono:style=Book:size=14,xft:Noto Sans CJK TC Medium:style=Medium,xft:DejaVu Sans:style=Medium,xft:Noto Emoji-14'"

myBrowser = "firefox"
myBrowserPrivate = "firefox --private-window"

-- The command to lock the screen or show the screensaver.
myScreensaver = "/usr/bin/xscreensaver-command -l"

-- The command to take a selective screenshot, where you select
myDelayedScreenshot = "maim -d 3 ~/shots/$(date +%Y-%m-%d_%T).png"

mySelectScreenshot = "maim -s -u | xclip -selection clipboard -t image/png -i"

myScreenshot = "maim -u | xclip -selection clipboard -t image/png -i"

-- The command to use as a launcher, to launch commands that don't have
-- preset keybindings.
myLauncher = "$(yeganesh -x -- -fn 'monospace-8' -nb '#000000' -nf '#FFFFFF' -sb '#7C7C7C' -sf '#CEFFAC')"

-- Location of your xmobar.hs / xmobarrc
myXmobarrc = "~/.xmonad/xmobar-single.hs"

-- Spacing between windows
mySpacing = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True

------------------------------------------------------------------------
-- Workspaces
-- The default number of workspaces (virtual screens) and their names.
--
one   = "\xf120"
two   = "\xf109"
three = "\xf4ad"
four  = "\xf87c"
five  = "\xf1b2"
six   = "\xf17a"
seven = "\xf268"

myWorkspaces = [one,two,three,four,five,six,seven] ++ map show [8..9]


------------------------------------------------------------------------
-- Window rules
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ resource  =? "desktop_window"     --> doIgnore
    , className =? "Pidgin"             --> doShift three
    , className =? "Thunderbird"        --> doShift three
    , className =? "discord"            --> doShift three
    , className =? "Signal"             --> doShift three
    , className =? "Gimp"               --> doShift four
    , className =? "Blender"            --> doShift five
    --, className =? "vlc"                --> doShift four
    --, className =? "mpv"                --> doShift four
    --, className =? "smplayer"           --> doShift four
    , className =? "Emacs"              --> doShift five
    , className =? "superProductivity"  --> doShift six
    , className =? "libreoffice-writer" --> doShift five
    , resource  =? "gpicview"           --> doFloat
    , className =? "MPlayer"            --> doFloat
    , className =? "VirtualBox Manager" --> doShift six
    , className =? "Qemu-system-x86_64" --> doShift five
    , className =? "krita"              --> doShift two
    , className =? "stalonetray"        --> doIgnore
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)]


------------------------------------------------------------------------
-- Layouts
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
l0 = avoidStruts (
      ThreeColMid 1 (3/100) (1/2)
      ||| tabbed shrinkText tabConfig
      ||| Full
      ||| TwoPane (3/100) (1/2)
      ||| Mirror (TwoPane (3/100) (1/2))
      ||| Tall 1 (3/100) (1/2)
      ||| Mirror (Tall 1 (3/100) (1/2))
      ||| spiral (6/7)
    )
    ||| noBorders (fullscreenFull Full)

gft = avoidStruts (
      gaps [(U,128),(R,512),(L,512),(D,128)] $
      Full
      ||| Tall 1 (3/100) (1/2)
    )

ft = avoidStruts (
      Full
      ||| Tall 1 (3/100) (1/2)
    )

gt2f = avoidStruts (
      gaps [(U,128),(R,512),(L,512),(D,128)] $
      Tall 2 (3/100) (1/2)
      ||| Full
    )

fsf= noBorders (fullscreenFull Full)

myLayout = onWorkspace one gft
           $ onWorkspace two fsf
           $ onWorkspace three gt2f
           $ onWorkspace four fsf
           $ onWorkspace five ft
           $ onWorkspace six fsf
           $ onWorkspace seven gft
           l0

------------------------------------------------------------------------
-- Colors and borders
--
blue = "#5294e2"
darkblue = "#506d9c"
bgcolor = "#2f343f"
yellow = "#ffbd7a"
white = "#D3D7CF"
pink = "#e96a9d"
myNormalBorderColor  = bgcolor
myFocusedBorderColor = darkblue
xmobarTitleColor = white
xmobarCurrentWorkspaceColor = white
myBorderWidth = 1

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = defaultTheme {
    --fontName = "xft:SFNS Display:size=10,FontAwesome:size=10",
    activeBorderColor = "#2E3436",
    activeTextColor = "#f3f4f5",
    activeColor = "#2E3436",
    inactiveBorderColor = "#2E3436",
    inactiveTextColor = "#676E7D",
    inactiveColor = "#2E3436"
}

------------------------------------------------------------------------
-- Key bindings
--
myModMask = mod4Mask

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  ----------------------------------------------------------------------
  -- Custom key bindings
  --

  -- Start a terminal.  Terminal to start is specified by myTerminal variable.
  [ ((modMask, xK_Return), spawn $ XMonad.terminal conf)

  -- Start a browser
  , ((modMask, xK_i), spawn myBrowser)

  -- Start a browser in private winow
  , ((modMask .|. controlMask, xK_i), spawn myBrowserPrivate)

  -- Spawn the launcher using command specified by myLauncher.
  , ((modMask, xK_k), spawn myLauncher)

  -- Mute volume.
  , ((0, xF86XK_AudioMute), spawn "amixer -q set Master toggle ")

  -- Decrease volume.
  , ((0, xF86XK_AudioLowerVolume), spawn "amixer -q set Master 5%- && volnoti-show $(amixer get Master | grep -Po '[0-9]+(?=%)' | tail -1)")

  -- Increase volume.
  , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q set Master 5%+ && volnoti-show $(amixer get Master | grep -Po '[0-9]+(?=%)' | head -1)")

  -- Mute volume.
  , ((modMask .|. controlMask, xK_k), spawn "amixer -q set Master toggle")

  -- Decrease volume.
  --, ((modMask .|. controlMask, xK_j), spawn "amixer -q set Master 5%-")

  -- Increase volume.
  --, ((modMask .|. controlMask, xK_m), spawn "amixer -q set Master 5%+")

  -- Run Huion setup
  , ((modMask, xK_F10), spawn "~/arch-scripts/dotfiles/$HUION")

  -- Finish pomodoro
  , ((modMask, xK_F1), spawn "/home/pawel/.xmonad/bin/pomo.sh stop")

  -- Start pomodoro
  , ((modMask, xK_F2), spawn "/home/pawel/.xmonad/bin/pomo.sh start")

  -- Lock the screen using command specified by myScreensaver.
  , ((modMask, xK_F3), spawn myScreensaver)

  -- Take a full screenshot using the command specified by myScreenshot.
  , ((modMask, xK_F4), spawn mySelectScreenshot)

  -- Take a selective screenshot using the command specified by mySelectScreenshot.
  , ((modMask .|. controlMask .|. shiftMask, xK_i), spawn myDelayedScreenshot)

  -- Take a selective screenshot using the command specified by mySelectScreenshot.
  -- , ((modMask, xK_F1), spawn myScreenshot)


  -- Audio previous.
  --, ((0, 0x1008FF16), spawn "")
  , ((0, xF86XK_AudioPrev), spawn "cmus-remote --prev")

  -- Play/pause.
  --, ((0, 0x1008FF13), spawn "cmus-remote --pause")
  , ((0, xK_Pause), spawn "cmus-remote --pause")

  -- Audio next.
  --, ((0, 0x1008FF17), spawn "")
  , ((0, xF86XK_AudioNext), spawn "cmus-remote --next")

  -- Eject CD tray.
  , ((0, 0x1008FF2C), spawn "eject -T")

  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings
  --

  -- Close focused window.
  , ((modMask, xK_x), kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_g), sendMessage NextLayout)

  -- Jump to full screen.
  -- , ((modMask, xK_space), sendMessage $ JumpToLayout "Full")

  -- Jump to ThreeColMid.
  --, ((modMask, xK_b), sendMessage $ JumpToLayout "Tall")

  -- Jump to TwoPane
  , ((modMask, xK_j), sendMessage $ JumpToLayout "TwoPane")


  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_y), refresh)

  -- Move focus to the next window.
  , ((modMask, xK_d), windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_c), windows W.focusUp  )

  -- Move focus to the master window.
  , ((modMask, xK_v), windows W.focusMaster  )

  -- Swap the focused window and the master window.
  , ((modMask .|. shiftMask, xK_v), windows W.swapMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. controlMask, xK_d), windows W.swapDown  )

  -- Swap the focused window with the previous window.
  , ((modMask .|. controlMask, xK_c), windows W.swapUp    )

  -- Shrink the master area.
  , ((modMask, xK_h), sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l), sendMessage Expand)

  -- Next Screen.
  --, ((modMask, xK_space), nextScreen)

  -- Gaps bindings
  , ((modMask .|. controlMask, xK_g), sendMessage $ ToggleGaps)               -- toggle all gaps
  , ((modMask .|. controlMask, xK_l), sendMessage $ weakModifyGaps halveHor)  -- halve the left and right-hand gaps
  , ((modMask .|. controlMask, xK_h), sendMessage $ weakModifyGaps doubleHor)  -- double the left and right-hand gaps
  , ((modMask .|. controlMask, xK_u), sendMessage $ weakModifyGaps halveVer)  -- halve the up and down gaps
  , ((modMask .|. controlMask, xK_e), sendMessage $ weakModifyGaps doubleVer)  -- double the up and down gaps
  , ((modMask .|. controlMask, xK_n), sendMessage $ setGaps [(U,128),(R,512),(L,512),(D,128)]) -- reset the GapSpec

  -- Push window back into tiling.
  , ((modMask, xK_a), withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma), sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period), sendMessage (IncMasterN (-1)))

  -- Toggle the status bar gap.
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_m), io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask .|. shiftMask, xK_x), restart "xmonad" True)
  ]
  -- view screen
  ++

  [((modMask .|. mask, key), f sc)
    | (key, sc) <- zip [xK_space, xK_n] [0..]
    , (f, mask) <- [(viewScreen def, 0), (sendToScreen def, shiftMask)]]

  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) ([xK_r, xK_b, xK_t, xK_w, xK_f, xK_p, xK_s] ++ [xK_8 .. xK_9])
      , (f, m) <- [(W.greedyView, 0), (W.shift, controlMask)]]

    where halveHor d i  | d `elem` [L,R] = i `div` 2
                        | otherwise       = i
          doubleHor d i | d `elem` [L,R] = i * 2
                        | otherwise       = i
          halveVer d i  | d `elem` [U,D] = i `div` 2
                        | otherwise       = i
          doubleVer d i | d `elem` [U,D] = i * 2
                        | otherwise       = i

------------------------------------------------------------------------
-- Mouse bindings
--
-- Focus rules
-- True if your focus should follow your mouse cursor.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask .|. shiftMask, button1), (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
     , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
     , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]

------------------------------------------------------------------------
-- Status bars and logging
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
-- To emulate dwm's status bar
--
-- > logHook = dynamicLogDzen
--


------------------------------------------------------------------------
-- Startup hook
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
-- myStartupHook = return ()
myStartupHook = do
    spawn "$HOME/.xmonad/scripts/autostart.sh"
    setWMName "LG3D"

------------------------------------------------------------------------
-- Run xmonad with all the defaults we set up.
--
main = do
  xmproc <- spawnPipe ("xmobar " ++ myXmobarrc)
  xmonad $ defaults {
      logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmproc
          , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
          , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
          , ppSep = "   "
      }
      , manageHook = manageDocks <+> myManageHook
      , handleEventHook = docksEventHook
  }


------------------------------------------------------------------------
-- Combine it all together
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--

defaults = defaultConfig {
    -- simple stuff
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys               = myKeys,
    mouseBindings      = myMouseBindings,

    -- hooks, layouts
    layoutHook         = mySpacing $ smartBorders $ myLayout,
    manageHook         = myManageHook,
    startupHook        = myStartupHook
}
