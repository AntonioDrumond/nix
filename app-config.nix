{ config, pkgs, ... }:

{
# autocpufreq
    #services.auto-cpufreq.settings = {
    #  battery = {
    #    governor = "powersave";
    #    turbo = "never";
    #  };
    #  charger = {
    #    governor = "performance";
    #    turbo = "auto";
    #  };
    #};

#TLP
    services.power-profiles-daemon.enable = false;
    services.tlp = {
        enable = true;
        settings = {
            # profile
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
            CPU_ENERGY_PERF_POLICY_ON_AC = "powersave";

            CPU_MIN_PERF_ON_AC = 0;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_MAX_PERF_ON_BAT = 20;

            # Optional helps save long term battery health
            START_CHARGE_THRESH_BAT0 = 90;
            STOP_CHARGE_THRESH_BAT0 = 100;
            # se tiver esquentando
                # TLP_DEFAULT_MODE = "BAT";
                # TLP_PERSISTENT_DEFAULT = 1;
        };
    };
}
