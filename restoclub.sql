-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 09 2017 г., 02:55
-- Версия сервера: 5.7.16
-- Версия PHP: 7.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `restoclub`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author_article`
--

CREATE TABLE `author_article` (
  `id` int(11) NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `author_article`
--

INSERT INTO `author_article` (`id`, `author`, `link`) VALUES
(1, 'Владимир', 'http://test.ru'),
(2, 'Вася', 'http://vasya.com');

-- --------------------------------------------------------

--
-- Структура таблицы `base_article`
--

CREATE TABLE `base_article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publish_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `base_article`
--

INSERT INTO `base_article` (`id`, `title`, `text`, `slug`, `created_at`, `updated_at`, `type`, `publish_at`) VALUES
(1, 'Авторская статья 1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'avtorskaia-statia-1', '2017-10-09 00:49:23', '2017-10-09 00:49:23', 'author_article', '2012-01-01 00:00:00'),
(2, 'Авторская статья 2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'avtorskaia-statia-2', '2017-10-09 00:51:04', '2017-10-09 00:51:04', 'author_article', '2015-04-04 03:04:00'),
(4, 'Статья 1', 'Текст статьи', 'statia-1', '2017-10-09 01:16:26', '2017-10-09 01:24:48', 'simple_article', '2012-01-01 00:00:00'),
(5, 'Название 2', 'Текст статьи', 'nazvanie-2', '2017-10-09 01:16:59', '2017-10-09 01:17:13', 'simple_article', '2013-03-05 04:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `simple_article`
--

CREATE TABLE `simple_article` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `simple_article`
--

INSERT INTO `simple_article` (`id`) VALUES
(4),
(5);

-- --------------------------------------------------------

--
-- Структура таблицы `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tag`
--

INSERT INTO `tag` (`id`, `name`, `created_at`) VALUES
(1, 'путешествия', '2017-10-09 00:26:12'),
(2, 'авто', '2017-10-09 00:26:26'),
(3, 'спорт', '2017-10-09 00:26:29'),
(4, 'погода', '2017-10-09 00:26:52'),
(5, 'наука', '2017-10-09 00:26:56'),
(6, 'образование', '2017-10-09 00:27:01'),
(7, 'работа', '2017-10-09 00:27:04');

-- --------------------------------------------------------

--
-- Структура таблицы `tag_articles`
--

CREATE TABLE `tag_articles` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tag_articles`
--

INSERT INTO `tag_articles` (`article_id`, `tag_id`) VALUES
(4, 1),
(4, 2),
(4, 4),
(4, 6),
(5, 1),
(5, 3),
(5, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author_article`
--
ALTER TABLE `author_article`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `base_article`
--
ALTER TABLE `base_article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_363CB702989D9B62` (`slug`);

--
-- Индексы таблицы `simple_article`
--
ALTER TABLE `simple_article`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tag_articles`
--
ALTER TABLE `tag_articles`
  ADD PRIMARY KEY (`article_id`,`tag_id`),
  ADD KEY `IDX_89EC4AB37294869C` (`article_id`),
  ADD KEY `IDX_89EC4AB3BAD26311` (`tag_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `base_article`
--
ALTER TABLE `base_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `author_article`
--
ALTER TABLE `author_article`
  ADD CONSTRAINT `FK_47009125BF396750` FOREIGN KEY (`id`) REFERENCES `base_article` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `simple_article`
--
ALTER TABLE `simple_article`
  ADD CONSTRAINT `FK_4873109DBF396750` FOREIGN KEY (`id`) REFERENCES `base_article` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tag_articles`
--
ALTER TABLE `tag_articles`
  ADD CONSTRAINT `FK_89EC4AB37294869C` FOREIGN KEY (`article_id`) REFERENCES `simple_article` (`id`),
  ADD CONSTRAINT `FK_89EC4AB3BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
