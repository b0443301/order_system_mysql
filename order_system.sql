-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2017-06-07 11:11:10
-- 伺服器版本: 10.1.22-MariaDB
-- PHP 版本： 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `order_system`
--

-- --------------------------------------------------------

--
-- 資料表結構 `dinner`
--

CREATE TABLE `dinner` (
  `did` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `feeder`
--

CREATE TABLE `feeder` (
  `fid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `global`
--

CREATE TABLE `global` (
  `gid` int(11) NOT NULL,
  `version` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `global`
--

INSERT INTO `global` (`gid`, `version`) VALUES
(1, 'v1.0');

-- --------------------------------------------------------

--
-- 資料表結構 `item`
--

CREATE TABLE `item` (
  `itemid` int(11) NOT NULL,
  `itemname` text NOT NULL,
  `itemprice` int(11) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `item`
--

INSERT INTO `item` (`itemid`, `itemname`, `itemprice`, `sid`) VALUES
(16, '123', 123, 4),
(17, '456', 456, 4),
(18, '789', 789, 4);

-- --------------------------------------------------------

--
-- 資料表結構 `register`
--

CREATE TABLE `register` (
  `rid` int(11) NOT NULL,
  `account` text NOT NULL,
  `password` text NOT NULL,
  `random` text NOT NULL,
  `mail` text NOT NULL,
  `username` text NOT NULL,
  `telephone` text NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `register`
--

INSERT INTO `register` (`rid`, `account`, `password`, `random`, `mail`, `username`, `telephone`, `address`) VALUES
(23, 'admin', '12345', '0', '12345', '12345', '12345', '12345');

-- --------------------------------------------------------

--
-- 資料表結構 `store`
--

CREATE TABLE `store` (
  `sid` int(11) NOT NULL,
  `storename` text NOT NULL,
  `telephone` text NOT NULL,
  `address` text NOT NULL,
  `rid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `store`
--

INSERT INTO `store` (`sid`, `storename`, `telephone`, `address`, `rid`) VALUES
(4, '123', '123', '123', 23);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `dinner`
--
ALTER TABLE `dinner`
  ADD PRIMARY KEY (`did`),
  ADD KEY `rid` (`rid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `itemid` (`itemid`);

--
-- 資料表索引 `feeder`
--
ALTER TABLE `feeder`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `sid` (`sid`);

--
-- 資料表索引 `global`
--
ALTER TABLE `global`
  ADD PRIMARY KEY (`gid`);

--
-- 資料表索引 `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemid`),
  ADD KEY `sid` (`sid`);

--
-- 資料表索引 `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`rid`);

--
-- 資料表索引 `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `rid` (`rid`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `dinner`
--
ALTER TABLE `dinner`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- 使用資料表 AUTO_INCREMENT `feeder`
--
ALTER TABLE `feeder`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `global`
--
ALTER TABLE `global`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `item`
--
ALTER TABLE `item`
  MODIFY `itemid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- 使用資料表 AUTO_INCREMENT `register`
--
ALTER TABLE `register`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用資料表 AUTO_INCREMENT `store`
--
ALTER TABLE `store`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `dinner`
--
ALTER TABLE `dinner`
  ADD CONSTRAINT `dinner_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `register` (`rid`),
  ADD CONSTRAINT `dinner_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `store` (`sid`),
  ADD CONSTRAINT `dinner_ibfk_4` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`);

--
-- 資料表的 Constraints `feeder`
--
ALTER TABLE `feeder`
  ADD CONSTRAINT `feeder_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `register` (`rid`),
  ADD CONSTRAINT `feeder_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `store` (`sid`);

--
-- 資料表的 Constraints `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `store` (`sid`);

--
-- 資料表的 Constraints `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `register` (`rid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
