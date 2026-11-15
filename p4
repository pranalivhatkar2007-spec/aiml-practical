# PR4: Expert System

facts = {'fever', 'cough'}

rules = [
    (['fever', 'cough'], 'possible_flu'),
    (['possible_flu'], 'take_rest')
]

def forward():
    known = set(facts)

    change = True
    while change:
        change = False

        for conditions, result in rules:
            if all(x in known for x in conditions):
                if result not in known:
                    known.add(result)
                    change = True

    return known


def backward(goal):
    if goal in facts:
        return True

    for conditions, result in rules:
        if result == goal:
            return all(backward(x) for x in conditions)

    return False


print("Forward Chaining:", forward())
print("Backward Chaining:", backward('take_rest'))
