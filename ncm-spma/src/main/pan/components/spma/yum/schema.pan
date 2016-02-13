# ${license-info}
# ${developer-info}
# ${author-info}

declaration template components/spma/yum/schema;

type spma_yum_plugin_fastestmirror = {
    'enabled' : boolean = false
    'verbose' : boolean = false
    'always_print_best_host' : boolean = true
    'socket_timeout' : long(0..) = 3
    'hostfilepath' : string = "timedhosts.txt"
    'maxhostfileage' : long(0..) = 10
    'maxthreads' : long(0..) = 15
    'exclude' ? string[]
    'include_only' ? string[]
};

type spma_yum_plugin_versionlock = {
    'enabled' : boolean = true
    'locklist' : string = '/etc/yum/pluginconf.d/versionlock.list'
    'follow_obsoletes' ? boolean
};

type spma_yum_plugin_priorities = {
    'enabled' : boolean = true
    'check_obsoletes' ? boolean
};

type spma_yum_plugins = {
    "fastestmirror" ? spma_yum_plugin_fastestmirror
    "versionlock" ? spma_yum_plugin_versionlock
    "priorities" ? spma_yum_plugin_priorities
};

@documentation{
    Configuration options for yum.conf.
    The cleanup_on_remove, obsoletes, reposdir and pluginpath are set internally.
}
type spma_yum_conf = {
    "exclude" ? string[]
    "installonly_limit" ? long(0..) = 3
    "keepcache" ? boolean
    "retries" ? long(0..) = 10
    "timeout" ? long(0..) = 30
};

type component_spma_yum = {
    "userpkgs_retry" : boolean = true
    "fullsearch" : boolean = false
    "plugins" ? spma_yum_plugins
    "yumconf" ? spma_yum_conf
};
