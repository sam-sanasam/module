class wordpress::wpvar inherits wordpress {
	exec{"apt update":
	path =>"/usr/bin"
	}

	exec {"mysqladmin -u root password rootpassword && touch /var/mysqlrootset":
	path => "/usr/bin",
	creates => "/var/mysqlrootset"
	} 


	package{"wget":
	ensure => present
	}

	exec{"wget https://gitlab.com/roybhaskar9/devops/raw/master/coding/chef/chefwordpress/files/default/mysqlcommands":
	path => "/usr/bin",
	cwd => "/tmp",
	creates=> "/tmp/mysqlcommands"
	}


	exec{"mysql -uroot -prootpassword < /tmp/mysqlcommands && touch /var/mysqlimportcomplete":
        path=> "/usr/bin", 
	creates => "/var/mysqlimportcomplete" 
	}



	exec{"wget https://wordpress.org/latest.zip": 
	path=> "/usr/bin", 
	cwd=> "/tmp", 
	creates =>"/tmp/latest" 
	}



	package{"unzip": 
	ensure=>present,
	 }


	exec{"unzip /tmp/latest.zip -d /var/www/html":
	path=> "/usr/bin", 
	creates =>"/var/www/html/wordpress/index.php" 
	}


	exec{"wget https://gitlab.com/roybhaskar9/devops/raw/master/coding/chef/chefwordpress/files/default/wp-config-sample.php -O wp-config.php":  
	path=>"/usr/bin", 
	cwd=> "/var/www/html/wordpress/", 
	creates=> "/var/www/html/wordpress/wp-config" 
	}


	file{'/var/www/html/wordpress':   
	ensure => 'directory',   
	mode   => '0775',   
	owner  => 'www-data',   
	group  => 'www-data',  
	}


	exec{"systemctl restart apache2": 
	path=> "/bin/" 
	}

}
