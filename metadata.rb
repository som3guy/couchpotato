name             'couchpotato'
maintainer       'PolyHat'
maintainer_email ''
license          'All rights reserved'
description      'Installs/Configures couchpotato'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
issues_url       'https://github.com/som3guy/headphones/issues'
source_url       'https://github.com/som3guy/headphones/releases'
version          '0.1.0'

depends 'git', '~> 5.0.0'
depends 'yum-epel', '~> 1.0.0'
depends 'build-essential', '~> 6.0.4'
