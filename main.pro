% include the knowledge base
:- ['load.pro'].

% 3.1 glanian_distance(Name1, Name2, Distance) 5 points
find_distance([],[],0).

find_distance([Head1|Tail1],[Head2|Tail2],Distance):-
    find_distance(Tail1,Tail2,Distance1),
    Temp1 is Head1 - Head2,
    Temp2 is Temp1^2,
    Distance is Distance1 + Temp2.

glanian_distance(Name1,Name2,Distance):-
    expects(Name1,_,List1),
    expects(Name2,_,List2),
    find_distence(List1,List2,Distance1),
    Distance is sqrt(Distance1).
% 3.2 weighted_glanian_distance(Name1, Name2, Distance) 10 points

% 3.3 find_possible_cities(Name, CityList) 5 points

% 3.4 merge_possible_cities(Name1, Name2, MergedCities) 5 points

% 3.5 find_mutual_activities(Name1, Name2, MutualActivities) 5 points

% 3.6 find_possible_targets(Name, Distances, TargetList) 10 points

% 3.7 find_weighted_targets(Name, Distances, TargetList) 15 points

% 3.8 find_my_best_target(Name, Distances, Activities, Cities, Targets) 20 points

% 3.9 find_my_best_match(Name, Distances, Activities, Cities, Targets) 25 points
