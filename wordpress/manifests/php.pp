class wordpress::php inherits wordpress {
		$package=['php','libapache2-mod-php', 'php-mcrypt', 'php-mysql']
		$package.each |String $phppackage|{
			package {"$phppackage":
			ensure => present
			}
		}
}
