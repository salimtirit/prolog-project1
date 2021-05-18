% include the knowledge base
:- ['load.pro'].

% 3.1 glanian_distance(Name1, Name2, Distance) 5 points
find_distance([],[],0).

find_distance([Head1|Tail1],[Head2|Tail2],Distance):-
    find_distance(Tail1,Tail2,Distance1),
    (
        (Head1 = -1,Distance is Distance1, !);
        (Temp1 is Head1 - Head2,Temp2 is Temp1^2,Distance is Distance1 + Temp2)
    ).

glanian_distance(Name1,Name2,Distance):-
    expects(Name1,_,List1),
    glanian(Name2,_,List2),
    find_distance(List1,List2,Distance1),
    Distance is sqrt(Distance1).
% 3.2 weighted_glanian_distance(Name1, Name2, Distance) 10 points

find_weighted_distance([],_,[],0).

find_weighted_distance([Head1|Tail1],[WeightHead|WeightTail],[Head2|Tail2],Distance):-
    find_weighted_distance(Tail1,WeightTail,Tail2,Distance1),
    (
        (Head1 = -1,Distance is Distance1, !);
        (Temp1 is Head1 - Head2,Temp2 is Temp1^2,Temp3 is WeightHead*Temp2,Distance is Distance1 + Temp3)
    ).

weighted_glanian_distance(Name1, Name2, Distance):-
    expects(Name1,_,List1),
    weight(Name1,WeightList),
    glanian(Name2,_,List2),
    find_weighted_distance(List1,WeightList,List2,Distance1),
    Distance is sqrt(Distance1).

% 3.3 find_possible_cities(Name, CityList) 5 points

find_possible_cities(Name, CityList):-
    city(X,Y,_),
    member(Name,Y),
    likes(Name,_,LikedCities),
    union([X],LikedCities,CityList),!.

% 3.4 merge_possible_cities(Name1, Name2, MergedCities) 5 points

merge_possible_cities(Name1, Name2, MergedCities):-
    find_possible_cities(Name1, PosiibleCities1),
    find_possible_cities(Name2, PosiibleCities2),
    union(PosiibleCities1,PosiibleCities2,MergedCities),!.

% 3.5 find_mutual_activities(Name1, Name2, MutualActivities) 5 points

find_mutual_activities(Name1, Name2, MutualActivities):-
    likes(Name1,LikedActivities1,_),
    likes(Name2,LikedActivities2,_),
    intersection(LikedActivities1, LikedActivities2, MutualActivities).

% 3.6 find_possible_targets(Name, Distances, TargetList) 10 points
make_tuples([],[],[]).
make_tuples([H1|T1],[H2|T2],[Head|TailResult]):-
    make_tuples(T1,T2,TailResult),
    Head = [H1,H2].

break_tuples([],[],[]).
break_tuples([Head|Tail],[H1|T1],[H2|T2]):-
    break_tuples(Tail,T1,T2),
    Head = [H1|T3],
    T3 = [H2|_].

find_possible_targets(Name, Distances, TargetList):-
    findall(TargetName,(glanian(TargetName,Gender,_),expects(Name,ExpectedGender,_),member(Gender,ExpectedGender)),TargetList1),
    findall(Distance,(glanian_distance(Name,TargetName,Distance),member(TargetName,TargetList1)),Distances1),
    make_tuples(Distances1,TargetList1,TargetList2),
    msort(TargetList2, TargetList3),
    break_tuples(TargetList3,Distances,TargetList).

% 3.7 find_weighted_targets(Name, Distances, TargetList) 15 points

find_weighted_targets(Name, Distances, TargetList):-
    findall(TargetName,(glanian(TargetName,Gender,_),expects(Name,ExpectedGender,_),member(Gender,ExpectedGender)),TargetList1),
    findall(Distance,(weighted_glanian_distance(Name,TargetName,Distance),member(TargetName,TargetList1)),Distances1),
    make_tuples(Distances1,TargetList1,TargetList2),
    msort(TargetList2, TargetList3),
    break_tuples(TargetList3,Distances,TargetList).

% 3.8 find_my_best_target(Name, Distances, Activities, Cities, Targets) 20 points



% 3.9 find_my_best_match(Name, Distances, Activities, Cities, Targets) 25 points