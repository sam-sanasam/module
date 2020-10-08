class wordpress::mysql inherits wordpress {
	$sql=['mysql-server','mysql-client]
	$sql.each |String $sqlpackage|{
		package{"$sqlpackage":
		ensure => present
		}
	}

}
