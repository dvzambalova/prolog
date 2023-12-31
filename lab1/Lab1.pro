﻿/*
Задание 6:
Столицы, государства, части света, население + средние цены на билеты.
*/

% country(id, "country", "part of the world", population(millions)).
country(1, "Argentina", "South America", 45.77).
country(2, "Australia", "Australia", 26.47).
country(3, "Brazil", "South America", 216.42).
country(4, "Canada", "North America", 38.86).
country(5, "China", "Asia", 1425.67).
country(6, "Egypt", "Africa", 109.55).
country(7, "France", "Europe", 68.04).
country(8, "Germany", "Europe", 84.43).
country(9, "Greece", "Europe", 10.48).
country(10, "India", "Asia", 1428.63).
country(11, "Italy", "Europe", 58.85).
country(12, "Japan", "Asia", 125.41).
country(13, "Mexico", "North America", 129.88).
country(14, "Mongolia", "Asia", 3.48).
country(15, "Portugal", "Europe", 10.47).
country(16, "South Korea", "Asia", 51.78).
country(17, "Spain", "Europe", 48.35).
country(18, "United Arab Emirates", "Asia", 9.28).
country(19, "United Kingdom", "Europe", 66.97).
country(20, "USA", "North America", 339.99).

% capital(id, "capital", population(millions), average_price_on_ticket(rub)).
capital(21, "Buenos Aires", 15.49, 107000).
capital(22, "Canberra", 0.47, 55000).
capital(23, "Brasilia", 4.87, 11000).
capital(24, "Ottawa", 1.05, 77000).
capital(25, "Beijing", 21.77, 25000).
capital(26, "Cairo", 22.18, 21000).
capital(27, "Paris", 11.21, 20000).
capital(28, "Berlin", 3.57, 20000).
capital(29, "Athens", 0.64, 21000).
capital(30, "New Delhi", 28.51, 22000).
capital(31, "Rome", 4.31, 26000).
capital(32, "Tokyo", 37.19, 33000).
capital(33, "Mexico City", 21.80, 91000).
capital(34, "Ulaanbaatar", 1.67, 25000).
capital(35, "Lisbon", 2.90, 30000).
capital(36, "Seoul", 9.99, 33000.
capital(37, "Madrid", 3.22, 25000).
capital(38, "Abu Dhabi", 1.57, 17000).
capital(39, "London", 14.80, 24000).
capital(40, "Washington, D.C.", 7.95, 67000).

% present(id_capital, id_country).
present(21, 1).
present(22, 2).
present(23, 3).
present(24, 4).
present(25, 5).
present(26, 6).
present(27, 7).
present(28, 8).
present(29, 9).
present(30, 10).
present(31, 11).
present(32, 12).
present(33, 13).
present(34, 14).
present(35, 15).
present(36, 16).
present(37, 17).
present(38, 18).
present(39, 19).
present(40, 20).

% CN - country
% CP - capital
% PW - part of the world
% PP - population
% PR - price on ticket (average)

% Генерация столиц для заданной части света
capitals(PW, CP) :- 
    capital(CPid, CP, _, _), 
    country(CNid, _, PW, _),
    present(CPid, CNid).

% Часть света для столицы по id_столицы
partoftheworld(CPid, PW) :- 
    capital(CPid, _, _, _), 
    country(CNid, _, PW, _), 
    present(CPid, CNid).

% Самые густонаселенные столицы (больше 10 млн) для заданной части света 
populationmax(PW, CP, PPcp) :- 
    capital(CPid, CP, PPcp, _), 
    country(CNid, _, PW, _), 
    present(CPid, CNid), 
    PPcp>10.

% Самые малонаселенные страны (меньше 50 млн) для заданной части света 
populationmin(PW, CN, PPcn) :- 
    country(CNid, CN, PW, PPcn), 
    PPcn<50.

% цена билета до столицы по id_страны
ticket(CNid, PR) :- 
    capital(CPid, _, _, PR), 
    country(CNid, _, _, _), 
    present(CPid, CNid).

/*
 Тестовый ввод и результат:
? - capitals("South America", CP).
CP = "Buenos Aires".
CP = "Brasilia".

? - partoftheworld(30, PW).
PW = "Asia".

? - populationmax("Africa", CP, PPcp).
CP = "Cairo".
PPCP = 22.18.

? - populationmin("Europe", CN, PPcn).
CN = "Greece".
PPCN = 10.48.
CN = "Portugal".
PPCN = 10.47.
CN = "Spain".
PPCN = 48.35.

? - ticket(4, PR).
PR = 77000.

*/
