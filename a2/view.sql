# I couldn't export the view for some reason, so here is what I could export
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `a2`.`developer_roles_and_privileges` AS
    SELECT 
        `p`.`first_name` AS `first_name`,
        `p`.`last_name` AS `last_name`,
        `p`.`username` AS `username`,
        `p`.`email` AS `email`,
        `w`.`name` AS `name`,
        `w`.`visits` AS `visits`,
        `w`.`updated` AS `updated`,
        `wr`.`website_role` AS `website_role`,
        `wp`.`website_privilege` AS `website_privilege`,
        `pa`.`title` AS `title`,
        `pa`.`views` AS `views`,
        `pa`.`updated_last` AS `updated_last`,
        `pr`.`page_role` AS `page_role`,
        `pp`.`page_privilege` AS `page_privilege`
    FROM
        ((((((`a2`.`persons` `p`
        JOIN `a2`.`website_roles` `wr` ON ((`p`.`id` = `wr`.`developer_id_role`)))
        JOIN `a2`.`websites` `w` ON ((`wr`.`website_id_role` = `w`.`id`)))
        JOIN `a2`.`website_privileges` `wp` ON (((`wp`.`website_id_privilege` = `w`.`id`)
            AND (`wp`.`developer_id_privilege` = `p`.`id`))))
        LEFT JOIN `a2`.`pages` `pa` ON ((`pa`.`website_id` = `w`.`id`)))
        LEFT JOIN `a2`.`page_roles` `pr` ON (((`p`.`id` = `pr`.`developer_id_role`)
            AND (`pr`.`page_id_role` = `pa`.`id`))))
        LEFT JOIN `a2`.`page_privileges` `pp` ON (((`pp`.`page_id_privilege` = `pa`.`id`)
            AND (`pp`.`developer_id_privilege` = `p`.`id`))))