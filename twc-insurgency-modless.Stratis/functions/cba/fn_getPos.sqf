params [
    ["_entity", objNull, [objNull, grpNull, "", locationNull, taskNull, [], 0]] // [] and 0 to handle position
];

switch (typeName _entity) do {
    case "OBJECT" : {
        getPos _entity
    };
    case "GROUP" : {
        getPos (leader _entity)
    };
    case "STRING" : {
        getMarkerPos _entity
    };
    case "LOCATION" : {
        position _entity
    };
    case "TASK" : {
        taskDestination _entity
    };
    case "ARRAY" : {
        _entity
    };
    default {_this}; // in case of position being passed not in array
};