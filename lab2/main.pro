implement main
    open core, stdio

domains
    unit = europe; asia; africa; australia; north_america; south_america.

class facts - map
    city : (integer Id, string Город, unit Units, real Население).
    country : (integer Id, string Страна, real Население).
    present : (integer IdСтраны, integer IdГорода).

class facts
    s : (real Sum) single.

clauses
    s(0).

class predicates
    list_of_cities : (string Название_страны) nondeterm.
    is_situated : (string Название_города) nondeterm.
    total_population : (string Название_страны) nondeterm.
    total_population_with_list : (string Название_страны) failure.

clauses
    list_of_cities(X) :-
        country(Id, X, _),
        writef("Cities in %:\n", X),
        present(Id, IdГ),
        city(IdГ, НазваниеГорода, _, _),
        writef("\t%\n", НазваниеГорода),
        fail.
    list_of_cities(X) :-
        country(_, X, _),
        write("End of the list\n").

    is_situated(X) :-
        city(Id, X, _, _),
        writef("% is situated in:\n", X),
        present(IdС, Id),
        country(IdС, Название, _),
        writef("\t%\n", Название),
        fail.
    is_situated(X) :-
        city(_, X, _, _),
        write("End of the list\n").

    total_population(X) :-
        country(Id, X, _),
        assert(s(0)),
        present(Id, IdГ),
        city(IdГ, _, _, Население),
        s(Sum),
        assert(s(Sum + Население)),
        fail.
    total_population(X) :-
        country(_, X, _),
        s(Sum),
        writef("Population of % is % millions", X, Sum),
        nl.

    total_population_with_list(X) :-
        total_population(X),
        country(Id, X, _),
        present(Id, IdГ),
        city(IdГ, Название, _, Население),
        writef("\t%: % millions\n", Название, Население),
        fail.

clauses
    run() :-
        file::consult("data.txt", map),
        fail.

    run() :-
        list_of_cities("Russia"),
        fail.

    run() :-
        is_situated("Las Vegas"),
        fail.

    run() :-
        total_population("South Korea"),
        fail.

    run() :-
        total_population_with_list("Italy").

    run().

end implement main

goal
    console::runUtf8(main::run).
