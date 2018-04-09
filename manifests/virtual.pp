# Tags
#  - _base: for all servers
#  - _wdkprod: for production WDK servers
#  - _wdkdev: for development WDK servers
#  - _wflow: for workflow, data dev servers
#  - _orclsrv: oracle servers
#  - _orclcln: oracle clients
#  - _ciworker: for continuous integration worker nodes (e.g. Jenkins slaves)
#  - _libvirt: for libvirt/qemu hosts
#
# The underscores are to reduce the chances of
# realizing selected resources in a class having
# the same tag name and Puppet realizing everything
# due to its Automatic Tagging.
# https://docs.puppetlabs.com/puppet/latest/reference/lang_tags.html
#
#
# Conditionally declare packages _based on facts. For example,
# psgml is a separate package only on EL5
#   if $::operatingsystemmajrelease == '5' {
#     @package { 'psgml: tag => ['_wflow'] }
#   }
#
# To remove packages, mark as 'absent'
#   @package { 'conman': ensure => absent, tag => ['_base'] }

class ebrc_packages::virtual {

  # Absent
  @package { ['conman',]: ensure => absent, tag => ['_base'] }

  # Present
  @package { 'ack'                                 : tag => ['_base'] }
  @package { 'ansible'                             : tag => ['_wdkprod', '_wdkdev'] } # RM-26855
  @package { 'ant-contrib'                         : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # GUS build req.
  @package { 'ant'                                 : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # GUS build req.
  @package { 'aspell-en'                           : tag => ['_wdkprod', '_wdkdev'] } # RM-14577
  @package { 'aspell'                              : tag => ['_wdkprod', '_wdkdev'] } # RM-14577
  @package { 'at'                                  : tag => ['_base'] }
  @package { 'augeas'                              : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'bash-completion'                     : tag => ['_base'] }
  @package { 'bind-utils'                          : tag => ['_base'] }
  @package { 'bioblend'                            : tag => ['_wdkdev', '_wflow'] } # RM-18062
  @package { 'bzip2'                               : tag => ['_wdkdev', '_wflow'] } # RM-26591
  @package { 'clustalo'                            : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'clustalw'                            : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'cndsrc'                              : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'compat-libstdc++-33'                 : tag => ['_wdkdev', '_wflow', '_orclsrv'] } # RM-12921
  @package { 'compat-libcap1'                      : tag => ['_orclsrv'] }
  @package { 'dos2unix'                            : tag => ['_wdkdev', '_wflow'] } # RM-12921
  @package { 'ed'                                  : tag => ['_base'] }
  @package { 'elinks'                              : tag => ['_base'] }
  @package { 'emacs-nox'                           : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'emacs'                               : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'e-PCR'                               : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'expect'                              : tag => ['_wdkdev', '_wflow'] }
  @package { 'fail2ban-mail'                       : tag => ['_base'] }
  @package { 'gcc-c++'                             : tag => ['_wdkprod', '_wdkdev', '_wflow', '_orclsrv'] }
  @package { 'gcc'                                 : tag => ['_wdkprod', '_wdkdev', '_wflow', '_graphite'] }
  @package { 'gdb'                                 : tag => ['_wdkdev', '_wflow'] }
  @package { 'git'                                 : tag => ['_base'] }
  @package { 'graphviz-devel'                      : tag => ['_wflow'] } # RM-4559 (ReFlow GUI)
  @package { 'graphviz-gd'                         : tag => ['_wflow'] } # RM-4559 (ReFlow GUI)
  @package { 'graphviz'                            : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-4559 (ReFlow GUI), RM-24216 (WDK Javadoc)
  @package { 'ImageMagick-perl'                    : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-15537, RM-26236
  @package { 'iotop'                               : tag => ['_base'] }
  @package { 'iperf3'                              : tag => ['_base'] }
  @package { 'iptraf'                              : tag => ['_base'] }
  @package { 'jprofiler-agent'                     : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'jq'                                  : tag => ['_base'] } # general utility
  @package { 'ksh'                                 : tag => ['_orclsrv'] }
  @package { 'libaio'                              : tag => ['_base'] } # Oracle client
  @package { 'libaio-devel'                        : tag => ['_orclsrv'] }
  @package { 'libcurl-devel'                       : tag => ['_wdkdev', '_wflow'] } # RM-21383
  @package { 'libstdc++-devel'                     : tag => ['_orclsrv'] }
  @package { 'libxml2-devel'                       : tag => ['_wdkdev', '_wflow'] } # RM-21383
  @package { 'lsof'                                : tag => ['_base'] }
  @package { 'lua-socket'                          : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # lsyncd
  @package { 'make'                                : tag => ['_base'] }
  @package { 'mcl'                                 : tag => ['_wdkprod', '_wdkdev'] } # orthomcl proteome service
  @package { 'mdadm'                               : tag => ['_base'] }
  @package { 'mercurial'                           : tag => ['_wdkdev', '_wflow'] } # RM-10464
  @package { 'mlocate'                             : tag => ['_base'] }
  @package { 'moreutils'                           : tag => ['_wdkdev', '_wflow'] } # useful sponge command, et al.
  @package { 'mtr'                                 : tag => ['_base'] }
  @package { 'nc'                                  : tag => ['_base'] }
  @package { 'ncbi-blast+'                         : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'ncbi-blast2'                         : tag => ['_wdkprod', '_wdkdev'] } # orthomcl proteome service
  @package { 'psmisc'                              : tag => ['_base'] }
  @package { 'ncftp'                               : tag => ['_base'] }
  @package { 'ncurses-devel'                       : tag => ['_wdkdev', '_wflow'] } # RM-20614
  @package { 'nethogs'                             : tag => ['_base'] }
  @package { 'net-tools'                           : tag => ['_base'] }
  if $::is_virtual {
    @package { 'NetworkManager'                    : tag => ['_base'] }
  } else {
    @package { 'NetworkManager' : ensure => absent, tag => ['_base'] }
  }
  @package { 'NetworkManager-tui'   : ensure => absent, tag => ['_base'] }
  @package { 'nginx-upstream-update'               : tag => ['_nginx'] }
  @package { 'nmap'                                : tag => ['_base'] }
  @package { 'numpy'                               : tag => ['_wdkdev', '_wflow'] } # RM-17915
  @package { 'openldap-clients'                    : tag => ['_base'] }
  @package { 'parallel'                            : tag => ['_base'] } # general use, esp. for file xfers
  @package { 'patch'                               : tag => ['_base'] }
  @package { 'p7zip'                               : tag => ['_wflow'] } # RM-8985
  @package { 'perl-Apache-DBI' : ensure => absent, tag => ['_wdkprod', '_wdkdev'] } # uninstall any existing; no longer avail. in EPEL
  @package { 'perl-BerkeleyDB'                     : tag => ['_wdkprod', '_wdkdev'] } # BioPerl
  @package { 'perl-Bio-BigFile'                    : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-6328
  @package { 'perl-Bio-Das'                        : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-2849
  @package { 'perl-Bio-DB-Das-Chado'               : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-2988
  @package { 'perl-Bio-PrimerDesigner'             : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-7921
  @package { 'perl-Bio-SamTools'                   : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-14446
  @package { 'perl-bioperl14'                      : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'perl-Capture-Tiny'                   : tag => ['_wdkprod', '_wdkdev'] } # RM-5741
  @package { 'perl-CGI-Application-Plugin-Session' : tag => ['_wdkprod', '_wdkdev'] } # OrthoMCL proteome service
  @package { 'perl-CGI-Application'                : tag => ['_wdkprod', '_wdkdev'] } # OrthoMCL proteome service
  @package { 'perl-CGI-Session-Driver-oracle'      : tag => ['_wdkprod', '_wdkdev'] } # GBrowse, et. al
  @package { 'perl-CGI-Session'                    : tag => ['_wdkprod', '_wdkdev'] } # GBrowse, et. al
  @package { 'perl-Class-Base'                     : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # BioPerl, et. al
  @package { 'perl-Config-General'                 : tag => ['_base'] } # collectd
  @package { 'perl-Config-Std'                     : tag => ['_wflow'] } # RM-10998
  @package { 'perl-Data-Types'                     : tag => ['_wflow'] } # RM-1807
  @package { 'perl-Date-Calc'                      : tag => ['lsnrsrvcimpt'] }  # lsnrsrvcimpt
  @package { 'perl-DateTime'                       : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'perl-DBD-Oracle'                     : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'perl-DBD-SQLite'                     : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'perl-DBI'                            : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'perl-Error'                          : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # BioPerl
  @package { 'perl-File-Copy-Recursive'            : tag => ['_wdkdev', '_wflow'] } # RM-13683
  @package { 'perl-GD-SVG'                         : tag => ['_wdkprod', '_wdkdev'] } # GBrowse
  @package { 'perl-GD'                             : tag => ['_wdkprod', '_wdkdev'] } # GBrowse
  @package { 'perl-GraphViz'                       : tag => ['_wflow'] } # ReFlow GUI
  @package { 'perl-JSON'                           : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # general purpose
  @package { 'perl-LDAP'                           : tag => ['_base'] } # general purpose
  @package { 'perl-libwww-perl'                    : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # pubcrawler; general purpose
  @package { 'perl-LWP-Protocol-https'             : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # gbrowse upload tracks from https; general purpose
  @package { 'perl-Math-BigInt-GMP'                : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # improves Net::SSH performance
  @package { 'perl-Math-Round'                     : tag => ['_wdkprod', '_wdkdev'] } # GBrowse
  @package { 'perl-Module-Build'                   : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # general
  @package { 'perl-Mojolicious'                    : tag => ['gente'] } # Gente, https://luffa.gacrc.uga.edu/gente/
  @package { 'perl-Nagios-Plugin'                  : tag => ['_base'] } # RM-3710
  @package { 'perl-Net-Server'                     : tag => ['lsnrsrvcimpt'] } # lsnrsrvcimpt
  @package { 'perl-Net-SSH-Perl'                   : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # curdl
  @package { 'perl-Net-SSH'                        : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # curdl
  @package { 'perl-Parse-Yapp'                     : tag => ['_wdkprod', '_wdkdev'] } # CBIL::Bio::GenBank::Loc
  @package { 'perl-SOAP-Lite'                      : tag => ['_wdkprod', '_wdkdev'] } # ApiCommonWebsite::View::CgiApp::KeggPathways
  @package { 'perl-Spreadsheet-BasicRead'          : tag => ['_wflow'] } # workflow  
  @package { 'perl-Spreadsheet-ParseExcel'         : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # workflow, GBrowse
  @package { 'perl-Statistics-Descriptive'         : tag => ['_wdkprod', '_wdkdev'] } # GBrowse
  @package { 'perl-String-Approx'                  : tag => ['_wflow'] } # workflow
  @package { 'perl-Switch'                         : tag => ['_wflow'] } # RM-26055
  @package { 'perl-Test-Deep'                      : tag => ['_wdkprod', '_wdkdev'] } # RM-18388
  @package { 'perl-Text-CSV'                       : tag => ['_wflow'] } # RM-1807
  @package { 'perl-Text-Iconv'                     : tag => ['_wflow'] } # RM-26209
  @package { 'perl-Tie-DxHash'                     : tag => ['_wdkprod', '_wdkdev'] } # Apache PerlSections
  @package { 'perl-Tie-IxHash'                     : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # various
  @package { 'perl-URI'                            : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # various
  @package { 'perl-WWW-Mechanize-GZip'             : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # various
  @package { 'perl-WWW-Mechanize'                  : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # various
  @package { 'perl-XML-LibXML'                     : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # various
  @package { 'perl-XML-Simple'                     : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # various
  @package { 'perl-XML-Twig'                       : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # various
  @package { 'perl-XML-Writer'                     : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # various
  @package { 'perl-XML-XPath'                      : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # various
  @package { 'perl-YAML'                           : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # various
  @package { 'php-xml'                             : tag => ['_wdkprod', '_wdkdev'] } # /dashboard API
  @package { 'php-pear-PhpDocumentor'              : tag => ['_wdkprod', '_wdkdev'] } # /dashboard API
  @package { 'php-markdown'                        : tag => ['phpwiki'] } # MarkdownViewer custom plugin
  @package { 'php-mbstring'                        : tag => ['phpwiki'] } # phpwiki
  @package { 'primer3'                             : tag => ['_wdkprod', '_wdkdev'] } # RM-7921
  @package { 'python-devel'                        : tag => ['_wdkdev', '_wflow', '_graphite'] }
  @package { 'python-ipython'                      : tag => ['_wdkdev', '_wflow'] } # RM-17915
  @package { 'python-matplotlib'                   : tag => ['_wdkdev', '_wflow'] } # RM-17915
  @package { 'python-pip'                          : tag => ['_wdkdev', '_wflow', '_graphite'] }
  @package { 'python-statsmodels'                  : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-15900, RM-22155
  @package { 'python-virtualenv'                   : tag => ['_wdkdev', '_wflow'] }
  @package { 'python-virtualenvwrapper'            : tag => ['_wdkdev', '_wflow'] }
  @package { 'python-xport'                        : tag => ['_wflow'] } # RM-26114
  if $::operatingsystemmajrelease == '6' {
    @package { 'python27-devel'                    : tag => ['python27'] }
    @package { 'python27'                          : tag => ['python27'] }
  }
  if $::operatingsystemmajrelease == '7' {
    @package { 'python34-devel'                    : tag => ['python34'] }
    @package { 'python34'                          : tag => ['python34'] }
  }
  @package { 'R-affy'                              : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'R-bitops'                            : tag => ['_shinyserver'] }
  @package { 'R-caTools'                           : tag => ['_shinyserver'] }
  @package { 'R-core'                              : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'R-DEGseq'                            : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-23779
  @package { 'R-DESeq2'                            : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-22495
  @package { 'R-DT'                                : tag => ['_shinyserver'] } # RM-26319
  @package { 'R-devel'                             : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'R-devtools'                          : tag => ['_shinyserver'] }
  @package { 'R-digest'                            : tag => ['_shinyserver'] }
  @package { 'R-evaluate'                          : tag => ['_shinyserver'] }
  @package { 'R-formatR'                           : tag => ['_shinyserver'] }
  @package { 'R-ggstance'                          : tag => ['_shinyserver'] } # RM-25708
  @package { 'R-googleVis'                         : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-26957
  @package { 'R-gtools'                            : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-26642
  @package { 'R-gcrma'                             : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'R-GOsummaries'                       : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-25719
  @package { 'R-gridSVG'                           : tag => ['_shinyserver'] } # RM-26201
  @package { 'R-highr'                             : tag => ['_shinyserver'] }
  @package { 'R-htmltools'                         : tag => ['_shinyserver'] }
  @package { 'R-httpuv'                            : tag => ['_shinyserver'] }
  @package { 'R-jsonlite'                          : tag => ['_shinyserver'] }
  @package { 'R-knitr'                             : tag => ['_shinyserver'] }
  @package { 'R-limma'                             : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'R-magrittr'                          : tag => ['_shinyserver'] }
  @package { 'R-makecdfenv'                        : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'R-markdown'                          : tag => ['_shinyserver'] }
  @package { 'R-marray'                            : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'R-mime'                              : tag => ['_shinyserver'] }
  @package { 'R-pdInfoBuilder'                     : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'R-phyloseq'                          : tag => ['_shinyserver'] }
  @package { 'R-plotly'                            : tag => ['_shinyserver'] } # RM-27543
  @package { 'R-R6'                                : tag => ['_shinyserver'] }
  @package { 'R-rBiopaxParser'                     : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'R-rCharts'                           : tag => ['_shinyserver'] }
  @package { 'R-Rcpp'                              : tag => ['_shinyserver'] }
  @package { 'R-rhdf5'                             : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-27151
  @package { 'R-rmarkdown'                         : tag => ['_shinyserver'] }
  @package { 'R-roxygen2'                          : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-26944
  @package { 'R-RSQLite'                           : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'R-shiny'                             : tag => ['_shinyserver'] }
  @package { 'R-shinyjs'                           : tag => ['_shinyserver'] } # RM-26097
  @package { 'R-stringi'                           : tag => ['_shinyserver'] }
  @package { 'R-stringr'                           : tag => ['_shinyserver'] }
  @package { 'R-xtable'                            : tag => ['_shinyserver'] }
  @package { 'R-yaml'                              : tag => ['_shinyserver'] }
  @package { 'R-zoo'                               : tag => ['_shinyserver'] }
  @package { 'readline-devel'                      : tag => ['_wdkdev', '_wflow'] } # RM-20614
  @package { 'reptyr'                              : tag => ['_base'] }
  @package { 'rlwrap'                              : tag => ['_wdkprod', '_wdkdev', '_wflow', '_orclsrv'] }
  @package { 'rpm-build'                           : tag => ['_ciworker'] }
  @package { 'rrdtool-python'                      : tag => ['_ciworker', '_graphite'] }
  @package { 'scipy'                               : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # RM-17915, RM-22155
  @package { 'screen'                              : tag => ['_base'] }
  @package { 'singularity'                         : tag => ['_singularity'] } # RM-28753
  @package { 'singularity-runtime'                 : tag => ['_singularity'] } # RM-28753
  @package { 'sratoolkit'                          : tag => ['_wflow'] }
  @package { 'strace'                              : tag => ['_base'] }
  @package { 'subversion-javahl'                   : tag => ['_wdkdev', '_wflow'] } # Jerric pers. comm.
  @package { 'sympy'                               : tag => ['_wdkdev', '_wflow'] } # RM-17915
  @package { 'sysstat'                             : tag => ['_orclsrv'] }
  @package { 'tbl2asn'                             : tag => ['_wflow'] }
  @package { 'tcpdump'                             : tag => ['_base'] }
  @package { 'tcsh'                                : tag => ['_wflow'] } # RM-26054
  if $::operatingsystemmajrelease == '6' {
    @package { 'tmpwatch'                          : tag => ['_base'] }
    # EL7 uses systemd-tmpfiles
  }
  @package { 'tmux'                                : tag => ['_base'] } # RM-24907
  @package { 'unison'                              : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'unzip'                               : tag => ['_base'] }
  @package { 'vim-enhanced'                        : tag => ['_base'] }
  @package { 'tigervnc'                            : tag => ['_libvirt'] }
  @package { 'whois'                               : tag => ['_base'] }
  @package { 'wireshark-gnome'                     : tag => ['_base'] }
  @package { 'wireshark'                           : tag => ['_base'] }
  @package { 'wxGTK-devel'                         : tag => ['_wflow'] } # RM-7754
  if ! $::is_virtual {
    @package { 'wpa_supplicant':  ensure => absent,  tag => ['_base'] }
  }
  @package { 'xemacs-packages-extra'               : tag => ['_wdkdev', '_wflow'] } # RM-8514
  @package { 'xemacs'                              : tag => ['_wdkprod', '_wdkdev', '_wflow'] }
  @package { 'xmlstarlet'                          : tag => ['_wdkprod', '_wdkdev', '_wflow'] } # Jenkins OAuth jobs; general utility
  @package { 'xorg-x11-xauth'                      : tag => ['_base'] }
}

