{ lib, ... }:

{
  dconf = {
    enable = true;
    
    settings = {
      "org/gnome/mutter".experimental-features = [ "variable-refresh-rate" ];
      "org/gnome/shell/app-switcher".current-workspace-only = true;
      "org/gnome/desktop/ally/interface".show-status-shapes = true;
      "org/gnome/desktop/datetime".automatic-timezone = true;
      "org/gnome/desktop/remote-desktop/rdp".enable = false;
      "org/gnome/desktop/calendar".show-weekdate = true;
      "org/gnome/desktop/sound".event-sounds = false;

      "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "nothing";
      "org/gnome/desktop/session".idle-delay = (lib.hm.gvariant.mkUint32 900);
      
      "org/gnome/shell/extensions/caffeine".enable-fullscreen = false;
      "org/gnome/shell/extensions/blur-my-shell".settings-version = 2;
      
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-enable-primary-paste = true;
        show-battery-percentage = true;
        clock-show-seconds = true;
        clock-show-weekday = true;
      };
      
      "org/gnome/desktop/notifications" = {
        show-in-lock-screen = true;
        show-banners = true;
      };
      
      "org/gnome/desktop/peripherals/touchpad" = {
        click-method = "areas";
        two-finger-scrolling-enabled = true;
        disable-while-typing = false;
        tap-to-click = true;
      };
      
      "org/gnome/desktop/privacy" = {
        recent-files-max-age = -1;
        remember-recent-files = false;
        remove-old-temp-files = true;
        remove-old-trash-files = true;
        report-technical-problems = false;
      };
      
      "org/gnome/desktop/screensaver" = {
        color-shading-type = "solid";
        lock-delay = 30;
      };
      
      "org/gnome/desktop/wm/preferences" = {
        action-middle-click-titlebar = "minimize";
        button-layout = "appmenu:minimize,close";
        focus-mode = "click";
        auto-raise = false;
      };
      
      "org/gnome/shell" = {
        disabled-user-extensions = false;
        remember-mount-password = true;
        
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "caffeine@patapon.info"
          "dash-to-dock@micxgx.gmail.com"
          "mediacontrols@cliffniff.github.com"
          "pip-on-top@rafostar.github.com"
        ];
        
        favorite-apps = [
          "io.github.zen_browser.zen.desktop"
          "dev.zed.Zed.desktop"
          "idea-ultimate.desktop"
          "clion.desktop"
          "rust-rover.desktop"
          "pycharm-professional.desktop"
          "com.jetbrains.Rider.desktop"
        ];
      };
            
      "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
        blur = false;
        brightness = 0.6;
        sigma = 30;
        style-dialogs = 0;
      };
      
      "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
        blur = false;
        brightness = 0.6;
        pipeline = "pipeline_default_rounded";
        sigma = 30;
        static-blur = true;
        style-dash-to-dock = 0;
      };
      
      "org/gnome/shell/extensions/blur-my-shell/panel" = {
        brightness = 0.6;
        override-background = true;
        override-background-dynamically = false;
        pipeline = "pipeline_default";
        sigma = 30;
        static-blur = true;
        unblur-in-overview = true;
      };
      
      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = false;
        background-color = "rgb(0,0,0)";
        background-opacity = 0.45;
        custom-background-color = true;
        custom-theme-shrink = true;
        customize-alphas = true;
        dash-max-icon-size = 64;
        intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
        isolate-locations = true;
        isolate-workspaces = true;
        max-alpha = 0.5;
        min-alpha = 0.2;
        running-indicator-style = "DASHES";
        show-favorites=true;
        show-icons-emblems = false;
        show-mounts-only-mounted = false;
        show-show-apps-button = true;
        show-trash = false;
        transparency-mode = "FIXED";
      };

      "org/gnome/shell/extensions/mediacontrols" = {
        extension-index = (lib.hm.gvariant.mkUint32 1);
        extension-position = "Left";
      };
    };
  };
}
