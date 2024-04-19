{ config, pkgs, lib, inputs, ... }: {
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_GB.UTF-8";
}
