<?php
function is_session_started()
{
    if ( php_sapi_name() !== 'cli' ) {
        if ( version_compare(phpversion(), '5.4.0', '>=') ) {
            return session_status() === PHP_SESSION_ACTIVE ? TRUE : FALSE;
        } else {
            return session_id() === '' ? FALSE : TRUE;
        }
    }
    return FALSE;
}

// Example
if ( is_session_started() === FALSE ) session_start();

$stat_closed=session_id();
echo '$closed=' . $stat_closed . '<br>';
session_start();
$stat_started=session_id();
echo '$started=' . $stat_started . '<br>';
?>
