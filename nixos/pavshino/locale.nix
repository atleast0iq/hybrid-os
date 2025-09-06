{...}: {
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;

  location = {
    provider = "manual";
    latitude = 55.854634;
    longitude = 37.634669;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_GB.UTF-8";
}
