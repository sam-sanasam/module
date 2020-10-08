class wordpress::apache inherits wordpress{
		package{"apache2":
		ensure => present
		}

		service{"apache2":
		ensure => running
		}	
}
