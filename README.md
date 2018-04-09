## `ebrc_packages`

Software packages for EuPathDB BRC that are not deployed through other
Puppet modules.

The packages are virtualized in `ebrc_packages::virtual` and realized as
needed in other modules. The virtual resources are tagged with the
target class of server and, optionally, with any other relevant tags. You can realize packages by name

      realize Package['aspell']

or using a collector to install a single package

      Package <| title == aspell |>

or multiple packages matching a tag

      Package <| tag == wdkdev |>

## Tags

Common tags are

 - _base: for all servers
 - _wdkprod: for production WDK servers
 - _wdkdev: for development WDK servers
 - _wflow: for workflow, data dev servers
 - _orcl: oracle servers

_The underscores are to reduce the chances of realizing selected
resources in a class having the same tag name and Puppet realizing
everything due to its Automatic Tagging.
https://docs.puppetlabs.com/puppet/latest/reference/lang\_tags.html_

## Fact-based declarations

Conditionally declare packages based on facts. For example,
psgml is a separate package only on EL5

    if $::operatingsystemmajrelease == '5' {
      @package { 'psgml: tag => ['wflow'] }
    }

## Removing packages

To remove packages, mark as 'absent'

    @package { 'conman': ensure => absent, tag => ['base'] }

In this example, `conman` will be removed when realized, say when
realizing all base packages `Package <| tag == base |>`

