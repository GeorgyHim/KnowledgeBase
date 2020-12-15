read_str(S):-get0(X), r_str(X,S,[]).

r_str(10,S,S):-!.
r_str(X,S,B):-append(B,[X],B1),  get0(X1),  r_str(X1,S,B1).

% Отдельные исполнители
solo('Lana Del Rey').
solo('Noize MC').
solo('Земфира').

% Женщина-исполнитель
woman('Земфира')
woman('Lana Del Rey')

% Иностранные коллективы и исполнители
foreign('Arctic Monkeys').
foreign('Avenged Sevenfold').
foreign('Black Sabbath').
foreign('Bring Me The Horizon').
foreign('Deep Purple').
foreign('Green Day').
foreign('Guns N Roses').
foreign('Imagine Dragons').
foreign('Iron Maiden').
foreign('Judas Priest').
foreign('Kiss').
foreign('Lana Del Rey').
foreign('Led Zeppelin').
foreign('Linkin Park').
foreign('Metallica').
foreign('Muse').
foreign('Papa Roach').
foreign('Queen').
foreign('Red Hot Chili Peppers').
foreign('Scorpions').
foreign('System of a Down').
foreign('The Beatles').

% Американские группы
american('Avenged Sevenfold')
american('Green Day')
american('Guns N Roses')
american('Imagine Dragons')
american('Kiss')
american('')


% Британские группы
british('Arctic Monkeys')
british('Black Sabbath')
british('Bring Me The Horizon')
british('Deep Purple')
british('Iron Maiden')
british('Judas Priest')
british('')


% Группы, которые продолжают деятельность
still_exist('Arctic Monkeys')
still_exist('Avenged Sevenfold')
still_exist('Bring Me The Horizon')
still_exist('Deep Purple')
still_exist('Green Day')
still_exist('Guns N Roses')
still_exist('Imagine Dragons')
still_exist('Iron Maiden')
still_exist('Judas Priest')
still_exist('Kiss')
still_exist('')


% Arctic Monkeys            -   !solo, foreign,
% Avenged Sevenfold         -   !solo, foreign,
% Black Sabbath             -   !solo, foreign,
% Bring Me The Horizon      -   !solo, foreign,
% Deep Purple               -   !solo, foreign,
% Green Day                 -   !solo, foreign,
% Guns N Roses              -   !solo, foreign,
% Imagine Dragons           -   !solo, foreign,
% Iron Maiden               -   !solo, foreign,
% Judas Priest              -   !solo, foreign,
% Kiss                      -   !solo, foreign,
% Lana Del Rey              -   solo, woman, foreign    $
% Led Zeppelin              -   !solo, foreign,
% Linkin Park               -   !solo, foreign,
% Metallica                 -   !solo, foreign,
% Muse                      -   !solo, foreign,
% Noize MC                  -   solo, !woman, !foreign  $
% Papa Roach                -   !solo, foreign,
% Queen                     -   !solo, foreign,
% Red Hot Chili Peppers     -   !solo, foreign,
% Scorpions                 -   !solo, foreign,
% System of a Down          -   !solo, foreign,
% The Beatles               -   !solo, foreign,
% Агата Кристи              -   !solo, !foreign,
% Алиса                     -   !solo, !foreign,
% Ария                      -   !solo, !foreign,
% Гражданская Оборона       -   !solo, !foreign,
% Земфира                   -   solo, woman, !foreign   $
% Кино                      -   !solo, !foreign,
% Король и Шут              -   !solo, !foreign,
% Машина Времени            -   !solo, !foreign,
% Сплин                     -   !solo, !foreign,
