/*
 Navicat Premium Data Transfer

 Source Server         : 127
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : 127.0.0.1:3306
 Source Schema         : applet

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 25/07/2019 16:51:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '仪表盘', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, '设置', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, '管理员', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 0, '文章分类', 'fa-bars', '/category', NULL, '2019-07-23 09:30:10', '2019-07-23 09:34:31');
INSERT INTO `admin_menu` VALUES (10, 0, 0, '文章管理', 'fa-bars', '/article', NULL, '2019-07-23 09:34:22', '2019-07-23 09:34:36');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 762 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 06:48:50', '2019-07-23 06:48:50');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:49:12', '2019-07-23 06:49:12');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:49:15', '2019-07-23 06:49:15');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:49:16', '2019-07-23 06:49:16');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:49:17', '2019-07-23 06:49:17');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:49:18', '2019-07-23 06:49:18');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:49:20', '2019-07-23 06:49:20');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:55:08', '2019-07-23 06:55:08');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:55:11', '2019-07-23 06:55:11');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:55:12', '2019-07-23 06:55:12');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:55:13', '2019-07-23 06:55:13');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:55:14', '2019-07-23 06:55:14');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:55:17', '2019-07-23 06:55:17');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:55:18', '2019-07-23 06:55:18');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:55:20', '2019-07-23 06:55:20');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:55:50', '2019-07-23 06:55:50');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 06:56:10', '2019-07-23 06:56:10');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 06:56:31', '2019-07-23 06:56:31');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:56:35', '2019-07-23 06:56:35');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 06:56:46', '2019-07-23 06:56:46');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:56:49', '2019-07-23 06:56:49');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 06:56:54', '2019-07-23 06:56:54');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:56:55', '2019-07-23 06:56:55');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 06:57:01', '2019-07-23 06:57:01');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:57:04', '2019-07-23 06:57:04');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:57:22', '2019-07-23 06:57:22');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:57:27', '2019-07-23 06:57:27');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:57:29', '2019-07-23 06:57:29');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 06:58:08', '2019-07-23 06:58:08');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:58:11', '2019-07-23 06:58:11');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:58:30', '2019-07-23 06:58:30');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:58:50', '2019-07-23 06:58:50');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 06:59:37', '2019-07-23 06:59:37');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 07:00:45', '2019-07-23 07:00:45');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 07:00:47', '2019-07-23 07:00:47');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:00:58', '2019-07-23 07:00:58');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:01:08', '2019-07-23 07:01:08');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:03:18', '2019-07-23 07:03:18');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:03:20', '2019-07-23 07:03:20');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:03:21', '2019-07-23 07:03:21');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:03:23', '2019-07-23 07:03:23');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:03:24', '2019-07-23 07:03:24');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:03:51', '2019-07-23 07:03:51');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:03:52', '2019-07-23 07:03:52');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:03:53', '2019-07-23 07:03:53');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:04:28', '2019-07-23 07:04:28');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:04:29', '2019-07-23 07:04:29');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:04:30', '2019-07-23 07:04:30');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:04:31', '2019-07-23 07:04:31');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:04:33', '2019-07-23 07:04:33');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:04:34', '2019-07-23 07:04:34');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:06:28', '2019-07-23 07:06:28');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:06:29', '2019-07-23 07:06:29');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:06:31', '2019-07-23 07:06:31');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:06:32', '2019-07-23 07:06:32');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:06:32', '2019-07-23 07:06:32');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:06:33', '2019-07-23 07:06:33');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/auth/permissions/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:06:44', '2019-07-23 07:06:44');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:06:53', '2019-07-23 07:06:53');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/auth/permissions/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:06:57', '2019-07-23 07:06:57');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:07:09', '2019-07-23 07:07:09');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:07:33', '2019-07-23 07:07:33');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:07:40', '2019-07-23 07:07:40');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:07:41', '2019-07-23 07:07:41');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/auth/menu/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:07:47', '2019-07-23 07:07:47');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:08:38', '2019-07-23 07:08:38');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/auth/menu/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:08:43', '2019-07-23 07:08:43');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:09:11', '2019-07-23 07:09:11');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:09:13', '2019-07-23 07:09:13');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:09:49', '2019-07-23 07:09:49');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-07-23 07:10:29', '2019-07-23 07:10:29');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-07-23 07:10:33', '2019-07-23 07:10:33');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:11:05', '2019-07-23 07:11:05');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:12:38', '2019-07-23 07:12:38');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:13:22', '2019-07-23 07:13:22');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:15:17', '2019-07-23 07:15:17');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:15:27', '2019-07-23 07:15:27');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:15:29', '2019-07-23 07:15:29');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:23:36', '2019-07-23 07:23:36');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:23:37', '2019-07-23 07:23:37');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:23:38', '2019-07-23 07:23:38');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:23:39', '2019-07-23 07:23:39');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:23:41', '2019-07-23 07:23:41');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:24:34', '2019-07-23 07:24:34');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:24:45', '2019-07-23 07:24:45');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:26:24', '2019-07-23 07:26:24');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:27:35', '2019-07-23 07:27:35');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:28:11', '2019-07-23 07:28:11');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:28:19', '2019-07-23 07:28:19');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:28:26', '2019-07-23 07:28:26');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:28:39', '2019-07-23 07:28:39');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:28:55', '2019-07-23 07:28:55');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:29:29', '2019-07-23 07:29:29');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:29:35', '2019-07-23 07:29:35');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:30:11', '2019-07-23 07:30:11');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"page:1\"}', '2019-07-23 07:30:17', '2019-07-23 07:30:17');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:30:28', '2019-07-23 07:30:28');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:30:30', '2019-07-23 07:30:30');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/auth/permissions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:30:38', '2019-07-23 07:30:38');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:30:42', '2019-07-23 07:30:42');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/auth/permissions/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:30:46', '2019-07-23 07:30:46');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:30:55', '2019-07-23 07:30:55');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/auth/permissions/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:30:59', '2019-07-23 07:30:59');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:31:02', '2019-07-23 07:31:02');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:31:03', '2019-07-23 07:31:03');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:31:06', '2019-07-23 07:31:06');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:31:23', '2019-07-23 07:31:23');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:31:25', '2019-07-23 07:31:25');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:31:41', '2019-07-23 07:31:41');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:31:43', '2019-07-23 07:31:43');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:31:47', '2019-07-23 07:31:47');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:31:48', '2019-07-23 07:31:48');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:32:15', '2019-07-23 07:32:15');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:32:37', '2019-07-23 07:32:37');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:32:44', '2019-07-23 07:32:44');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/auth/menu/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:33:00', '2019-07-23 07:33:00');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:33:13', '2019-07-23 07:33:13');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:33:14', '2019-07-23 07:33:14');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:33:16', '2019-07-23 07:33:16');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"sun\",\"name\":\"\\u5b59\\u6797\",\"password\":\"asd123\",\"password_confirmation\":\"asd123\",\"roles\":[null],\"permissions\":[\"4\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/users\"}', '2019-07-23 07:33:45', '2019-07-23 07:33:45');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 07:33:45', '2019-07-23 07:33:45');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:33:55', '2019-07-23 07:33:55');
INSERT INTO `admin_operation_log` VALUES (123, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:34:01', '2019-07-23 07:34:01');
INSERT INTO `admin_operation_log` VALUES (124, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:34:04', '2019-07-23 07:34:04');
INSERT INTO `admin_operation_log` VALUES (125, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:34:05', '2019-07-23 07:34:05');
INSERT INTO `admin_operation_log` VALUES (126, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:34:05', '2019-07-23 07:34:05');
INSERT INTO `admin_operation_log` VALUES (127, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:34:06', '2019-07-23 07:34:06');
INSERT INTO `admin_operation_log` VALUES (128, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:34:06', '2019-07-23 07:34:06');
INSERT INTO `admin_operation_log` VALUES (129, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:34:06', '2019-07-23 07:34:06');
INSERT INTO `admin_operation_log` VALUES (130, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:34:08', '2019-07-23 07:34:08');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:34:16', '2019-07-23 07:34:16');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-07-23 07:34:49', '2019-07-23 07:34:49');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"sun\",\"name\":\"\\u5b59\\u6797\",\"password\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"password_confirmation\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"roles\":[null],\"permissions\":[\"4\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\"}', '2019-07-23 07:34:51', '2019-07-23 07:34:51');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 07:34:51', '2019-07-23 07:34:51');
INSERT INTO `admin_operation_log` VALUES (135, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:34:55', '2019-07-23 07:34:55');
INSERT INTO `admin_operation_log` VALUES (136, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:34:59', '2019-07-23 07:34:59');
INSERT INTO `admin_operation_log` VALUES (137, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:34:59', '2019-07-23 07:34:59');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:35:03', '2019-07-23 07:35:03');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:35:06', '2019-07-23 07:35:06');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:35:10', '2019-07-23 07:35:10');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:35:20', '2019-07-23 07:35:20');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:35:23', '2019-07-23 07:35:23');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:36:04', '2019-07-23 07:36:04');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:36:06', '2019-07-23 07:36:06');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"test\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"permissions\":[\"2\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 07:36:17', '2019-07-23 07:36:17');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 07:36:17', '2019-07-23 07:36:17');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:36:20', '2019-07-23 07:36:20');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:36:22', '2019-07-23 07:36:22');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"sun\",\"name\":\"\\u5b59\\u6797\",\"password\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"password_confirmation\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/users\"}', '2019-07-23 07:36:30', '2019-07-23 07:36:30');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 07:36:30', '2019-07-23 07:36:30');
INSERT INTO `admin_operation_log` VALUES (151, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:36:31', '2019-07-23 07:36:31');
INSERT INTO `admin_operation_log` VALUES (152, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:36:33', '2019-07-23 07:36:33');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:36:47', '2019-07-23 07:36:47');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:36:51', '2019-07-23 07:36:51');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"test\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"permissions\":[\"2\",\"4\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 07:36:55', '2019-07-23 07:36:55');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 07:36:55', '2019-07-23 07:36:55');
INSERT INTO `admin_operation_log` VALUES (157, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:36:56', '2019-07-23 07:36:56');
INSERT INTO `admin_operation_log` VALUES (158, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:36:57', '2019-07-23 07:36:57');
INSERT INTO `admin_operation_log` VALUES (159, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:36:58', '2019-07-23 07:36:58');
INSERT INTO `admin_operation_log` VALUES (160, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:36:58', '2019-07-23 07:36:58');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:37:01', '2019-07-23 07:37:01');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"test\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"permissions\":[\"2\",\"4\",\"5\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 07:37:04', '2019-07-23 07:37:04');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:04', '2019-07-23 07:37:04');
INSERT INTO `admin_operation_log` VALUES (164, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:05', '2019-07-23 07:37:05');
INSERT INTO `admin_operation_log` VALUES (165, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:06', '2019-07-23 07:37:06');
INSERT INTO `admin_operation_log` VALUES (166, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:06', '2019-07-23 07:37:06');
INSERT INTO `admin_operation_log` VALUES (167, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:37:07', '2019-07-23 07:37:07');
INSERT INTO `admin_operation_log` VALUES (168, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:07', '2019-07-23 07:37:07');
INSERT INTO `admin_operation_log` VALUES (169, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:07', '2019-07-23 07:37:07');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:37:10', '2019-07-23 07:37:10');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"test\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 07:37:12', '2019-07-23 07:37:12');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:12', '2019-07-23 07:37:12');
INSERT INTO `admin_operation_log` VALUES (173, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:14', '2019-07-23 07:37:14');
INSERT INTO `admin_operation_log` VALUES (174, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:14', '2019-07-23 07:37:14');
INSERT INTO `admin_operation_log` VALUES (175, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:14', '2019-07-23 07:37:14');
INSERT INTO `admin_operation_log` VALUES (176, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:14', '2019-07-23 07:37:14');
INSERT INTO `admin_operation_log` VALUES (177, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:37:15', '2019-07-23 07:37:15');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:37:19', '2019-07-23 07:37:19');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"test\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"permissions\":[\"2\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 07:37:22', '2019-07-23 07:37:22');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:22', '2019-07-23 07:37:22');
INSERT INTO `admin_operation_log` VALUES (181, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:27', '2019-07-23 07:37:27');
INSERT INTO `admin_operation_log` VALUES (182, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:28', '2019-07-23 07:37:28');
INSERT INTO `admin_operation_log` VALUES (183, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:37:28', '2019-07-23 07:37:28');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:38:02', '2019-07-23 07:38:02');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"test\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"permissions\":[\"1\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 07:38:06', '2019-07-23 07:38:06');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 07:38:06', '2019-07-23 07:38:06');
INSERT INTO `admin_operation_log` VALUES (187, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:38:07', '2019-07-23 07:38:07');
INSERT INTO `admin_operation_log` VALUES (188, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:38:08', '2019-07-23 07:38:08');
INSERT INTO `admin_operation_log` VALUES (189, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:38:08', '2019-07-23 07:38:08');
INSERT INTO `admin_operation_log` VALUES (190, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:38:08', '2019-07-23 07:38:08');
INSERT INTO `admin_operation_log` VALUES (191, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:38:08', '2019-07-23 07:38:08');
INSERT INTO `admin_operation_log` VALUES (192, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:38:08', '2019-07-23 07:38:08');
INSERT INTO `admin_operation_log` VALUES (193, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:38:08', '2019-07-23 07:38:08');
INSERT INTO `admin_operation_log` VALUES (194, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:38:09', '2019-07-23 07:38:09');
INSERT INTO `admin_operation_log` VALUES (195, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:38:11', '2019-07-23 07:38:11');
INSERT INTO `admin_operation_log` VALUES (196, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:38:14', '2019-07-23 07:38:14');
INSERT INTO `admin_operation_log` VALUES (197, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:38:15', '2019-07-23 07:38:15');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:38:19', '2019-07-23 07:38:19');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:38:23', '2019-07-23 07:38:23');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:38:27', '2019-07-23 07:38:27');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:39:24', '2019-07-23 07:39:24');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:01', '2019-07-23 07:40:01');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:03', '2019-07-23 07:40:03');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:14', '2019-07-23 07:40:14');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:16', '2019-07-23 07:40:16');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:17', '2019-07-23 07:40:17');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:18', '2019-07-23 07:40:18');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:19', '2019-07-23 07:40:19');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:19', '2019-07-23 07:40:19');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:23', '2019-07-23 07:40:23');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:28', '2019-07-23 07:40:28');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:43', '2019-07-23 07:40:43');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:48', '2019-07-23 07:40:48');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:40:57', '2019-07-23 07:40:57');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:41:08', '2019-07-23 07:41:08');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:41:10', '2019-07-23 07:41:10');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:41:14', '2019-07-23 07:41:14');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:43:26', '2019-07-23 07:43:26');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:44:09', '2019-07-23 07:44:09');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:44:14', '2019-07-23 07:44:14');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:44:16', '2019-07-23 07:44:16');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:44:18', '2019-07-23 07:44:18');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"sun\",\"name\":\"\\u5b59\\u6797\",\"password\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"password_confirmation\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/users\"}', '2019-07-23 07:44:23', '2019-07-23 07:44:23');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 07:44:23', '2019-07-23 07:44:23');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:44:25', '2019-07-23 07:44:25');
INSERT INTO `admin_operation_log` VALUES (226, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:44:28', '2019-07-23 07:44:28');
INSERT INTO `admin_operation_log` VALUES (227, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:44:29', '2019-07-23 07:44:29');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"sun\",\"name\":\"\\u5b59\\u6797\",\"password\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"password_confirmation\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/users\"}', '2019-07-23 07:45:18', '2019-07-23 07:45:18');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 07:45:18', '2019-07-23 07:45:18');
INSERT INTO `admin_operation_log` VALUES (230, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:45:30', '2019-07-23 07:45:30');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:45:33', '2019-07-23 07:45:33');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:45:36', '2019-07-23 07:45:36');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:45:40', '2019-07-23 07:45:40');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:45:44', '2019-07-23 07:45:44');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/auth/permissions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:45:48', '2019-07-23 07:45:48');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:45:56', '2019-07-23 07:45:56');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:46:22', '2019-07-23 07:46:22');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:46:25', '2019-07-23 07:46:25');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:46:31', '2019-07-23 07:46:31');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:46:32', '2019-07-23 07:46:32');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:46:35', '2019-07-23 07:46:35');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"test\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"permissions\":[\"4\",\"2\",\"4\",\"5\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 07:47:00', '2019-07-23 07:47:00');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 07:47:00', '2019-07-23 07:47:00');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:47:04', '2019-07-23 07:47:04');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:47:07', '2019-07-23 07:47:07');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"sun\",\"name\":\"\\u5b59\\u6797\",\"password\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"password_confirmation\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"roles\":[\"2\",null],\"permissions\":[\"2\",\"5\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/users\"}', '2019-07-23 07:47:16', '2019-07-23 07:47:16');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 07:47:16', '2019-07-23 07:47:16');
INSERT INTO `admin_operation_log` VALUES (248, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:47:18', '2019-07-23 07:47:18');
INSERT INTO `admin_operation_log` VALUES (249, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:47:18', '2019-07-23 07:47:18');
INSERT INTO `admin_operation_log` VALUES (250, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:47:18', '2019-07-23 07:47:18');
INSERT INTO `admin_operation_log` VALUES (251, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:47:19', '2019-07-23 07:47:19');
INSERT INTO `admin_operation_log` VALUES (252, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:47:19', '2019-07-23 07:47:19');
INSERT INTO `admin_operation_log` VALUES (253, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:47:21', '2019-07-23 07:47:21');
INSERT INTO `admin_operation_log` VALUES (254, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:47:26', '2019-07-23 07:47:26');
INSERT INTO `admin_operation_log` VALUES (255, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:47:27', '2019-07-23 07:47:27');
INSERT INTO `admin_operation_log` VALUES (256, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:47:28', '2019-07-23 07:47:28');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:47:57', '2019-07-23 07:47:57');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:47:59', '2019-07-23 07:47:59');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:47:59', '2019-07-23 07:47:59');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:48:02', '2019-07-23 07:48:02');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:48:08', '2019-07-23 07:48:08');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:48:10', '2019-07-23 07:48:10');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:48:13', '2019-07-23 07:48:13');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:48:15', '2019-07-23 07:48:15');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:48:31', '2019-07-23 07:48:31');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:48:35', '2019-07-23 07:48:35');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"test\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"permissions\":[\"1\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 07:48:40', '2019-07-23 07:48:40');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 07:48:40', '2019-07-23 07:48:40');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:48:41', '2019-07-23 07:48:41');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:48:43', '2019-07-23 07:48:43');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"sun\",\"name\":\"\\u5b59\\u6797\",\"password\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"password_confirmation\":\"$2y$10$P4t\\/\\/OTYrvGIET0qKC3rYOjJphgvs1TJ8gyydyybBiUQY6UzBoPzS\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/users\"}', '2019-07-23 07:48:48', '2019-07-23 07:48:48');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 07:48:48', '2019-07-23 07:48:48');
INSERT INTO `admin_operation_log` VALUES (273, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:48:50', '2019-07-23 07:48:50');
INSERT INTO `admin_operation_log` VALUES (274, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:48:50', '2019-07-23 07:48:50');
INSERT INTO `admin_operation_log` VALUES (275, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:48:51', '2019-07-23 07:48:51');
INSERT INTO `admin_operation_log` VALUES (276, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-07-23 07:48:54', '2019-07-23 07:48:54');
INSERT INTO `admin_operation_log` VALUES (277, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-07-23 07:48:59', '2019-07-23 07:48:59');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:49:02', '2019-07-23 07:49:02');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:49:04', '2019-07-23 07:49:04');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:49:05', '2019-07-23 07:49:05');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"2\",\"_model\":\"Encore_Admin_Auth_Database_Role\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2019-07-23 07:49:08', '2019-07-23 07:49:08');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:49:08', '2019-07-23 07:49:08');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:49:10', '2019-07-23 07:49:10');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:49:12', '2019-07-23 07:49:12');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/auth/users/2', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\"}', '2019-07-23 07:49:15', '2019-07-23 07:49:15');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:49:15', '2019-07-23 07:49:15');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:50:35', '2019-07-23 07:50:35');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:50:38', '2019-07-23 07:50:38');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"custom-user\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"http_method\":[null],\"http_path\":\"\\/user*\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/permissions\"}', '2019-07-23 07:51:12', '2019-07-23 07:51:12');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 07:51:12', '2019-07-23 07:51:12');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:51:19', '2019-07-23 07:51:19');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:51:21', '2019-07-23 07:51:21');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"custom-sun\",\"name\":\"\\u81ea\\u5b9a\\u4e49\\u89d2\\u8272\",\"permissions\":[\"6\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 07:51:50', '2019-07-23 07:51:50');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 07:51:50', '2019-07-23 07:51:50');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:51:56', '2019-07-23 07:51:56');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:51:59', '2019-07-23 07:51:59');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"sun\",\"name\":\"\\u5b59\\u6797\",\"password\":\"asd123\",\"password_confirmation\":\"asd123\",\"roles\":[\"3\",null],\"permissions\":[null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/users\"}', '2019-07-23 07:52:20', '2019-07-23 07:52:20');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 07:52:20', '2019-07-23 07:52:20');
INSERT INTO `admin_operation_log` VALUES (299, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:52:37', '2019-07-23 07:52:37');
INSERT INTO `admin_operation_log` VALUES (300, 3, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:52:39', '2019-07-23 07:52:39');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:52:58', '2019-07-23 07:52:58');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:53:00', '2019-07-23 07:53:00');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:53:02', '2019-07-23 07:53:02');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '[]', '2019-07-23 07:53:30', '2019-07-23 07:53:30');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/auth/roles/3', 'PUT', '127.0.0.1', '{\"slug\":\"custom-sun\",\"name\":\"\\u81ea\\u5b9a\\u4e49\\u89d2\\u8272\",\"permissions\":[\"2\",\"6\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\"}', '2019-07-23 07:53:36', '2019-07-23 07:53:36');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 07:53:36', '2019-07-23 07:53:36');
INSERT INTO `admin_operation_log` VALUES (307, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 07:53:38', '2019-07-23 07:53:38');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 07:53:42', '2019-07-23 07:53:42');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:22:17', '2019-07-23 09:22:17');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:22:18', '2019-07-23 09:22:18');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:22:19', '2019-07-23 09:22:19');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:22:20', '2019-07-23 09:22:20');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:22:36', '2019-07-23 09:22:36');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:23:33', '2019-07-23 09:23:33');
INSERT INTO `admin_operation_log` VALUES (315, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:23:38', '2019-07-23 09:23:38');
INSERT INTO `admin_operation_log` VALUES (316, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:23:38', '2019-07-23 09:23:38');
INSERT INTO `admin_operation_log` VALUES (317, 3, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:23:40', '2019-07-23 09:23:40');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:23:44', '2019-07-23 09:23:44');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:23:46', '2019-07-23 09:23:46');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:23:51', '2019-07-23 09:23:51');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"custom-user\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"http_method\":[null],\"http_path\":\"\\/admin*\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/permissions\"}', '2019-07-23 09:23:55', '2019-07-23 09:23:55');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 09:23:55', '2019-07-23 09:23:55');
INSERT INTO `admin_operation_log` VALUES (323, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:23:57', '2019-07-23 09:23:57');
INSERT INTO `admin_operation_log` VALUES (324, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:23:58', '2019-07-23 09:23:58');
INSERT INTO `admin_operation_log` VALUES (325, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:23:58', '2019-07-23 09:23:58');
INSERT INTO `admin_operation_log` VALUES (326, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:23:58', '2019-07-23 09:23:58');
INSERT INTO `admin_operation_log` VALUES (327, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:23:58', '2019-07-23 09:23:58');
INSERT INTO `admin_operation_log` VALUES (328, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:23:58', '2019-07-23 09:23:58');
INSERT INTO `admin_operation_log` VALUES (329, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:23:58', '2019-07-23 09:23:58');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:02', '2019-07-23 09:24:02');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"custom-user\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"http_method\":[null],\"http_path\":\"\\/user*\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/permissions\"}', '2019-07-23 09:24:06', '2019-07-23 09:24:06');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 09:24:06', '2019-07-23 09:24:06');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:14', '2019-07-23 09:24:14');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:18', '2019-07-23 09:24:18');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:22', '2019-07-23 09:24:22');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/auth/users/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:26', '2019-07-23 09:24:26');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:29', '2019-07-23 09:24:29');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:34', '2019-07-23 09:24:34');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:35', '2019-07-23 09:24:35');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:38', '2019-07-23 09:24:38');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"custom-user\",\"name\":\"\\u81ea\\u5b9a\\u4e49\\u6743\\u9650\\u6d4b\\u8bd5\",\"http_method\":[null],\"http_path\":\"\\/user*\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/permissions\"}', '2019-07-23 09:24:44', '2019-07-23 09:24:44');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 09:24:44', '2019-07-23 09:24:44');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:46', '2019-07-23 09:24:46');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:24:47', '2019-07-23 09:24:47');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:29:42', '2019-07-23 09:29:42');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:29:44', '2019-07-23 09:29:44');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:29:45', '2019-07-23 09:29:45');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:29:45', '2019-07-23 09:29:45');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u83dc\\u5355\\u6d4b\\u8bd5\",\"icon\":\"fa-bars\",\"uri\":\"\\/admin\\/custom\",\"roles\":[null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\"}', '2019-07-23 09:30:10', '2019-07-23 09:30:10');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:30:10', '2019-07-23 09:30:10');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:30:11', '2019-07-23 09:30:11');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:30:19', '2019-07-23 09:30:19');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '[]', '2019-07-23 09:30:29', '2019-07-23 09:30:29');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:30:36', '2019-07-23 09:30:36');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:30:39', '2019-07-23 09:30:39');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u83dc\\u5355\\u6d4b\\u8bd5\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[\"3\",null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/menu\"}', '2019-07-23 09:30:45', '2019-07-23 09:30:45');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:30:45', '2019-07-23 09:30:45');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:30:48', '2019-07-23 09:30:48');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '[]', '2019-07-23 09:30:51', '2019-07-23 09:30:51');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:30:52', '2019-07-23 09:30:52');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:30:54', '2019-07-23 09:30:54');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:30:56', '2019-07-23 09:30:56');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:31:00', '2019-07-23 09:31:00');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:31:03', '2019-07-23 09:31:03');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:31:05', '2019-07-23 09:31:05');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:31:12', '2019-07-23 09:31:12');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\\u4e8c\\u7ea7\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"\\/admin\\/custom\\/test1\",\"roles\":[\"3\",null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\"}', '2019-07-23 09:31:36', '2019-07-23 09:31:36');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:31:36', '2019-07-23 09:31:36');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:31:39', '2019-07-23 09:31:39');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:31:39', '2019-07-23 09:31:39');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:31:43', '2019-07-23 09:31:43');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:31:46', '2019-07-23 09:31:46');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:31:49', '2019-07-23 09:31:49');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:31:52', '2019-07-23 09:31:52');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"custom-user\",\"name\":\"\\u81ea\\u5b9a\\u4e49\\u6743\\u9650\\u6d4b\\u8bd5\",\"http_method\":[null],\"http_path\":\"\\/custom*\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/permissions\"}', '2019-07-23 09:31:57', '2019-07-23 09:31:57');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 09:31:57', '2019-07-23 09:31:57');
INSERT INTO `admin_operation_log` VALUES (377, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:31:59', '2019-07-23 09:31:59');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:32:23', '2019-07-23 09:32:23');
INSERT INTO `admin_operation_log` VALUES (379, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:32:25', '2019-07-23 09:32:25');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\\u4e8c\\u7ea7\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"\\/admin\\/custom\\/test1\",\"roles\":[null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/menu\"}', '2019-07-23 09:32:31', '2019-07-23 09:32:31');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:32:31', '2019-07-23 09:32:31');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:32:33', '2019-07-23 09:32:33');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:32:35', '2019-07-23 09:32:35');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:32:36', '2019-07-23 09:32:36');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u83dc\\u5355\\u6d4b\\u8bd5\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/menu\"}', '2019-07-23 09:32:39', '2019-07-23 09:32:39');
INSERT INTO `admin_operation_log` VALUES (386, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:32:40', '2019-07-23 09:32:40');
INSERT INTO `admin_operation_log` VALUES (387, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:32:41', '2019-07-23 09:32:41');
INSERT INTO `admin_operation_log` VALUES (388, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:32:44', '2019-07-23 09:32:44');
INSERT INTO `admin_operation_log` VALUES (389, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:32:44', '2019-07-23 09:32:44');
INSERT INTO `admin_operation_log` VALUES (390, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:32:44', '2019-07-23 09:32:44');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:32:50', '2019-07-23 09:32:50');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:32:53', '2019-07-23 09:32:53');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/auth/menu/9', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\"}', '2019-07-23 09:33:25', '2019-07-23 09:33:25');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:33:25', '2019-07-23 09:33:25');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:33:27', '2019-07-23 09:33:27');
INSERT INTO `admin_operation_log` VALUES (396, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7b\",\"icon\":\"fa-bars\",\"uri\":\"\\/admin\\/category\",\"roles\":[null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/menu\"}', '2019-07-23 09:33:47', '2019-07-23 09:33:47');
INSERT INTO `admin_operation_log` VALUES (397, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:33:47', '2019-07-23 09:33:47');
INSERT INTO `admin_operation_log` VALUES (398, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:33:49', '2019-07-23 09:33:49');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6587\\u7ae0\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/admin\\/article\",\"roles\":[null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\"}', '2019-07-23 09:34:22', '2019-07-23 09:34:22');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:34:22', '2019-07-23 09:34:22');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:34:26', '2019-07-23 09:34:26');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7b\",\"icon\":\"fa-bars\",\"uri\":\"\\/category\",\"roles\":[null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/menu\"}', '2019-07-23 09:34:31', '2019-07-23 09:34:31');
INSERT INTO `admin_operation_log` VALUES (403, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:34:31', '2019-07-23 09:34:31');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:34:33', '2019-07-23 09:34:33');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/auth/menu/10', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6587\\u7ae0\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/article\",\"roles\":[null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/menu\"}', '2019-07-23 09:34:36', '2019-07-23 09:34:36');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:34:36', '2019-07-23 09:34:36');
INSERT INTO `admin_operation_log` VALUES (407, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:34:38', '2019-07-23 09:34:38');
INSERT INTO `admin_operation_log` VALUES (408, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:34:41', '2019-07-23 09:34:41');
INSERT INTO `admin_operation_log` VALUES (409, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:34:51', '2019-07-23 09:34:51');
INSERT INTO `admin_operation_log` VALUES (410, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:34:52', '2019-07-23 09:34:52');
INSERT INTO `admin_operation_log` VALUES (411, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:34:55', '2019-07-23 09:34:55');
INSERT INTO `admin_operation_log` VALUES (412, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:34:58', '2019-07-23 09:34:58');
INSERT INTO `admin_operation_log` VALUES (413, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"custom-user\",\"name\":\"\\u6587\\u7ae0\\u7ba1\\u7406\\u5458\",\"http_method\":[null],\"http_path\":\"\\/custom*\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/permissions\"}', '2019-07-23 09:35:16', '2019-07-23 09:35:16');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 09:35:16', '2019-07-23 09:35:16');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 09:35:26', '2019-07-23 09:35:26');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/auth/permissions/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:35:29', '2019-07-23 09:35:29');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:35:31', '2019-07-23 09:35:31');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:35:34', '2019-07-23 09:35:34');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"custom-user\",\"name\":\"\\u6587\\u7ae0\\u7ba1\\u7406\\u5458\",\"http_method\":[null],\"http_path\":\"\\/category\\r\\n\\/article\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/permissions\"}', '2019-07-23 09:35:52', '2019-07-23 09:35:52');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 09:35:52', '2019-07-23 09:35:52');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:00', '2019-07-23 09:36:00');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:03', '2019-07-23 09:36:03');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:05', '2019-07-23 09:36:05');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:07', '2019-07-23 09:36:07');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:09', '2019-07-23 09:36:09');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/auth/roles/3', 'PUT', '127.0.0.1', '{\"slug\":\"custom-sun\",\"name\":\"\\u6587\\u7ae0\\u7ba1\\u7406\\u5458\\u89d2\\u8272\",\"permissions\":[\"2\",\"6\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 09:36:16', '2019-07-23 09:36:16');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 09:36:16', '2019-07-23 09:36:16');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:19', '2019-07-23 09:36:19');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:21', '2019-07-23 09:36:21');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/auth/users/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:23', '2019-07-23 09:36:23');
INSERT INTO `admin_operation_log` VALUES (431, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:36:29', '2019-07-23 09:36:29');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:31', '2019-07-23 09:36:31');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:33', '2019-07-23 09:36:33');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:36:35', '2019-07-23 09:36:35');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"custom-test\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"http_method\":[null],\"http_path\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/permissions\"}', '2019-07-23 09:36:49', '2019-07-23 09:36:49');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 09:36:49', '2019-07-23 09:36:49');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:37:01', '2019-07-23 09:37:01');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:37:05', '2019-07-23 09:37:05');
INSERT INTO `admin_operation_log` VALUES (439, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:37:07', '2019-07-23 09:37:07');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"custom-test\",\"name\":\"\\u6743\\u9650\\u6d4b\\u8bd5\",\"http_method\":[null],\"http_path\":\"\\/auth\\/users\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/permissions\"}', '2019-07-23 09:37:12', '2019-07-23 09:37:12');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-07-23 09:37:12', '2019-07-23 09:37:12');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:37:20', '2019-07-23 09:37:20');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:37:21', '2019-07-23 09:37:21');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:37:23', '2019-07-23 09:37:23');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"asd123\",\"name\":\"asd123\",\"permissions\":[\"7\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/roles\"}', '2019-07-23 09:37:34', '2019-07-23 09:37:34');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 09:37:34', '2019-07-23 09:37:34');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:37:36', '2019-07-23 09:37:36');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:37:38', '2019-07-23 09:37:38');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"asd123\",\"name\":\"asd123\",\"password\":\"asd123\",\"password_confirmation\":\"asd123\",\"roles\":[\"4\",null],\"permissions\":[\"7\",null],\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/users\"}', '2019-07-23 09:37:48', '2019-07-23 09:37:48');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 09:37:49', '2019-07-23 09:37:49');
INSERT INTO `admin_operation_log` VALUES (451, 4, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:38:02', '2019-07-23 09:38:02');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:39:19', '2019-07-23 09:39:19');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:39:24', '2019-07-23 09:39:24');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u83dc\\u5355\\u6d4b\\u8bd5\",\"icon\":\"fa-bars\",\"uri\":\"\\/admin\\/test\",\"roles\":[null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\"}', '2019-07-23 09:39:37', '2019-07-23 09:39:37');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:39:37', '2019-07-23 09:39:37');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:39:41', '2019-07-23 09:39:41');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u83dc\\u5355\\u6d4b\\u8bd5\",\"icon\":\"fa-bars\",\"uri\":\"\\/test\",\"roles\":[null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/menu\"}', '2019-07-23 09:39:44', '2019-07-23 09:39:44');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:39:44', '2019-07-23 09:39:44');
INSERT INTO `admin_operation_log` VALUES (459, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:39:46', '2019-07-23 09:39:46');
INSERT INTO `admin_operation_log` VALUES (460, 4, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:39:48', '2019-07-23 09:39:48');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:39:53', '2019-07-23 09:39:53');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:39:56', '2019-07-23 09:39:56');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u83dc\\u5355\\u6d4b\\u8bd5\",\"icon\":\"fa-bars\",\"uri\":\"\\/test\",\"roles\":[\"4\",null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/menu\"}', '2019-07-23 09:39:59', '2019-07-23 09:39:59');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:39:59', '2019-07-23 09:39:59');
INSERT INTO `admin_operation_log` VALUES (465, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:01', '2019-07-23 09:40:01');
INSERT INTO `admin_operation_log` VALUES (466, 4, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:02', '2019-07-23 09:40:02');
INSERT INTO `admin_operation_log` VALUES (467, 4, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:02', '2019-07-23 09:40:02');
INSERT INTO `admin_operation_log` VALUES (468, 4, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:03', '2019-07-23 09:40:03');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:40:05', '2019-07-23 09:40:05');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/auth/menu/10', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6587\\u7ae0\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/article\",\"roles\":[\"3\",null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/menu\"}', '2019-07-23 09:40:09', '2019-07-23 09:40:09');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:09', '2019-07-23 09:40:09');
INSERT INTO `admin_operation_log` VALUES (472, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:11', '2019-07-23 09:40:11');
INSERT INTO `admin_operation_log` VALUES (473, 4, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:12', '2019-07-23 09:40:12');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:40:15', '2019-07-23 09:40:15');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7b\",\"icon\":\"fa-bars\",\"uri\":\"\\/category\",\"roles\":[\"3\",null],\"permission\":null,\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/menu\"}', '2019-07-23 09:40:18', '2019-07-23 09:40:18');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:18', '2019-07-23 09:40:18');
INSERT INTO `admin_operation_log` VALUES (477, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:19', '2019-07-23 09:40:19');
INSERT INTO `admin_operation_log` VALUES (478, 3, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:21', '2019-07-23 09:40:21');
INSERT INTO `admin_operation_log` VALUES (479, 4, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:40:22', '2019-07-23 09:40:22');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:40:33', '2019-07-23 09:40:33');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"7\",\"_model\":\"Encore_Admin_Auth_Database_Permission\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2019-07-23 09:40:45', '2019-07-23 09:40:45');
INSERT INTO `admin_operation_log` VALUES (482, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:40:45', '2019-07-23 09:40:45');
INSERT INTO `admin_operation_log` VALUES (483, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:40:51', '2019-07-23 09:40:51');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin/auth/menu/11', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\"}', '2019-07-23 09:40:54', '2019-07-23 09:40:54');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:40:54', '2019-07-23 09:40:54');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:40:56', '2019-07-23 09:40:56');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:40:56', '2019-07-23 09:40:56');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"Encore_Admin_Auth_Database_Role\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2019-07-23 09:41:00', '2019-07-23 09:41:00');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:41:00', '2019-07-23 09:41:00');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:41:02', '2019-07-23 09:41:02');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"4\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"0o7bCJSmpCgPeXBIx29GopzSk8M5V3tZ8cEVXlq9\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2019-07-23 09:41:05', '2019-07-23 09:41:05');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:41:05', '2019-07-23 09:41:05');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 09:41:06', '2019-07-23 09:41:06');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 09:41:07', '2019-07-23 09:41:07');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:41:12', '2019-07-23 09:41:12');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 09:42:27', '2019-07-23 09:42:27');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 09:43:26', '2019-07-23 09:43:26');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:43:26', '2019-07-23 09:43:26');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:44:13', '2019-07-23 09:44:13');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:44:14', '2019-07-23 09:44:14');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:44:19', '2019-07-23 09:44:19');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:44:30', '2019-07-23 09:44:30');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:46:11', '2019-07-23 09:46:11');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:46:20', '2019-07-23 09:46:20');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:46:22', '2019-07-23 09:46:22');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:46:29', '2019-07-23 09:46:29');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:48:05', '2019-07-23 09:48:05');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:48:21', '2019-07-23 09:48:21');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:48:23', '2019-07-23 09:48:23');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:48:49', '2019-07-23 09:48:49');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:48:54', '2019-07-23 09:48:54');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:48:56', '2019-07-23 09:48:56');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-23 09:49:08', '2019-07-23 09:49:08');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:49:28', '2019-07-23 09:49:28');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:49:32', '2019-07-23 09:49:32');
INSERT INTO `admin_operation_log` VALUES (516, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:50:05', '2019-07-23 09:50:05');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:50:06', '2019-07-23 09:50:06');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:50:24', '2019-07-23 09:50:24');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:50:32', '2019-07-23 09:50:32');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:50:47', '2019-07-23 09:50:47');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:50:51', '2019-07-23 09:50:51');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:51:24', '2019-07-23 09:51:24');
INSERT INTO `admin_operation_log` VALUES (523, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:51:32', '2019-07-23 09:51:32');
INSERT INTO `admin_operation_log` VALUES (524, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:51:47', '2019-07-23 09:51:47');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-07-23 09:57:04', '2019-07-23 09:57:04');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:57:06', '2019-07-23 09:57:06');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:57:34', '2019-07-23 09:57:34');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:57:50', '2019-07-23 09:57:50');
INSERT INTO `admin_operation_log` VALUES (529, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:58:14', '2019-07-23 09:58:14');
INSERT INTO `admin_operation_log` VALUES (530, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:58:32', '2019-07-23 09:58:32');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:58:40', '2019-07-23 09:58:40');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:58:41', '2019-07-23 09:58:41');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 09:58:42', '2019-07-23 09:58:42');
INSERT INTO `admin_operation_log` VALUES (534, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:59:25', '2019-07-23 09:59:25');
INSERT INTO `admin_operation_log` VALUES (535, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:59:38', '2019-07-23 09:59:38');
INSERT INTO `admin_operation_log` VALUES (536, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:59:46', '2019-07-23 09:59:46');
INSERT INTO `admin_operation_log` VALUES (537, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:59:52', '2019-07-23 09:59:52');
INSERT INTO `admin_operation_log` VALUES (538, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 09:59:55', '2019-07-23 09:59:55');
INSERT INTO `admin_operation_log` VALUES (539, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-23 10:00:34', '2019-07-23 10:00:34');
INSERT INTO `admin_operation_log` VALUES (540, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 10:01:58', '2019-07-23 10:01:58');
INSERT INTO `admin_operation_log` VALUES (541, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 10:05:24', '2019-07-23 10:05:24');
INSERT INTO `admin_operation_log` VALUES (542, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 10:05:25', '2019-07-23 10:05:25');
INSERT INTO `admin_operation_log` VALUES (543, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 10:05:25', '2019-07-23 10:05:25');
INSERT INTO `admin_operation_log` VALUES (544, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 10:05:29', '2019-07-23 10:05:29');
INSERT INTO `admin_operation_log` VALUES (545, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 10:05:29', '2019-07-23 10:05:29');
INSERT INTO `admin_operation_log` VALUES (546, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 10:06:15', '2019-07-23 10:06:15');
INSERT INTO `admin_operation_log` VALUES (547, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 10:06:17', '2019-07-23 10:06:17');
INSERT INTO `admin_operation_log` VALUES (548, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 10:06:17', '2019-07-23 10:06:17');
INSERT INTO `admin_operation_log` VALUES (549, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 10:07:16', '2019-07-23 10:07:16');
INSERT INTO `admin_operation_log` VALUES (550, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 10:07:18', '2019-07-23 10:07:18');
INSERT INTO `admin_operation_log` VALUES (551, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-23 10:07:18', '2019-07-23 10:07:18');
INSERT INTO `admin_operation_log` VALUES (552, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-25 01:49:28', '2019-07-25 01:49:28');
INSERT INTO `admin_operation_log` VALUES (553, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 01:49:31', '2019-07-25 01:49:31');
INSERT INTO `admin_operation_log` VALUES (554, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 01:49:32', '2019-07-25 01:49:32');
INSERT INTO `admin_operation_log` VALUES (555, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 01:49:33', '2019-07-25 01:49:33');
INSERT INTO `admin_operation_log` VALUES (556, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 01:49:34', '2019-07-25 01:49:34');
INSERT INTO `admin_operation_log` VALUES (557, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 01:49:35', '2019-07-25 01:49:35');
INSERT INTO `admin_operation_log` VALUES (558, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 01:49:35', '2019-07-25 01:49:35');
INSERT INTO `admin_operation_log` VALUES (559, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 01:49:38', '2019-07-25 01:49:38');
INSERT INTO `admin_operation_log` VALUES (560, 1, 'admin/auth/users/1', 'PUT', '127.0.0.1', '{\"username\":\"admin\",\"name\":\"Administrator\",\"password\":\"asd123\",\"password_confirmation\":\"asd123\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"C25kDzEu3WrOqG0gUAuhx5LnigFCz3XgeS8TYNZA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8005\\/admin\\/auth\\/users\"}', '2019-07-25 01:49:44', '2019-07-25 01:49:44');
INSERT INTO `admin_operation_log` VALUES (561, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-07-25 01:49:44', '2019-07-25 01:49:44');
INSERT INTO `admin_operation_log` VALUES (562, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 01:49:46', '2019-07-25 01:49:46');
INSERT INTO `admin_operation_log` VALUES (563, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 01:49:51', '2019-07-25 01:49:51');
INSERT INTO `admin_operation_log` VALUES (564, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-25 01:49:55', '2019-07-25 01:49:55');
INSERT INTO `admin_operation_log` VALUES (565, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 02:05:53', '2019-07-25 02:05:53');
INSERT INTO `admin_operation_log` VALUES (566, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-25 02:05:53', '2019-07-25 02:05:53');
INSERT INTO `admin_operation_log` VALUES (567, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-25 02:06:09', '2019-07-25 02:06:09');
INSERT INTO `admin_operation_log` VALUES (568, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-07-25 02:06:09', '2019-07-25 02:06:09');
INSERT INTO `admin_operation_log` VALUES (569, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 02:06:11', '2019-07-25 02:06:11');
INSERT INTO `admin_operation_log` VALUES (570, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 02:06:14', '2019-07-25 02:06:14');
INSERT INTO `admin_operation_log` VALUES (571, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 02:06:15', '2019-07-25 02:06:15');
INSERT INTO `admin_operation_log` VALUES (572, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 02:06:16', '2019-07-25 02:06:16');
INSERT INTO `admin_operation_log` VALUES (573, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 02:18:00', '2019-07-25 02:18:00');
INSERT INTO `admin_operation_log` VALUES (574, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:39:48', '2019-07-25 03:39:48');
INSERT INTO `admin_operation_log` VALUES (575, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:40:05', '2019-07-25 03:40:05');
INSERT INTO `admin_operation_log` VALUES (576, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:40:39', '2019-07-25 03:40:39');
INSERT INTO `admin_operation_log` VALUES (577, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:42:47', '2019-07-25 03:42:47');
INSERT INTO `admin_operation_log` VALUES (578, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:48:15', '2019-07-25 03:48:15');
INSERT INTO `admin_operation_log` VALUES (579, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:48:51', '2019-07-25 03:48:51');
INSERT INTO `admin_operation_log` VALUES (580, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:49:00', '2019-07-25 03:49:00');
INSERT INTO `admin_operation_log` VALUES (581, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:49:07', '2019-07-25 03:49:07');
INSERT INTO `admin_operation_log` VALUES (582, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:49:09', '2019-07-25 03:49:09');
INSERT INTO `admin_operation_log` VALUES (583, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:51:11', '2019-07-25 03:51:11');
INSERT INTO `admin_operation_log` VALUES (584, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:51:57', '2019-07-25 03:51:57');
INSERT INTO `admin_operation_log` VALUES (585, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:57:17', '2019-07-25 03:57:17');
INSERT INTO `admin_operation_log` VALUES (586, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:57:55', '2019-07-25 03:57:55');
INSERT INTO `admin_operation_log` VALUES (587, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:57:58', '2019-07-25 03:57:58');
INSERT INTO `admin_operation_log` VALUES (588, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 03:58:05', '2019-07-25 03:58:05');
INSERT INTO `admin_operation_log` VALUES (589, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:00:58', '2019-07-25 04:00:58');
INSERT INTO `admin_operation_log` VALUES (590, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:02:26', '2019-07-25 04:02:26');
INSERT INTO `admin_operation_log` VALUES (591, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:02:41', '2019-07-25 04:02:41');
INSERT INTO `admin_operation_log` VALUES (592, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:05:05', '2019-07-25 04:05:05');
INSERT INTO `admin_operation_log` VALUES (593, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:05:16', '2019-07-25 04:05:16');
INSERT INTO `admin_operation_log` VALUES (594, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:15:41', '2019-07-25 04:15:41');
INSERT INTO `admin_operation_log` VALUES (595, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:16:33', '2019-07-25 04:16:33');
INSERT INTO `admin_operation_log` VALUES (596, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:16:39', '2019-07-25 04:16:39');
INSERT INTO `admin_operation_log` VALUES (597, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:16:59', '2019-07-25 04:16:59');
INSERT INTO `admin_operation_log` VALUES (598, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:17:04', '2019-07-25 04:17:04');
INSERT INTO `admin_operation_log` VALUES (599, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:17:15', '2019-07-25 04:17:15');
INSERT INTO `admin_operation_log` VALUES (600, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:17:22', '2019-07-25 04:17:22');
INSERT INTO `admin_operation_log` VALUES (601, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:17:31', '2019-07-25 04:17:31');
INSERT INTO `admin_operation_log` VALUES (602, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:17:43', '2019-07-25 04:17:43');
INSERT INTO `admin_operation_log` VALUES (603, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:17:49', '2019-07-25 04:17:49');
INSERT INTO `admin_operation_log` VALUES (604, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:18:47', '2019-07-25 04:18:47');
INSERT INTO `admin_operation_log` VALUES (605, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 04:18:49', '2019-07-25 04:18:49');
INSERT INTO `admin_operation_log` VALUES (606, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:11:04', '2019-07-25 06:11:04');
INSERT INTO `admin_operation_log` VALUES (607, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:39:49', '2019-07-25 06:39:49');
INSERT INTO `admin_operation_log` VALUES (608, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:39:56', '2019-07-25 06:39:56');
INSERT INTO `admin_operation_log` VALUES (609, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:39:58', '2019-07-25 06:39:58');
INSERT INTO `admin_operation_log` VALUES (610, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:49:02', '2019-07-25 06:49:02');
INSERT INTO `admin_operation_log` VALUES (611, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:51:16', '2019-07-25 06:51:16');
INSERT INTO `admin_operation_log` VALUES (612, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:52:13', '2019-07-25 06:52:13');
INSERT INTO `admin_operation_log` VALUES (613, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:53:02', '2019-07-25 06:53:02');
INSERT INTO `admin_operation_log` VALUES (614, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:53:51', '2019-07-25 06:53:51');
INSERT INTO `admin_operation_log` VALUES (615, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:56:12', '2019-07-25 06:56:12');
INSERT INTO `admin_operation_log` VALUES (616, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:56:17', '2019-07-25 06:56:17');
INSERT INTO `admin_operation_log` VALUES (617, 1, 'admin/category/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:56:19', '2019-07-25 06:56:19');
INSERT INTO `admin_operation_log` VALUES (618, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:56:19', '2019-07-25 06:56:19');
INSERT INTO `admin_operation_log` VALUES (619, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 06:56:23', '2019-07-25 06:56:23');
INSERT INTO `admin_operation_log` VALUES (620, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 06:56:23', '2019-07-25 06:56:23');
INSERT INTO `admin_operation_log` VALUES (621, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:08:46', '2019-07-25 07:08:46');
INSERT INTO `admin_operation_log` VALUES (622, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:08:51', '2019-07-25 07:08:51');
INSERT INTO `admin_operation_log` VALUES (623, 1, 'admin/category/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:08:55', '2019-07-25 07:08:55');
INSERT INTO `admin_operation_log` VALUES (624, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:08:55', '2019-07-25 07:08:55');
INSERT INTO `admin_operation_log` VALUES (625, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:08:56', '2019-07-25 07:08:56');
INSERT INTO `admin_operation_log` VALUES (626, 1, 'admin/category/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:09:19', '2019-07-25 07:09:19');
INSERT INTO `admin_operation_log` VALUES (627, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:09:19', '2019-07-25 07:09:19');
INSERT INTO `admin_operation_log` VALUES (628, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:09:20', '2019-07-25 07:09:20');
INSERT INTO `admin_operation_log` VALUES (629, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:09:58', '2019-07-25 07:09:58');
INSERT INTO `admin_operation_log` VALUES (630, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:19:25', '2019-07-25 07:19:25');
INSERT INTO `admin_operation_log` VALUES (631, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:20:09', '2019-07-25 07:20:09');
INSERT INTO `admin_operation_log` VALUES (632, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:21:18', '2019-07-25 07:21:18');
INSERT INTO `admin_operation_log` VALUES (633, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:22:22', '2019-07-25 07:22:22');
INSERT INTO `admin_operation_log` VALUES (634, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:22:33', '2019-07-25 07:22:33');
INSERT INTO `admin_operation_log` VALUES (635, 1, 'admin/category', 'GET', '127.0.0.1', '{\"id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:22:39', '2019-07-25 07:22:39');
INSERT INTO `admin_operation_log` VALUES (636, 1, 'admin/category', 'GET', '127.0.0.1', '{\"id\":\"1\"}', '2019-07-25 07:22:41', '2019-07-25 07:22:41');
INSERT INTO `admin_operation_log` VALUES (637, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:22:44', '2019-07-25 07:22:44');
INSERT INTO `admin_operation_log` VALUES (638, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:23:08', '2019-07-25 07:23:08');
INSERT INTO `admin_operation_log` VALUES (639, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:23:53', '2019-07-25 07:23:53');
INSERT INTO `admin_operation_log` VALUES (640, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:24:08', '2019-07-25 07:24:08');
INSERT INTO `admin_operation_log` VALUES (641, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:24:38', '2019-07-25 07:24:38');
INSERT INTO `admin_operation_log` VALUES (642, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:25:32', '2019-07-25 07:25:32');
INSERT INTO `admin_operation_log` VALUES (643, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:25:56', '2019-07-25 07:25:56');
INSERT INTO `admin_operation_log` VALUES (644, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:26:35', '2019-07-25 07:26:35');
INSERT INTO `admin_operation_log` VALUES (645, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:26:38', '2019-07-25 07:26:38');
INSERT INTO `admin_operation_log` VALUES (646, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:31:12', '2019-07-25 07:31:12');
INSERT INTO `admin_operation_log` VALUES (647, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:31:50', '2019-07-25 07:31:50');
INSERT INTO `admin_operation_log` VALUES (648, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:31:53', '2019-07-25 07:31:53');
INSERT INTO `admin_operation_log` VALUES (649, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:31:59', '2019-07-25 07:31:59');
INSERT INTO `admin_operation_log` VALUES (650, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:33:22', '2019-07-25 07:33:22');
INSERT INTO `admin_operation_log` VALUES (651, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:33:29', '2019-07-25 07:33:29');
INSERT INTO `admin_operation_log` VALUES (652, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:33:41', '2019-07-25 07:33:41');
INSERT INTO `admin_operation_log` VALUES (653, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:34:10', '2019-07-25 07:34:10');
INSERT INTO `admin_operation_log` VALUES (654, 1, 'admin/category', 'GET', '127.0.0.1', '{\"id\":null,\"title\":\"\\u70ed\\u95e8\",\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:34:18', '2019-07-25 07:34:18');
INSERT INTO `admin_operation_log` VALUES (655, 1, 'admin/category', 'GET', '127.0.0.1', '{\"id\":null,\"title\":\"\\u70ed\\u95e8\"}', '2019-07-25 07:34:22', '2019-07-25 07:34:22');
INSERT INTO `admin_operation_log` VALUES (656, 1, 'admin/category', 'GET', '127.0.0.1', '{\"id\":null,\"title\":\"\\u70ed\\u95e8\"}', '2019-07-25 07:35:05', '2019-07-25 07:35:05');
INSERT INTO `admin_operation_log` VALUES (657, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:35:11', '2019-07-25 07:35:11');
INSERT INTO `admin_operation_log` VALUES (658, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null,\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:35:13', '2019-07-25 07:35:13');
INSERT INTO `admin_operation_log` VALUES (659, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:36:45', '2019-07-25 07:36:45');
INSERT INTO `admin_operation_log` VALUES (660, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:37:16', '2019-07-25 07:37:16');
INSERT INTO `admin_operation_log` VALUES (661, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:37:22', '2019-07-25 07:37:22');
INSERT INTO `admin_operation_log` VALUES (662, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:37:34', '2019-07-25 07:37:34');
INSERT INTO `admin_operation_log` VALUES (663, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":\"1\",\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:39:10', '2019-07-25 07:39:10');
INSERT INTO `admin_operation_log` VALUES (664, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":\"1\"}', '2019-07-25 07:39:12', '2019-07-25 07:39:12');
INSERT INTO `admin_operation_log` VALUES (665, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null,\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:39:14', '2019-07-25 07:39:14');
INSERT INTO `admin_operation_log` VALUES (666, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:39:26', '2019-07-25 07:39:26');
INSERT INTO `admin_operation_log` VALUES (667, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":\"2\",\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:39:28', '2019-07-25 07:39:28');
INSERT INTO `admin_operation_log` VALUES (668, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":\"2\"}', '2019-07-25 07:39:29', '2019-07-25 07:39:29');
INSERT INTO `admin_operation_log` VALUES (669, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null,\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:39:31', '2019-07-25 07:39:31');
INSERT INTO `admin_operation_log` VALUES (670, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:39:32', '2019-07-25 07:39:32');
INSERT INTO `admin_operation_log` VALUES (671, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:40:08', '2019-07-25 07:40:08');
INSERT INTO `admin_operation_log` VALUES (672, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:41:58', '2019-07-25 07:41:58');
INSERT INTO `admin_operation_log` VALUES (673, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:41:58', '2019-07-25 07:41:58');
INSERT INTO `admin_operation_log` VALUES (674, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null,\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:41:59', '2019-07-25 07:41:59');
INSERT INTO `admin_operation_log` VALUES (675, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:42:21', '2019-07-25 07:42:21');
INSERT INTO `admin_operation_log` VALUES (676, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:42:21', '2019-07-25 07:42:21');
INSERT INTO `admin_operation_log` VALUES (677, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:46:14', '2019-07-25 07:46:14');
INSERT INTO `admin_operation_log` VALUES (678, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 07:46:18', '2019-07-25 07:46:18');
INSERT INTO `admin_operation_log` VALUES (679, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null,\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:46:19', '2019-07-25 07:46:19');
INSERT INTO `admin_operation_log` VALUES (680, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:46:20', '2019-07-25 07:46:20');
INSERT INTO `admin_operation_log` VALUES (681, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:46:20', '2019-07-25 07:46:20');
INSERT INTO `admin_operation_log` VALUES (682, 1, 'admin/category', 'GET', '127.0.0.1', '{\"__search__\":null}', '2019-07-25 07:46:48', '2019-07-25 07:46:48');
INSERT INTO `admin_operation_log` VALUES (683, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:46:50', '2019-07-25 07:46:50');
INSERT INTO `admin_operation_log` VALUES (684, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:46:57', '2019-07-25 07:46:57');
INSERT INTO `admin_operation_log` VALUES (685, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:47:05', '2019-07-25 07:47:05');
INSERT INTO `admin_operation_log` VALUES (686, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:47:25', '2019-07-25 07:47:25');
INSERT INTO `admin_operation_log` VALUES (687, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:47:29', '2019-07-25 07:47:29');
INSERT INTO `admin_operation_log` VALUES (688, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:47:50', '2019-07-25 07:47:50');
INSERT INTO `admin_operation_log` VALUES (689, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:48:38', '2019-07-25 07:48:38');
INSERT INTO `admin_operation_log` VALUES (690, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:48:47', '2019-07-25 07:48:47');
INSERT INTO `admin_operation_log` VALUES (691, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:48:56', '2019-07-25 07:48:56');
INSERT INTO `admin_operation_log` VALUES (692, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:49:03', '2019-07-25 07:49:03');
INSERT INTO `admin_operation_log` VALUES (693, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:49:11', '2019-07-25 07:49:11');
INSERT INTO `admin_operation_log` VALUES (694, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:49:17', '2019-07-25 07:49:17');
INSERT INTO `admin_operation_log` VALUES (695, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:50:23', '2019-07-25 07:50:23');
INSERT INTO `admin_operation_log` VALUES (696, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:55:58', '2019-07-25 07:55:58');
INSERT INTO `admin_operation_log` VALUES (697, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:56:06', '2019-07-25 07:56:06');
INSERT INTO `admin_operation_log` VALUES (698, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:56:08', '2019-07-25 07:56:08');
INSERT INTO `admin_operation_log` VALUES (699, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:56:16', '2019-07-25 07:56:16');
INSERT INTO `admin_operation_log` VALUES (700, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:56:57', '2019-07-25 07:56:57');
INSERT INTO `admin_operation_log` VALUES (701, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:57:09', '2019-07-25 07:57:09');
INSERT INTO `admin_operation_log` VALUES (702, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:57:47', '2019-07-25 07:57:47');
INSERT INTO `admin_operation_log` VALUES (703, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:58:43', '2019-07-25 07:58:43');
INSERT INTO `admin_operation_log` VALUES (704, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:58:49', '2019-07-25 07:58:49');
INSERT INTO `admin_operation_log` VALUES (705, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 07:58:53', '2019-07-25 07:58:53');
INSERT INTO `admin_operation_log` VALUES (706, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:00:17', '2019-07-25 08:00:17');
INSERT INTO `admin_operation_log` VALUES (707, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:00:59', '2019-07-25 08:00:59');
INSERT INTO `admin_operation_log` VALUES (708, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:01:18', '2019-07-25 08:01:18');
INSERT INTO `admin_operation_log` VALUES (709, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:02:10', '2019-07-25 08:02:10');
INSERT INTO `admin_operation_log` VALUES (710, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:02:40', '2019-07-25 08:02:40');
INSERT INTO `admin_operation_log` VALUES (711, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:02:41', '2019-07-25 08:02:41');
INSERT INTO `admin_operation_log` VALUES (712, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:03:07', '2019-07-25 08:03:07');
INSERT INTO `admin_operation_log` VALUES (713, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:03:10', '2019-07-25 08:03:10');
INSERT INTO `admin_operation_log` VALUES (714, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:04:15', '2019-07-25 08:04:15');
INSERT INTO `admin_operation_log` VALUES (715, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:04:21', '2019-07-25 08:04:21');
INSERT INTO `admin_operation_log` VALUES (716, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:05:14', '2019-07-25 08:05:14');
INSERT INTO `admin_operation_log` VALUES (717, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:05:23', '2019-07-25 08:05:23');
INSERT INTO `admin_operation_log` VALUES (718, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:05:42', '2019-07-25 08:05:42');
INSERT INTO `admin_operation_log` VALUES (719, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:06:23', '2019-07-25 08:06:23');
INSERT INTO `admin_operation_log` VALUES (720, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:06:48', '2019-07-25 08:06:48');
INSERT INTO `admin_operation_log` VALUES (721, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:08:51', '2019-07-25 08:08:51');
INSERT INTO `admin_operation_log` VALUES (722, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:08:53', '2019-07-25 08:08:53');
INSERT INTO `admin_operation_log` VALUES (723, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:09:08', '2019-07-25 08:09:08');
INSERT INTO `admin_operation_log` VALUES (724, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:09:22', '2019-07-25 08:09:22');
INSERT INTO `admin_operation_log` VALUES (725, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:10:42', '2019-07-25 08:10:42');
INSERT INTO `admin_operation_log` VALUES (726, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:11:13', '2019-07-25 08:11:13');
INSERT INTO `admin_operation_log` VALUES (727, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:11:47', '2019-07-25 08:11:47');
INSERT INTO `admin_operation_log` VALUES (728, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:12:04', '2019-07-25 08:12:04');
INSERT INTO `admin_operation_log` VALUES (729, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:12:41', '2019-07-25 08:12:41');
INSERT INTO `admin_operation_log` VALUES (730, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:13:14', '2019-07-25 08:13:14');
INSERT INTO `admin_operation_log` VALUES (731, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:13:24', '2019-07-25 08:13:24');
INSERT INTO `admin_operation_log` VALUES (732, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:13:27', '2019-07-25 08:13:27');
INSERT INTO `admin_operation_log` VALUES (733, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:13:51', '2019-07-25 08:13:51');
INSERT INTO `admin_operation_log` VALUES (734, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:13:51', '2019-07-25 08:13:51');
INSERT INTO `admin_operation_log` VALUES (735, 1, 'admin/category', 'POST', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"2\",\"weigh\":\"3\",\"_token\":\"jSMeWmHkmeXa0398iJ0Hjby1vOd4grK6yi4TmcWW\"}', '2019-07-25 08:13:59', '2019-07-25 08:13:59');
INSERT INTO `admin_operation_log` VALUES (736, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:13:59', '2019-07-25 08:13:59');
INSERT INTO `admin_operation_log` VALUES (737, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:14:11', '2019-07-25 08:14:11');
INSERT INTO `admin_operation_log` VALUES (738, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:14:11', '2019-07-25 08:14:11');
INSERT INTO `admin_operation_log` VALUES (739, 1, 'admin/category', 'POST', '127.0.0.1', '{\"parent_id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\",\"weigh\":\"3\",\"_token\":\"jSMeWmHkmeXa0398iJ0Hjby1vOd4grK6yi4TmcWW\"}', '2019-07-25 08:14:18', '2019-07-25 08:14:18');
INSERT INTO `admin_operation_log` VALUES (740, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:14:18', '2019-07-25 08:14:18');
INSERT INTO `admin_operation_log` VALUES (741, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:14:35', '2019-07-25 08:14:35');
INSERT INTO `admin_operation_log` VALUES (742, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:14:53', '2019-07-25 08:14:53');
INSERT INTO `admin_operation_log` VALUES (743, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:15:44', '2019-07-25 08:15:44');
INSERT INTO `admin_operation_log` VALUES (744, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:17:07', '2019-07-25 08:17:07');
INSERT INTO `admin_operation_log` VALUES (745, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:17:16', '2019-07-25 08:17:16');
INSERT INTO `admin_operation_log` VALUES (746, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:17:17', '2019-07-25 08:17:17');
INSERT INTO `admin_operation_log` VALUES (747, 1, 'admin/category', 'POST', '127.0.0.1', '{\"parent_id\":\"3\",\"title\":\"A\\u7ec41\",\"weigh\":\"3\",\"_token\":\"jSMeWmHkmeXa0398iJ0Hjby1vOd4grK6yi4TmcWW\"}', '2019-07-25 08:18:48', '2019-07-25 08:18:48');
INSERT INTO `admin_operation_log` VALUES (748, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:18:48', '2019-07-25 08:18:48');
INSERT INTO `admin_operation_log` VALUES (749, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:21:40', '2019-07-25 08:21:40');
INSERT INTO `admin_operation_log` VALUES (750, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:22:05', '2019-07-25 08:22:05');
INSERT INTO `admin_operation_log` VALUES (751, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:22:19', '2019-07-25 08:22:19');
INSERT INTO `admin_operation_log` VALUES (752, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:22:20', '2019-07-25 08:22:20');
INSERT INTO `admin_operation_log` VALUES (753, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:22:32', '2019-07-25 08:22:32');
INSERT INTO `admin_operation_log` VALUES (754, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:26:20', '2019-07-25 08:26:20');
INSERT INTO `admin_operation_log` VALUES (755, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:26:42', '2019-07-25 08:26:42');
INSERT INTO `admin_operation_log` VALUES (756, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2019-07-25 08:27:05', '2019-07-25 08:27:05');
INSERT INTO `admin_operation_log` VALUES (757, 1, 'admin/category', 'POST', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"U\\u76d8\",\"weigh\":\"1\",\"_token\":\"jSMeWmHkmeXa0398iJ0Hjby1vOd4grK6yi4TmcWW\"}', '2019-07-25 08:27:17', '2019-07-25 08:27:17');
INSERT INTO `admin_operation_log` VALUES (758, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 08:27:18', '2019-07-25 08:27:18');
INSERT INTO `admin_operation_log` VALUES (759, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 08:27:47', '2019-07-25 08:27:47');
INSERT INTO `admin_operation_log` VALUES (760, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 08:28:32', '2019-07-25 08:28:32');
INSERT INTO `admin_operation_log` VALUES (761, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2019-07-25 08:31:55', '2019-07-25 08:31:55');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, '仪表盘', 'dashboard ', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (6, '文章管理员', 'custom-user', '', '/category\r\n/article', '2019-07-23 07:51:12', '2019-07-23 09:35:52');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (3, 10, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (3, 8, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (3, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (3, 6, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (3, 3, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2019-07-23 06:48:39', '2019-07-23 06:48:39');
INSERT INTO `admin_roles` VALUES (3, '文章管理员角色', 'custom-sun', '2019-07-23 07:51:50', '2019-07-23 09:36:16');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$7f64h8MsC0.S9RiU/OKkluOtggTygLq8DsmCAbgANvyQyr/5eJJWe', 'Administrator', NULL, 'Hb7QM9MzssEJgXowUpPveBI95mjHOTKIywmUlw3PdugqBdBscoNn1DZhoN80', '2019-07-23 06:48:39', '2019-07-25 01:49:44');
INSERT INTO `admin_users` VALUES (3, 'sun', '$2y$10$5jFb6PgeRe/QV4gvgCPEe.PZrHwK7Y7tGXpCiLRCh4uZ3LyNIdiqO', '孙林', NULL, 'NA140y8FpyelseyhN5JlxKnV9wSpCkxWn5zvU2QJ3vRRU4X588hfq9dCzv4X', '2019-07-23 07:52:20', '2019-07-23 07:52:20');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `parent_id` int(10) NOT NULL DEFAULT 0 COMMENT '父ID',
  `thumbnail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '大图',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件地址',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编辑器',
  `is_rec` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐 0.不推荐 1.推荐',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `parent_id` int(10) NOT NULL DEFAULT 0 COMMENT '父ID',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '热门', 0, 1, '2019-07-25 16:31:33', '2019-07-25 16:31:35');
INSERT INTO `category` VALUES (2, '重装', 0, 2, '2019-07-25 16:31:43', '2019-07-25 16:31:53');
INSERT INTO `category` VALUES (3, '分区', 0, 3, '2019-07-25 16:31:47', '2019-07-25 16:31:52');
INSERT INTO `category` VALUES (4, '其他', 0, 4, '2019-07-25 16:31:45', '2019-07-25 16:31:50');
INSERT INTO `category` VALUES (5, 'U盘', 2, 1, '2019-07-25 08:27:17', '2019-07-25 08:27:17');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
