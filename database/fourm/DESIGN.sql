
CREATE TABLE `user`
(
    `id`            int          NOT NULL AUTO_INCREMENT,
    `username`      varchar(50)  NOT NULL,
    `signature`     varchar(255)          DEFAULT NULL,
    `email`         varchar(100) NOT NULL,
    `password_hash` varchar(255) NOT NULL,
    `avatar`        varchar(255)          DEFAULT NULL,
    `status`        tinyint      NOT NULL DEFAULT '1' COMMENT '0-禁用 1-正常',
    `score`         int          NOT NULL DEFAULT '0',
    `level`         smallint     NOT NULL DEFAULT '1',
    `role`          tinyint      NOT NULL DEFAULT '0' COMMENT '0-普通用户 1-版主 2-管理员',
    `register_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `last_time`     datetime              DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`),
    UNIQUE KEY `idx_email` (`email`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `section`
(
    `id`          int          NOT NULL AUTO_INCREMENT,
    `name`        varchar(100) NOT NULL,
    `description` text,
    `banner`      varchar(255)          DEFAULT NULL,
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_name` (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `board`
(
    `id`          int         NOT NULL AUTO_INCREMENT,
    `section`     int                  DEFAULT NULL COMMENT '关联的大区',
    `parent`      int                  DEFAULT NULL COMMENT '父版块ID，NULL表示是主版块',
    `name`        varchar(50) NOT NULL,
    `description` varchar(255)         DEFAULT NULL,
    `order`       int         NOT NULL DEFAULT '0',
    `status`      tinyint     NOT NULL DEFAULT '1' COMMENT '0-关闭 1-正常',
    `moderator`   int                  DEFAULT NULL COMMENT '版主用户ID',
    `create_time` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT FOREIGN KEY `fk_board_section` (`section`)
        REFERENCES `section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY `fk_board_parent` (`parent`)
        REFERENCES `board` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY `fk_board_moderator` (`moderator`)
        REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `post`
(
    `id`          int          NOT NULL AUTO_INCREMENT,
    `title`       varchar(100) NOT NULL,
    `content`     text         NOT NULL,
    `user`        int          NOT NULL,
    `board`       int          NOT NULL,
    `view`        int          NOT NULL DEFAULT '0',
    `status`      tinyint      NOT NULL DEFAULT '1' COMMENT '0-删除 1-正常 2-审核中',
    `tags`        JSON                  DEFAULT NULL COMMENT '标签列表',
    `last_time`   datetime              DEFAULT NULL,
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` datetime              DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT FOREIGN KEY `fk_user_post` (`user`)
        REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY `fk_post_board` (`board`)
        REFERENCES `board` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FULLTEXT KEY `ft_title_content` (`title`, `content`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `reply`
(
    `id`          int      NOT NULL AUTO_INCREMENT,
    `content`     text     NOT NULL,
    `user`        int      NOT NULL,
    `post`        int      NOT NULL,
    `parent`      int               DEFAULT NULL COMMENT '引用的回复ID',
    `status`      tinyint  NOT NULL DEFAULT '1' COMMENT '0-删除 1-正常 2-审核中',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT FOREIGN KEY `fk_user_reply` (`user`)
        REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY `fk_reply_post` (`post`)
        REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY `fk_reply_parent` (`parent`)
        REFERENCES `reply` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `tags`
(
    `id`          int         NOT NULL AUTO_INCREMENT,
    `name`        varchar(20) NOT NULL,
    `description` TEXT                 DEFAULT NULL,
    `count`       int         NOT NULL DEFAULT '0',
    `create_time` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_name` (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;