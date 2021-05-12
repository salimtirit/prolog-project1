human(john).
human(jack).
human(alice).
human(bob).

likes(john, alice).
likes(bob, alice).
likes(alice, bob).

similar_taste(Name1, Name2) :- likes(Name1, Something), likes(Name2, Something), \+(Name1 = Name2).

% base case
length_of([], 0).
% recursive case
length_of(List, Length) :-
    [_|Tail] = List,
    length_of(Tail, TailLength),
    Length is TailLength+1.

% multiply_by_two(+List1, -List2)
multiply_by_two([], []).
multiply_by_two([Head|Tail], Result) :-
    multiply_by_two(Tail, TailResult),
    HeadResult is Head*2,
    Result = [HeadResult|TailResult].

% concatenate(?List1, ?List2, ?Result)
concatenate([], List, List).
concatenate([H1|T1], List2, [H1|TailResult]) :-
    concatenate(T1, List2, TailResult).


my_max(Num1, Num2, Maximum) :-
    (Num1 > Num2, Maximum = Num1);
    (Num2 > Num1, Maximum = Num2);
    (Num1 = Num2, Maximum = 0).


my_member(Num, ListofList) :-
    member(List, ListofList),
    (Num, List).

find_all_members(AllAlternatives) :-
    findall(Name1-Name2, similar_taste(Name1, Name2), AllAlternatives).


% divide_dashed_list(+List, -First, -Second)
divide_dashed_list([], [], []).
divide_dashed_list([Head|Tail], [HeadFirst|TailFirst], [HeadSecond|TailSecond]) :-
    HeadFirst-HeadSecond = Head,
    divide_dashed_list(Tail, TailFirst, TailSecond).

multiply_two_lists([], [], []).
multiply_two_lists([H1|T1], [H2|T2], [Head|TailResult]) :-
    multiply_two_lists(T1, T2, TailResult),
    Head is H1*H2.

%concatenate([], List, List).
%concatenate([H1|T1], List2, Result) :-
%    concatenate(T1, List2, TailResult),
%    (
%        (member(H1,TailResult),Result = TailResult,!);Result = [H1|TailResult]
%    ).