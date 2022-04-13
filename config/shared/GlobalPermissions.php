<?php

if ( isset( $_SERVER['REMOTE_ADDR'] ) &&
     in_array( $_SERVER['REMOTE_ADDR'], [ $_SERVER['SERVER_ADDR'], '127.0.0.1' ] ) ) {
  $wgGroupPermissions['*']['read'] = true;
  $wgGroupPermissions['*']['edit'] = true;
  $wgGroupPermissions['*']['writeapi'] = true;
}

?>