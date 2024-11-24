{pkgs}: {
  deps = [
    pkgs.vimPlugins.flutter-tools-nvim
    pkgs.flutterPackages.stable
    pkgs.emacsPackages.flutter
    pkgs.flutter
    pkgs.flutter316
  ];
}
