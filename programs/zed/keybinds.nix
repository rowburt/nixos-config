{ ... }:

{
  programs.zed-editor = {
    # TODO: Disable JetBrains keymap once custom keymap is done
    userSettings.base_keymap = "JetBrains";

    userKeymaps = [
      {
        # Execute 'run' in currently opened terminal
        # Run is an alias provided by nix flake
        bindings.ctrl-r = [
          "workspace::SendKeystrokes"
          "ctrl-` ctrl-c run enter ctrl-`"
        ];
      }
    ];
  };
}
