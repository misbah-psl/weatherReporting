<?php

function __autoload($class) {
	$file  = $class . '.php';
	$paths = [
		'Core/' . $file,
		'Controllers/' . $file,
		'Models/' . $file,
		'Libraries/' . $file
	];

	foreach ($paths as $path) {
		if (file_exists($path)) {
			require_once $path;
			break;
		}
	}
}