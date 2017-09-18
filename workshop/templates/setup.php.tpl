<?php

    //WordPress silent install
    // Requires the following parameters in order
    // - admin_username
    // - admin_password
    // - admin_email
    // - blog_name

    define('WP_INSTALLING', true);
    if (!file_exists('{{installdir}}/wp-config.php')) {
        require_once('{{installdir}}/wp-includes/functions.php');
    }
    require_once('{{installdir}}/wp-config.php');
    require_once('{{installdir}}/wp-admin/upgrade-functions.php');

    $user = stripslashes("{{username}}");
    $password = "{{password}}";
    $admin_email = stripslashes("{{email}}");
    $weblog_title = stripslashes("{{blogName}}");

    try {
       $result = wp_install($weblog_title,$user,$admin_email,1,'',$password);    // '1' is set so that the website is indexed by Google and Technorati
       extract($result, EXTR_SKIP);
    } catch (phpmailerException $e){
       print $e;
    }
?>
