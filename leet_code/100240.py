def get(x):
    mxs = max(u + v for u, v in x)
    mns = min(u + v for u, v in x)

    mxd = max(u - v for u, v in x)
    mnd = min(u - v for u, v in x)

    return max(mxs - mns, mxd - mnd)

class Solution:
    def minimumDistance(self, points: List[List[int]]) -> int:
        poss = []

        points.sort(key = lambda x: x[0] + x[1])
        poss.append(get(points[1:]))
        poss.append(get(points[:-1]))

        points.sort(key = lambda x: x[0] - x[1])
        poss.append(get(points[1:]))
        poss.append(get(points[:-1]))

        return min(poss)
