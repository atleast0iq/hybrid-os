{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;

    package = pkgs.wrapFirefox (pkgs.firefox-unwrapped.override {pipewireSupport = true;}) {};

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DontCheckDefaultBrowser = true;

      # required by PotatoFox and not listed in firefox-addons flake
      ExtensionSettings = {
        "*".installation_mode = "force_installed";
        "userchrome-toggle-extended@n2ezr.ru" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4295256/userchrome_toggle_extended-1.5.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles.default = {
      id = 0;
      name = "Default";

      bookmarks = [];

      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        sponsorblock
        bitwarden

        # required by PotatoFox
        sidebery
        firefox-color
      ];

      settings = {
        "browser.startup.homepage" = "about:home";
        "browser.search.region" = "RU";
        "intl.accept_languages" = "ru,en-us,en";
        "intl.locale.requested" = "en-US,ru";

        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;

        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.partition.network_state.ocsp_cache" = true;

        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;

        "experiments.activeExperiment" = false;
        "experiments.enabled" = false;
        "experiments.supported" = false;
        "network.allow-experiments" = false;

        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "extensions.pocket.enabled" = false;
        "extensions.pocket.api" = "";
        "extensions.pocket.oAuthConsumerKey" = "";
        "extensions.pocket.showHome" = false;
        "extensions.pocket.site" = "";
        "extensions.autoDisableScopes" = 0;

        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        "identity.fxaccounts.enabled" = false;

        "app.normandy.first_run" = false;
        "browser.uitour.url" = false;
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":[],"nav-bar":["back-button","forward-button","customizableui-special-spring5","urlbar-container","customizableui-special-spring2","save-to-pocket-button","downloads-button","fxa-toolbar-menu-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["developer-button"],"dirtyAreaCache":["nav-bar","PersonalToolbar"],"currentVersion":20,"newElementCount":6}'';
      };

      search = {
        default = "Google";
        privateDefault = "Google";
      };

      userChrome = ''
        @import "PotatoFox/userChrome.css";
      '';

      userContent = ''
        @import "PotatoFox/userContent.css";
      '';
    };
  };

  home.file.".mozilla/firefox/${config.programs.firefox.profiles.default.path}/user.js" = {
    source = ./PotatoFox/user.js;
  };

  home.file."PotatoFox" = {
    target = ".mozilla/firefox/default/chrome/PotatoFox";
    source = ./PotatoFox/chrome;
  };
}
