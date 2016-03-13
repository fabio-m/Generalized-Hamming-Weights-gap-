LoadPackage("guava");

# Returns the n-th Generalized Hamming Weight
HammingWeight := function(C,n)
  local li, i, x, y;
  li := Subspaces(C,n);
  li := AsSortedList(li);
  x := Size( Union(List(AsList(li[1]), k -> Support(k))) );
  for i in li do
    y := Size( Union(List(AsList(i), k -> Support(k))) );
    if y < x then
      x := y;
    fi;
  od;
  return x;
end;

# Returns the Generalized Hamming Weight Distribution
HammingWeightDistribution := function(C)
  local i, li;
  li := [];
  for i in [1..Dimension(C)] do
    Add(li, HammingWeight(C,i));
  od;
  return li;
end;

# Returns the perfect Hamming Weight Distrubution
PerfectHammingWeightDistribution := function(C)
  local i, li;
  li := [];
  for i in [1..Dimension(C)] do
    Add(li, CodeLength(C)-Dimension(C)+i);
  od;
  return li;
end;

# Returns the MDS defect vector of the code
MDSDefect := function(C)
  local i, li;
  li := [];
  for i in [1..Dimension(C)] do
    Add(li, CodeLength(C)-Dimension(C)+i-HammingWeight(C,i));
  od;
  return li;
end;
