--
-- xmonad example config file for xmonad-0.9
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
-- NOTE: Those updating from earlier xmonad versions, who use
-- EwmhDesktops, safeSpawn, WindowGo, or the simple-status-bar
-- setup functions (dzen, xmobar) probably need to change
-- xmonad.hs, please see the notes below, or the following
-- link for more details:
--
-- http://www.haskell.org/haskellwiki/Xmonad/Notable_changes_since_0.8
--
 
import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Hooks.EwmhDesktops
import qualified Data.Map as M
import Control.Monad (liftM2)
import System.IO
import XMonad.Layout.LayoutHints
import XMonad.Layout.ComboP
import XMonad.Layout.LayoutCombinators hiding ((|||))
import XMonad.Layout.LayoutHints
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.TwoPane

myManageHook = composeAll . concat $
    [ 
      [ className =? "Xfce4-notifyd"      --> notFocus],
      [ className =? b --> viewShift "2:web"    | b <- myClassWebShifts],
      [ className =? c --> viewShift "4:read"    | c <- myClassReadShifts],
      [ className =? d --> viewShift "3:dev"    | d <- myClassDevShifts],
      [ className =? e --> viewShift "5:media"    | e <- myClassMediaShifts],
      [ className =? f --> viewShift "6:gimp"    | f <- myClassGimpShifts]
    ]
    where
      notFocus            = doF W.focusDown 
      viewShift           = doF . liftM2 (.) W.greedyView W.shift
      myClassWebShifts    = ["Firefox-bin", "Firefox", "Iceweasel"]
      myClassReadShifts    = ["Okular", "Xpdf"]
      myClassDevShifts    = ["Gvim", "Virt-manager", "Octave"]
      myClassMediaShifts    = ["Gmusicbrowser", "Mocp", "Vlc", "Xine"]
      myClassGimpShifts    = ["Gimp"]

myWorkspaces    = ["1:main","2:web","3:dev","4:read","5:media","6","7","8","9"]
 
myLayout = avoidStruts $ layoutHints $ onWorkspace "4:read" Full $ onWorkspace "2:web" Full $ smartBorders (tiled ||| Mirror tiled ||| Full)
  where
    tiled   = Tall nmaster delta ratio
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

main = do
    xmproc <- spawnPipe "xmobar /home/syslac/.xmobarrc"
    xmproc2 <- spawn "xmobar /home/syslac/.xmobarrc-bottom"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = myLayout
        , startupHook = startup
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 150
                        }
        , modMask = mod1Mask     -- Rebind Mod to the Alt key
        , workspaces          = myWorkspaces
        } `additionalKeys`
        [ ((mod1Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((mod1Mask .|. shiftMask, xK_s), spawn "sudo /usr/sbin/s2ram -f")
        , ((mod1Mask .|. shiftMask, xK_Return), spawn "gnome-terminal -e tmux")
        , ((mod4Mask, xK_t), spawn "gnome-terminal -e tmux")
        , ((mod4Mask, xK_w), spawn "iceweasel")
        , ((mod4Mask .|. shiftMask, xK_w), spawn "iceweasel gmail.com")
        , ((mod4Mask, xK_v), spawn "vlc")
        , ((mod4Mask, xK_d), spawn "okular")
        , ((mod4Mask, xK_e), spawn "gvim")
        , ((mod4Mask, xK_m), spawn "gmusicbrowser")
        , ((mod1Mask, xK_F2), spawn "gmrun")
        , ((mod1Mask, xK_F5), spawn "amixer -q set Master 5%+ unmute")
        , ((mod1Mask, xK_F4), spawn "amixer -q set Master 5%- unmute")
        , ((mod1Mask, xK_F9), spawn "gmusicbrowser -cmd NextSong")
        , ((mod1Mask, xK_F10), spawn "gmusicbrowser -cmd PlayPause")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]

startup :: X ()
startup = do
    spawn "/home/syslac/.xmonad/autostart/feh"
    spawn "/home/syslac/.xmonad/autostart/trayer"
    spawn "/home/syslac/.xmonad/autostart/vol"
    spawn "/home/syslac/.xmonad/autostart/wicd"
    spawn "/home/syslac/.xmonad/autostart/fetchmail"
    spawn "/home/syslac/.xmonad/autostart/ssaver"
    spawn "/home/syslac/.xmonad/autostart/lux"
    spawn "/home/syslac/.xmonad/autostart/dbox"
