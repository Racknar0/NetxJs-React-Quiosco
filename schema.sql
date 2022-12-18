/*
 Navicat Premium Data Transfer

 Source Server         : railway
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : containers-us-west-66.railway.app:7705
 Source Schema         : railway

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 17/12/2022 21:37:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Categoria
-- ----------------------------
DROP TABLE IF EXISTS `Categoria`;
CREATE TABLE `Categoria`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icono` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Categoria
-- ----------------------------
INSERT INTO `Categoria` VALUES (1, 'Café', 'cafe');
INSERT INTO `Categoria` VALUES (2, 'Hamburguesas', 'hamburguesa');
INSERT INTO `Categoria` VALUES (3, 'Pizzas', 'pizza');
INSERT INTO `Categoria` VALUES (4, 'Donas', 'dona');
INSERT INTO `Categoria` VALUES (5, 'Pasteles', 'pastel');
INSERT INTO `Categoria` VALUES (6, 'Galletas', 'galletas');

-- ----------------------------
-- Table structure for Orden
-- ----------------------------
DROP TABLE IF EXISTS `Orden`;
CREATE TABLE `Orden`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `pedido` json NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Orden
-- ----------------------------
INSERT INTO `Orden` VALUES (5, 'ghjghj', '1658369030273', 49.9, '[{\"id\": 2, \"imagen\": \"cafe_02\", \"nombre\": \"Café Frio con Chocolate Grande\", \"precio\": 49.9, \"cantidad\": 1}]');

-- ----------------------------
-- Table structure for Producto
-- ----------------------------
DROP TABLE IF EXISTS `Producto`;
CREATE TABLE `Producto`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `categoriaId` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Producto_categoriaId_fkey`(`categoriaId` ASC) USING BTREE,
  CONSTRAINT `Producto_categoriaId_fkey` FOREIGN KEY (`categoriaId`) REFERENCES `Categoria` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Producto
-- ----------------------------
INSERT INTO `Producto` VALUES (1, 'Café Caramel con Chocolate', 59.9, 'cafe_01', 1);
INSERT INTO `Producto` VALUES (2, 'Café Frio con Chocolate Grande', 49.9, 'cafe_02', 1);
INSERT INTO `Producto` VALUES (3, 'Latte Frio con Chocolate Grande', 54.9, 'cafe_03', 1);
INSERT INTO `Producto` VALUES (4, 'Latte Frio con Chocolate Grande', 54.9, 'cafe_04', 1);
INSERT INTO `Producto` VALUES (5, 'Malteada Fria con Chocolate Grande', 54.9, 'cafe_05', 1);
INSERT INTO `Producto` VALUES (6, 'Café Mocha Caliente Chico', 39.9, 'cafe_06', 1);
INSERT INTO `Producto` VALUES (7, 'Café Mocha Caliente Grande con Chocolate', 59.9, 'cafe_07', 1);
INSERT INTO `Producto` VALUES (8, 'Café Caliente Capuchino Grande', 59.9, 'cafe_08', 1);
INSERT INTO `Producto` VALUES (9, 'Café Mocha Caliente Mediano', 49.9, 'cafe_09', 1);
INSERT INTO `Producto` VALUES (10, 'Café Mocha Frio con Caramelo Mediano', 49.9, 'cafe_10', 1);
INSERT INTO `Producto` VALUES (11, 'Café Mocha Frio con Chocolate Mediano', 49.9, 'cafe_11', 1);
INSERT INTO `Producto` VALUES (12, 'Café Espresso', 29.9, 'cafe_12', 1);
INSERT INTO `Producto` VALUES (13, 'Café Capuchino Grande con Caramelo', 59.9, 'cafe_13', 1);
INSERT INTO `Producto` VALUES (14, 'Café Caramelo Grande', 59.9, 'cafe_14', 1);
INSERT INTO `Producto` VALUES (15, 'Paquete de 3 donas de Chocolate', 39.9, 'donas_01', 4);
INSERT INTO `Producto` VALUES (16, 'Paquete de 3 donas Glaseadas', 39.9, 'donas_02', 4);
INSERT INTO `Producto` VALUES (17, 'Dona de Fresa ', 19.9, 'donas_03', 4);
INSERT INTO `Producto` VALUES (18, 'Dona con Galleta de Chocolate ', 19.9, 'donas_04', 4);
INSERT INTO `Producto` VALUES (19, 'Dona glass con Chispas Sabor Fresa ', 19.9, 'donas_05', 4);
INSERT INTO `Producto` VALUES (20, 'Dona glass con Chocolate ', 19.9, 'donas_06', 4);
INSERT INTO `Producto` VALUES (21, 'Dona de Chocolate con MÁS Chocolate ', 19.9, 'donas_07', 4);
INSERT INTO `Producto` VALUES (22, 'Paquete de 3 donas de Chocolate ', 39.9, 'donas_08', 4);
INSERT INTO `Producto` VALUES (23, 'Paquete de 3 donas con Vainilla y Chocolate ', 39.9, 'donas_09', 4);
INSERT INTO `Producto` VALUES (24, 'Paquete de 6 Donas', 69.9, 'donas_10', 4);
INSERT INTO `Producto` VALUES (25, 'Paquete de 3 Variadas', 39.9, 'donas_11', 4);
INSERT INTO `Producto` VALUES (26, 'Dona Natural con Chocolate', 19.9, 'donas_12', 4);
INSERT INTO `Producto` VALUES (27, 'Paquete de 3 Donas de Chocolate con Chispas', 39.9, 'donas_13', 4);
INSERT INTO `Producto` VALUES (28, 'Dona Chocolate y Coco', 19.9, 'donas_14', 4);
INSERT INTO `Producto` VALUES (29, 'Paquete Galletas de Chocolate', 29.9, 'galletas_01', 6);
INSERT INTO `Producto` VALUES (30, 'Paquete Galletas de Chocolate y Avena', 39.9, 'galletas_02', 6);
INSERT INTO `Producto` VALUES (31, 'Paquete de Muffins de Vainilla', 39.9, 'galletas_03', 6);
INSERT INTO `Producto` VALUES (32, 'Paquete de 4 Galletas de Avena', 24.9, 'galletas_04', 6);
INSERT INTO `Producto` VALUES (33, 'Galletas de Mantequilla Variadas', 39.9, 'galletas_05', 6);
INSERT INTO `Producto` VALUES (34, 'Galletas de sabores frutales', 39.9, 'galletas_06', 6);
INSERT INTO `Producto` VALUES (35, 'Hamburguesa Sencilla', 59.9, 'hamburguesas_01', 2);
INSERT INTO `Producto` VALUES (36, 'Hamburguesa de Pollo', 59.9, 'hamburguesas_02', 2);
INSERT INTO `Producto` VALUES (37, 'Hamburguesa de Pollo y Chili', 59.9, 'hamburguesas_03', 2);
INSERT INTO `Producto` VALUES (38, 'Hamburguesa Queso y  Pepinos', 59.9, 'hamburguesas_04', 2);
INSERT INTO `Producto` VALUES (39, 'Hamburguesa Cuarto de Libra', 59.9, 'hamburguesas_05', 2);
INSERT INTO `Producto` VALUES (40, 'Hamburguesa Doble Queso', 69.9, 'hamburguesas_06', 2);
INSERT INTO `Producto` VALUES (41, 'Hot Dog Especial', 49.9, 'hamburguesas_07', 2);
INSERT INTO `Producto` VALUES (42, 'Paquete 2 Hot Dogs', 69.9, 'hamburguesas_08', 2);
INSERT INTO `Producto` VALUES (43, '4 Rebanadas de Pay de Queso', 69.9, 'pastel_01', 5);
INSERT INTO `Producto` VALUES (44, 'Waffle Especial', 49.9, 'pastel_02', 5);
INSERT INTO `Producto` VALUES (45, 'Croissants De la casa', 39.9, 'pastel_03', 5);
INSERT INTO `Producto` VALUES (46, 'Pay de Queso', 19.9, 'pastel_04', 5);
INSERT INTO `Producto` VALUES (47, 'Pastel de Chocolate', 29.9, 'pastel_05', 5);
INSERT INTO `Producto` VALUES (48, 'Rebanada Pastel de Chocolate', 29.9, 'pastel_06', 5);
INSERT INTO `Producto` VALUES (49, 'Pizza Spicy con Doble Queso', 69.9, 'pizzas_01', 3);
INSERT INTO `Producto` VALUES (50, 'Pizza Jamón y Queso', 69.9, 'pizzas_02', 3);
INSERT INTO `Producto` VALUES (51, 'Pizza Doble Queso', 69.9, 'pizzas_03', 3);
INSERT INTO `Producto` VALUES (52, 'Pizza Especial de la Casa', 69.9, 'pizzas_04', 3);
INSERT INTO `Producto` VALUES (53, 'Pizza Chorizo', 69.9, 'pizzas_05', 3);
INSERT INTO `Producto` VALUES (54, 'Pizza Hawaiana', 69.9, 'pizzas_06', 3);
INSERT INTO `Producto` VALUES (55, 'Pizza Tocino', 69.9, 'pizzas_07', 3);
INSERT INTO `Producto` VALUES (56, 'Pizza Vegetales y Queso', 69.9, 'pizzas_08', 3);
INSERT INTO `Producto` VALUES (57, 'Pizza Pepperoni y Queso', 69.9, 'pizzas_09', 3);
INSERT INTO `Producto` VALUES (58, 'Pizza Aceitunas y Queso', 69.9, 'pizzas_10', 3);
INSERT INTO `Producto` VALUES (59, 'Pizza Queso, Jamón y Champiñones', 69.9, 'pizzas_11', 3);

-- ----------------------------
-- Table structure for _prisma_migrations
-- ----------------------------
DROP TABLE IF EXISTS `_prisma_migrations`;
CREATE TABLE `_prisma_migrations`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) NULL DEFAULT NULL,
  `migration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `rolled_back_at` datetime(3) NULL DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _prisma_migrations
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
