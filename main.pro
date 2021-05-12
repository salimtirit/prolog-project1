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



% 3.7 find_weighted_targets(Name, Distances, TargetList) 15 points

% 3.8 find_my_best_target(Name, Distances, Activities, Cities, Targets) 20 points

% 3.9 find_my_best_match(Name, Distances, Activities, Cities, Targets) 25 points