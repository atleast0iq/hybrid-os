{...}: let
  c = "C.UTF-8";
  dk = "en_DK.UTF-8";
  gb = "en_GB.UTF-8";
  ie = "en_IE.UTF-8";
  ru = "ru_RU.UTF-8";
  us = "en_US.UTF-8";
  lang = "en_IE:en_US:en:C:ru_RU";
in {
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;

  location = {
    provider = "manual";
    latitude = 55.854634;
    longitude = 37.634669;
  };

  i18n.defaultLocale = ie;
  i18n.extraLocaleSettings = {
    LANGUAGE = lang;
    LC_TIME = dk;
    LC_ADDRESS = ru;
    LC_MONETARY = ru;
    LC_NUMERIC = ru;
    LC_PAPER = ru;
    LC_TELEPHONE = ru;
  };
  i18n.supportedLocales = map (x: "${x}/UTF-8") [
    c
    dk
    gb
    ie
    ru
    us
  ];
}
