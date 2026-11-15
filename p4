# PR4: Expert System

facts = {'fever', 'cough'}

rules = [
    ({'fever', 'cough'}, 'possible_flu'),
    ({'possible_flu'}, 'take_rest')
]


# Forward Chaining
def forward():
    known = set(facts)
    changed = True

    while changed:
        changed = False

        for conditions, result in rules:
            if conditions.issubset(known):
                if result not in known:
                    known.add(result)
                    changed = True

    return known


# Backward Chaining
def backward(goal):
    if goal in facts:
        return True

    for conditions, result in rules:
        if result == goal:
            return all(backward(x) for x in conditions)

    return False


print("Facts:", facts)
print("Forward Chaining:", forward())
print("Backward Chaining:", backward('take_rest'))
