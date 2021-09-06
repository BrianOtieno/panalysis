UPDATE `irdoweb`.`wp_options` SET `option_value` = 'http://197.248.18.71:7000' WHERE (`option_id` = '1');
UPDATE `irdoweb`.`wp_options` SET `option_value` = 'http://197.248.18.71:7000' WHERE (`option_id` = '2');
UPDATE wp_posts SET guid = replace(guid, 'http://192.168.0.210:80/','http://197.248.18.71:7000/');
UPDATE wp_posts SET post_content = replace(post_content, 'http://192.168.0.210:80/', 'http://197.248.18.71:7000/');
UPDATE wp_postmeta SET meta_value = replace(meta_value,'http://192.168.0.210:80/','http://197.248.18.71:7000/');

